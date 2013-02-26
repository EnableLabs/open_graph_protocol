module OpenGraphProtocol
  module ViewHelpers

    def og_title(text)
      og_tag('og:title', text)
    end

    def og_type(type)
      og_tag('og:type', type)
    end

    def og_image(image)
      og_tag('og:image', image)
    end

    def og_url(url)
      og_tag('og:url', url)
    end

    private

    def og_tag(property, content)
      return if content.nil? or content.empty?
      tag :meta, {property: property, content: content}
    end

  end
end