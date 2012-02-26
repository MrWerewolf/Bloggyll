module Jekyll

  # StaticFile subclass that properly translates paths
  class PostFile < StaticFile
    def path
      File.join(@base, @name)
    end
  end

  class Postfiles < Generator
    safe true
    priority :lowest

    def generate(site)
      if site.config['permalink'] != 'pretty'
        puts "Sorry, postfiles only work with pretty permalinks."
        puts "Change the setting in _config.yml to use postfiles."
        return
      end

      site.posts.each do |post|
        year = post.date.strftime("%Y")
        month = post.date.strftime("%m")
        day = post.date.strftime("%d")

        # Go back to the single-file post name
        postfile_id = "#{year}-#{month}-#{day}-#{post.slug}"

        # Get the directory that files from this post would be in
        postfile_dir = File.join(site.config['source'], '_postfiles', postfile_id)

        # Add a static file entry for each postfile, if any
        addFilesToPost(site, postfile_dir, post)

        # If categories are specified by directory, check that directory for postfiles
        postfile_dir = File.join(
          site.config['source'],
          post.categories.join('/'),
          '_postfiles',
          postfile_id)

        # Add the files from the category directory, if any
        addFilesToPost(site, postfile_dir, post)
      end
    end

    def addFilesToPost(site, dir, post)
      Dir[File.join(dir, '/*')].each do |file|
        site.static_files << PostFile.new(site, dir, post.url, File.basename(file))
      end
    end
  end

  class PostfileTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text.strip
    end

    def render(context)
      File.join(context['page']['url'], @text)
    end
  end
end

Liquid::Template.register_tag('postfile', Jekyll::PostfileTag)
