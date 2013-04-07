module Pagemunch
  module Configurable
    attr_writer :key, :version

    class << self
      def keys
        [
          'key',
          'version'
        ]
      end
    end

    def configure
      yield self
      Pagemunch::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", configuration[key])
      end
      self
    end

    def configuration
      Hash[Pagemunch::Configurable.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end

  end
end
