module Jekyll
  class SortedCategoriesBuilder < Generator

    safe true
    priority :high

    def generate(site)
      site.config['sorted_categories'] = site.categories
        .sort { |a,b| a[0].downcase <=> b[0].downcase }
        .each { |cat| cat[1].sort! { |a,b| b.date <=> a.date } }
      site.config['sorted_tags'] = site.tags
        .sort{ |a,b| a[0].downcase <=> b[0].downcase }
        .each { |tag| tag[1].sort! { |a,b| b.date <=> a.date } }
    end
  end
end
