module AlchemyConceptExtractor
  require 'uri'
  require 'readline'
  require 'rest_client'
  require 'json'
  require 'pp'

  class Extractor

    attr :rest_client, true
    attr :api_key, true

    def initialize(api_key)
      @api_key = api_key
    end

    def get_concepts(uri)
        RestClient.proxy = ENV['HTTP_PROXY']
        accept = 'application/json'
        response_as_json = RestClient.get alchemy_query_uri(uri), :accept => accept 
        response = JSON.parse(response_as_json)

        response
    end

    def alchemy_query_uri(uri)
      "#{alchemy_api_endpoint}?apikey=#{@api_key}&url=#{encoded_url(uri)}&outputMode=json"
    end

    private
    def alchemy_api_endpoint
      'http://access.alchemyapi.com/calls/url/URLGetRankedNamedEntities'
    end

    private
    def urls
      data_file.split("\n")
    end

    private
    def data_file
      IO.read("data/urls.dat")
    end

    private
    def encoded_url(sda_url)
      URI.escape(sda_url)
    end

  end

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
