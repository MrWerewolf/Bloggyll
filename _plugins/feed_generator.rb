require 'atom/feed'
require 'uri'

module Jekyll

  # Represents a feed to be generated.
  class FeedFile < StaticFile
    def initialize(site, base, dir, name, posts)
      @site = site
      @base = base
      @dir  = dir
      @name = name
      @posts = posts
    end

    def url
      return @url if @url

      url = '/' + @dir.gsub(/\/\//, "/") + '/' + @name

      # sanitize url
      @url = url.split('/').reject{ |part| part =~ /^\.+$/ }.join('/')
      @url = URI.escape(@url)
      @url
    end

    def write(dest)
      dest_path = destination(dest)

      feed = self.createFeed

      FileUtils.mkdir_p(File.dirname(dest_path))
      File.open(dest_path, 'w') { |f| f.write(feed.to_s) }

      true
    end

    # Creates our feed using the Atom library.
    def createFeed
      feed = Atom::Feed.new self.url
      feed.id = @site.config['url']
      feed.title = @site.config['name']
      feed.subtitle = @site.config['tagline'] if @site.config['tagline']
      feed.updated = Time.now

      # Link to self
      link_self = feed.links.new
      link_self.rel = 'self'
      link_self.href = self.url

      # Alternate link
      link_alt = feed.links.new
      link_alt.href = URI.escape(@site.config['url'])

      # (Site) Author info
      if @site.config['author']
        author = feed.authors.new
        author.name = @site.config['author']
        author.email = @site.config['email'] if @site.config['email']
      end

      # Insert post entires
      @posts.each do |post|
        entry = feed.entries.new
        entry.id = post.permalink
        entry.title = post.data['title']
        entry.updated = post.date

        link_alt = entry.links.new
        link_alt.href = URI.escape(post.url)

        post.categories.each do |c|
          category = entry.categories.new
          category.term = c
        end

        post.transform
        entry.content = post.content
        entry.content.type = 'html'
      end

      feed
    end
  end

  class FeedGenerator < Generator
    safe true
    priority :lowest

    def generate(site)
      feed_dir = site.config['feed_dir'] || 'feeds'

      # Generate our feed for the whole site.
      site.static_files << FeedFile.new(
          site,
          site.dest,
          feed_dir,
          'atom.xml',
          site.site_payload['site']['posts'])

      # Generate a feed for each category.
      site.site_payload['site']['categories'].each do |category, pages|
        site.static_files << FeedFile.new(
            site, site.dest,
            File.join(feed_dir, category),
            'atom.xml',
            pages)
      end
    end
  end
end