module ConceptExtractor
  require 'uri'
  require 'readline'
  require 'rest_client'
  require 'json'
  require 'pp'

  class Extractor

    def sda_url_base
      'http://www.bbc.co.uk/science/space/solarsystem/sun_and_planets'
    end

    def encoded_sda_url_base
      URI.escape(sda_url_base)
    end

    def alchemy_api_endpoint
      'http://access.alchemyapi.com/calls/url/URLGetRankedNamedEntities'
    end

    def apikey
      apikey = nil
      puts 'Paste in your AlchemyAPI API key and press enter. Then press ^D.'
      while buf = Readline.readline("> ", true)
           apikey = buf
      end
      apikey
    end

    def entities
      ['sun','mercury_(planet)','venus','earth','mars','jupiter','saturn','uranus','neptune']
    end

    def get_and_parse_response(alchemy_query_uri)
        RestClient.proxy = ENV['HTTP_PROXY']
        response_as_json = RestClient.get alchemy_query_uri, :accept => 'application/json'
        response = JSON.parse(response_as_json)
        response
    end

    def get_concepts(apikey)
      entities.each{ |entity| 
        alchemy_query_uri =  "#{alchemy_api_endpoint}?apikey=#{apikey}&url=#{encoded_sda_url_base}/#{entity}&outputMode=json"
        puts "GETting #{alchemy_query_uri}"
        puts '-------------------------------------------------------------------'
        puts '-------------------------------------------------------------------'
        response = get_and_parse_response(alchemy_query_uri)
        pp response
      }
    end

  end

  def self.extractConcepts
    extractor = Extractor.new
    apikey = extractor.apikey
    concepts = extractor.get_concepts(apikey)
    concepts
  end

end
