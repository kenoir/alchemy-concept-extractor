require 'spec_helper'


describe AlchemyConceptExtractor do

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

      puts Dir[outfiles_location].inspect

      Dir["#{outfiles_location}/*"].each do | file_location |
        graph = RDF::Graph.load(file_location)
      end
    end

  end

end
