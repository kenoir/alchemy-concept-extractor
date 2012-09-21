module AlchemyConceptExtractor
  require 'uri'
  require 'readline'
  require 'rest_client'
  require 'json'
  require 'pp'

  require_relative 'lib/extractor.rb'

  class Reporter

    def initialize

    end

    def report 
      "hello"
    end

  end

  def self.extract_concepts(api_key,file_location)
    extractor = Extractor.new(api_key)
    uri = "http://www.example.com"

    concepts = extractor.get_concepts(uri)

    concepts
  end

end
