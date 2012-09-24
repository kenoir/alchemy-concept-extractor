require 'spec_helper'


describe AlchemyConceptExtractor do

  describe AlchemyConceptExtractor, '#uris' do
      
    it 'return an array of URIs' do
      uris = AlchemyConceptExtractor.uris(datfile_location)
      uris.should be_an_instance_of(Array)
      uris.count.should > 0
      uris.first.should == "http://www.example.com/1"
    end

  end

  describe AlchemyConceptExtractor, '#extract' do

    it 'should accept an API key, file location to read from andfile location to write to' do
      AlchemyConceptExtractor.extract(
        dummy_api_key,
        datfile_location,
        outfiles_location,
        dummy_rest_client)
    end

    it 'should create a set of valid rdf files' do
      AlchemyConceptExtractor.extract(
        dummy_api_key,
        datfile_location,
        outfiles_location,
        dummy_rest_client)

      Dir["#{outfiles_location}/*"].each do | file_location |
        graph = RDF::Graph.load(file_location)
      end
    end

  end

end
