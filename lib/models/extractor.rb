module AlchemyConceptExtractor

  class Extractor
    require 'rest_client'

    attr :rest_client, true
    attr :api_key, true

    def initialize(api_key,rest_client)
      @rest_client = rest_client
      @api_key = api_key
    end

    def get_concepts(uri) 

      @rest_client.proxy = ENV['HTTP_PROXY']
      accept = 'application/json'
      response_as_json = @rest_client.get alchemy_query_uri(uri), :accept => accept 
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
    def encoded_url(sda_url)
      URI.escape(sda_url)
    end

  end

end
