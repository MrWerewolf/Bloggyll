# Provides the tag_links filter.

# Inspired by the category page generator.
# by Dave Perrett (http://recursive-design.com/projects/jekyll-plugins/)

module Jekyll

  module Filters

    # Outputs a list of tags as comma-separated <a> links. This is used
    # to output the tag list for each post on a tag page.
    #
    #  +tags+ is the list of tags to format.
    #
    # Returns string
    def tag_links(tags)
      createLink = lambda {
        |tag| '<a href="/tags#'+tag.gsub(' ', '-')+'">'+tag+'</a>'
      }

      if tags.is_a? String
        return createLink.call(tags)
      end

      tags = tags.sort!.map do |item|
        createLink.call(item)
      end

      connector = "and"
      case tags.length
      when 0
        ""
      when 1
        tags[0].to_s
      when 2
        "#{tags[0]} #{connector} #{tags[1]}"
      else
        "#{tags[0...-1].join(', ')}, #{connector} #{tags[-1]}"
      end
    end

    # Outputs a list of tags as pipe separated <a> links. This is used
    # to output the tag list for each post on a tag page.
    #
    #  +tags+ is the list of tags to format.
    #
    # Returns string
    def tag_page_links(tags)
      createLink = lambda {
        |tag| '<a href="#'+tag.gsub(' ', '-')+'">'+tag+'</a>'
      }

      if tags.is_a? String
        return createLink.call(tags)
      end

      tags = tags.sort!.map do |item|
        createLink.call(item)
      end

      case tags.length
      when 0
        ""
      when 1
        tags[0].to_s
      else
        "#{tags.join(' | ')}"
      end
    end
  end
end
