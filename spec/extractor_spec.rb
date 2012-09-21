require 'spec_helper'

describe ConceptExtractor do
  
  describe ConceptExtractor::Extractor, '#get_concepts' do

    it 'should return a string of concepts' do
      restClient = double('RestClient')
      extractor = ConceptExtractor::Extractor.new(restClient)
      extractor.get_concepts('testkey')
    end
  end

  it "should return a string" do
    pending
    concepts = ConceptExtractor.extractConcepts("testkey")
    concepts.should be_an_instance_of(String)
  end

end
