module AlchemyConceptExtractor
  require 'uri'
  require 'readline'
  require 'rest_client'
  require 'json'
  require 'pp'

  require_relative 'lib/extractor.rb'
  require_relative 'lib/reporter.rb'

  def self.uris(datfile_location)
    uris_file = IO.read(datfile_location)
    uris = uris_file.split("\n")

    uris
  end

  def self.extract(api_key,datfile_location,outfile_location,rest_client = RestClient)
    extractor = Extractor.new(api_key,rest_client)

    uris(datfile_location).each do | uri |
      concepts = extractor.get_concepts(uri)

      refiner = Refiner.new
      reporter = Reporter.new(concepts,refiner)

      serialised_rdf = reporter.report(:ntriples) 

      file_location = File.join(outfiles_location,File.basename(uri))
      File.open(file_location, 'w') {|f| f.write(serialised_rdf) }
    end
  end

end
