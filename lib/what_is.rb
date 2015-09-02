require "what_is/version"

module WhatIs
  class Define
    def initialize(word)
      @has_definition = false
    end

    def define!
      "sample"
    end

    def has_definition?
      @has_definition
    end
  end
end
