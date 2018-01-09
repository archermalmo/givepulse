module Givepulse
    class ResourceMap
        def self.get_resource_class(resource)
            resource_classes = Givepulse::Resources.constants.select do |c|
                Givepulse::Resources.const_get(c).is_a? Class
            end
            map = {}
            resource_classes.each do |resource_class|
                map[resource_class.to_s.downcase.to_sym] = Givepulse::Resources.const_get(resource_class)
            end
            return unless map.key?(resource)
            map[resource]
        end
    end
end
