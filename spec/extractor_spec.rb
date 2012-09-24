require 'spec_helper'

describe AlchemyConceptExtractor do

  describe AlchemyConceptExtractor::Extractor do

    subject { AlchemyConceptExtractor::Extractor.new(dummy_api_key,dummy_rest_client) }

    describe AlchemyConceptExtractor::Extractor, '#initialize' do

      it 'should accept and set instance variables for api_key' do
        subject.api_key.should == dummy_api_key 
      end

    end

    describe AlchemyConceptExtractor::Extractor, '#get_concepts' do

      it 'should call proxy= on rest_client, then get with the alchemy uri' do
        uri = 'http://www.example.com'
        dummy_json = '{"key":"value"}'

        expected_uri = subject.alchemy_query_uri(uri)
        expected_parsed_json = JSON.parse(dummy_json)

        dummy_rest_client.should_receive(:proxy=).ordered
        dummy_rest_client.should_receive(:get).ordered.with(
          expected_uri, 
          :accept => 'application/json').and_return(dummy_json)

          actual_parsed_json = subject.get_concepts(uri)
          expected_parsed_json.should == actual_parsed_json
      end

    end

  end

end
