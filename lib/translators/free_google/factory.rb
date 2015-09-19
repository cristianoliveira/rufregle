require_relative 'extractor'
require_relative 'requester'
require_relative 'translator'

##
# Responsible for create instance of {FreeGoogle::Translator}
# It holds all dependencies for this creation

module FreeGoogle
  class Factory
    def self.create()
      extractor = FreeGoogle::Extractor.new
      http_requester = FreeGoogle::Requester.new
      FreeGoogle::Translator.new(extractor, http_requester)
    end
  end
end
