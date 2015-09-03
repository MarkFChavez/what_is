require "what_is/version"
require "what_is/configuration"
require "what_is/exceptions"
require "what_is/thesaurus"
require "what_is/dictionary"

module WhatIs

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  class Define
    def initialize(word, reference)
      @word = word.to_s
      @reference = reference.to_sym
    end

    def define!

      case @reference
      when :thesaurus
        WhatIs::Thesaurus.new(@word).define!
      when :dictionary
        WhatIs::Dictionary.new(@word).define!
      else
        raise WhatIs::ReferenceUndefinedException
      end

    rescue Exception => e
      default_exception_message
    end

    private

    def default_exception_message
      "ERROR: Unable to define `#{@word}`"
    end
  end
end
