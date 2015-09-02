module WhatIs
  class Configuration
    attr_accessor :thesaurus_api_key, :dictionary_api_key

    def initialize
      @thesaurus_api_key = "invalid"
      @dictionary_api_key = "invalid"
    end
  end
end
