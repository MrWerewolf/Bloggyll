# Source: https://gist.github.com/449509

# An example Jekyll Liquid tag. Utilizes the new plugin system.
#
# 1. Make a _plugins directory in your jekyll site, and put this class in a file there.
# 2. In anyone of your pages, you can use the 'render_time' liquid tag like so:
#     {% render_time Page generated at: %}

# In adition, you can use {% render_timestamp %} to prevent a client from
# caching a resource.  For example:
#   <link rel="stylesheet" href="/css/style.css?{% render_timestamp %}">

module Jekyll
  class RenderTimeTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "#{@text} #{Time.now}"
    end
  end

  class RenderTimestamp < Liquid::Tag

    #def initialize(tag_name, text, tokens)
    #  super
    #  @text = text
    #end

    def render(context)
      Time.now.strftime('%Y%m%d%H%M%S')
    end
  end
end

Liquid::Template.register_tag('render_time', Jekyll::RenderTimeTag)
Liquid::Template.register_tag('render_timestamp', Jekyll::RenderTimestamp)
