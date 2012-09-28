module AlchemyConceptExtractor
  require 'uri'
  require 'readline'
  require 'rest_client'
  require 'json'
  require 'pp'
  require 'rdf'

  include RDF

  require_relative 'models/extractor.rb'
  require_relative 'models/reporter.rb'
  require_relative 'models/refiner.rb'

  class ConceptExtractor
    attr :api_key
    attr :outfile_location
    attr :datfile_location
    attr :output_format
    attr :rest_client

    def initialize(api_key,
                   outfile_location,
                   datfile_location = "uris.dat",
                   output_format = :ntriples,
                   rest_client = RestClient)

      @api_key = api_key
      @outfile_location = outfile_location
      @datfile_location = datfile_location
      @output_format = output_format 
      @rest_client = rest_client
    end

    def uris
      uris_file = IO.read(@datfile_location)
      uris = uris_file.split("\n")

      uris
    end

    def extract
      extractor = Extractor.new(@api_key,@rest_client)

      File.delete @outfile_location if File.exist? @outfile_location
      uris.each do | uri |
        puts "Disambiguating: #{uri}"

        concepts = extractor.get_concepts uri

        refiner = Refiner.new
        reporter = Reporter.new(concepts,refiner)

        serialised_rdf = reporter.report(@output_format) 

        File.open outfile_location, 'a' do |file|
          file.puts serialised_rdf
        end
      end
    end
  end

  def self.extract(api_key,datfile_location,outfile_location,output_format = :ntriples, rest_client = RestClient)
    concept_extractor = ConceptExtractor.new(api_key,outfile_location,datfile_location,output_format,rest_client)
    concept_extractor.extract
  end

end
