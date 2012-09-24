module AlchemyConceptExtractor
  require 'uri'
  require 'readline'
  require 'rest_client'
  require 'json'
  require 'pp'

  require_relative 'lib/extractor.rb'
  require_relative 'lib/reporter.rb'

  def self.extract(api_key,datfile_location,outfile_location)
    extractor = Extractor.new(api_key)

    uri = "http://www.example.com"
    concepts = extractor.get_concepts(uri)

    refiner = Refiner.new
    reporter = Reporter.new(concepts,refiner)

    serialised_rdf = reporter.report(:ntriples) 

    File.open(outfile_location, 'w') {|f| f.write(serialised_rdf) }
  end

end
