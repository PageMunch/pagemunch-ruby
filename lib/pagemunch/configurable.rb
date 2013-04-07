module Pagemunch
  module Configurable
    attr_writer :key, :version

    def keys
      [
        'key',
        'version'
      ]
    end

    def configure
      yield self
      keys.each do |key|
        instance_variable_set(:"@#{key}", options[key])
      end
      self
    end

    private

    def options
      Hash[keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end

  end
end
