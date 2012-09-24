module AlchemyConceptExtractor
  require 'uri'
  require 'readline'
  require 'rest_client'
  require 'json'
  require 'pp'

  require_relative 'lib/extractor.rb'
  require_relative 'lib/reporter.rb'

  def self.extract(api_key,datfile_location,outfile_location,rest_client = RestClient)
    extractor = Extractor.new(api_key,rest_client)

    uris = ["http://www.example.com/resource"]
    
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
