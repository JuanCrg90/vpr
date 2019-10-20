require "singleton"

module Vpr
  class Configuration
    include Singleton

    attr_accessor :remote

    class << self
      def method_missing method, *args
        instance.send(method, *args)
      rescue NoMethodError
        super
      end

      def respond_to_missing?(method_name, include_private = false)
        ["remote"].include?(method_name) || super
      end
    end

    def initialize
      super
      @remote = :origin
    end
  end
end
