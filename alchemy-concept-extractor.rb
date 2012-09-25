module AlchemyConceptExtractor
  require 'uri'
  require 'readline'
  require 'rest_client'
  require 'json'
  require 'pp'

  require_relative 'lib/extractor.rb'
  require_relative 'lib/reporter.rb'
  require_relative 'lib/refiner.rb'

  class ConceptExtractor
    attr :api_key
    attr :datfile_location
    attr :outfiles_location
    attr :rest_client

    def initialize(api_key,
      datfile_location = "uris.dat",
      outfiles_location = ".",
      rest_client = RestClient)

      @api_key = api_key
      @datfile_location = datfile_location
      @outfiles_location = outfiles_location
      @rest_client = rest_client
    end

    def uris
      uris_file = IO.read(@datfile_location)
      uris = uris_file.split("\n")

      uris
    end

    def extract
      extractor = Extractor.new(@api_key,@rest_client)

      uris.each do | uri |
        concepts = extractor.get_concepts(uri)

        refiner = Refiner.new
        reporter = Reporter.new(concepts,refiner)

        serialised_rdf = reporter.report(:ntriples) 

        file_location = File.join(outfiles_location,File.basename(uri))
        File.open(file_location, 'w') {|f| f.write(serialised_rdf) }
      end
    end
  end

  def self.extract(api_key,datfile_location,outfile_location,rest_client = RestClient)
    concept_extractor = ConceptExtractor.new(api_key,datfile_location,outfile_location,rest_client)
    concept_extractor.extract
  end

end
