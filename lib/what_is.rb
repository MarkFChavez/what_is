require "what_is/version"
require "what_is/configuration"
require "what_is/exceptions"
require "net/http"
require "uri"
require "nokogiri"
require "what_is/thesaurus"

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
      raise WhatIs::NoApiKeyException unless WhatIs.configuration.thesaurus_api_key

      case @reference
      when :thesaurus
        WhatIs::Thesaurus.new(@word).define!
      when :dictionary

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

    def no_api_key_exception_message
      "ERROR: No api key provided."
    end
  end
end
