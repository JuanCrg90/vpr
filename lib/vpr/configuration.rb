require "singleton"

module Vpr
  class Configuration
    include Singleton

    attr_accessor :remote
  end
end
