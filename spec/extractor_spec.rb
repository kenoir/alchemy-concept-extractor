require 'spec_helper'

describe ConceptExtractor do

  describe ConceptExtractor::Extractor do

    subject { ConceptExtractor::Extractor.new("key") }

    describe ConceptExtractor::Extractor, '#initialize' do

      it 'should accept and set instance variables for api_key' do
        subject.api_key.should == "key" 
      end

    end

    describe ConceptExtractor::Extractor, '#get_concepts' do

      it 'should call proxy= on rest_client, then get with the alchemy uri' do
        uri = 'http://www.example.com'
        dummy_json = '{"key":"value"}'

        expected_uri = subject.alchemy_query_uri(uri)
        expected_parsed_json = JSON.parse(dummy_json)

        RestClient.should_receive(:proxy=).ordered
        RestClient.should_receive(:get).ordered.with(
          expected_uri, 
          :accept => 'application/json').and_return(dummy_json)

          actual_parsed_json = subject.get_concepts(uri)
          expected_parsed_json.should == actual_parsed_json
      end

    end

  end

  describe ConceptExtractor::Reporter do

    subject { ConceptExtractor::Reporter.new }

    describe ConceptExtractor::Reporter, '#report' do

      it 'should return a valid report' do
        subject.report.should_not be_nil 
      end

    end

  end

  describe ConceptExtractor, '#extract_concepts' do

    it 'should accept an API key, and file location and return an array of hashes' do
      concepts = ConceptExtractor.extract_concepts("key",'/dummy/location')
      pending
    end

  end


end
