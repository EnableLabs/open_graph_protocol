module OpenGraphProtocol
  module ViewHelpers

    # produce meta tags for the passed map
    def og(map)
      # delegate to recursive algorithm 
      og_tags_from_map(map)
    end

    private

    # recursively iterate a multi-demensional map and procude tags
    def og_tags_from_map(map,  parent = nil, response = nil)
      #create the response if it doesn't exist
      response = ActiveSupport::SafeBuffer.new if response.nil?
      # iterate over the map producing tags
      map.each do |key,value|
        # skip keys with empty values
        next if value.nil? or value.empty?
        # delegate where the value is an array
        if value.is_a? Array
          og_tag_from_array value, og_create_parent(key, parent), response
          next
        # delegate when the value is a map
        elsif value.is_a? Hash 
          og_tags_from_map value, og_create_parent(key, parent), response
          next
        end
        # otherwise, append the tag
        og_append_tag key, value, response, parent
      end
      response
    end

    # deal with an element in the map being an array
    def og_tag_from_array(array, parent = nil, response = nil)
      array.each do |value|
        # delegate if the value is a hash
        if value.is_a? Hash
          og_tags_from_map value, parent, response
          next
        end
        # otherwise, append the tag
        og_append_tag parent, value, response 
      end
    end

    # if there's a parent, pre-pend it to the key
    def og_create_parent(key, parent = nil)
      return "#{parent}:#{key.to_s}" unless parent.nil?
      key.to_s
    end

    # append a tag to the response
    def og_append_tag(key, value, response, parent = nil)
      #create the response if it doesn't exist
      response = ActiveSupport::SafeBuffer.new if response.nil?
      # put new line between elements
      response << "\n" unless response.empty?
      # write the tag
      response << og_tag(key, value, parent)
    end

    # generate a tag for the key, value pair
    def og_tag(key, value, parent = nil)
      # start with "og:"
      property = "og:"
      # next comes the parent, if it exists
      property << "#{parent}:" unless parent.nil?
      # and finally the key
      property << key.to_s
      # spit out the meta tag
      tag :meta, {property: property, content: value}
    end
  end
end