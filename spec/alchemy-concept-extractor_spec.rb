require 'spec_helper'


describe AlchemyConceptExtractor do

  describe AlchemyConceptExtractor, '#extract' do

    it 'should accept an API key, file location to read from andfile location to write to' do
      AlchemyConceptExtractor.extract(dummy_api_key,datfile_location,outfile_location)
    end


    it 'should create a valid rdf file' do
      AlchemyConceptExtractor.extract(dummy_api_key,datfile_location,outfile_location)
      
      graph = RDF::Graph.load(outfile_location)
    end

  end

end
