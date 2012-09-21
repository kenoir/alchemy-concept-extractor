module AlchemyConceptExtractor
  require 'uri'
  require 'readline'
  require 'rest_client'
  require 'json'
  require 'pp'

  class Extractor

    attr :rest_client, true

    public
    def get_concepts(apikey)
      urls.each{ |url| 
        alchemy_query_uri =  "#{alchemy_api_endpoint}?apikey=#{apikey}&url=#{encoded_url(url)}&outputMode=json"
        puts "GETting #{alchemy_query_uri}"
        puts '-------------------------------------------------------------------'
        puts '-------------------------------------------------------------------'
        response = get_and_parse_response(alchemy_query_uri)
        pp response
      }
    end

    private
    def initialize(rest_client)
      @rest_client = rest_client
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

    private
    def alchemy_api_endpoint
      'http://access.alchemyapi.com/calls/url/URLGetRankedNamedEntities'
    end

    private
    def get_and_parse_response(alchemy_query_uri)
        @restClient.proxy = ENV['HTTP_PROXY']
        response_as_json = @restClient.get alchemy_query_uri, :accept => 'application/json'
        response = JSON.parse(response_as_json)
        response
    end

  end

  def self.extractConcepts(apikey)
    extractor = Extractor.new
    concepts = extractor.get_concepts(apikey)
    concepts
  end

end
