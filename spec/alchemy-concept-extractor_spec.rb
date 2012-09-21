require 'spec_helper'

describe AlchemyConceptExtractor do

  describe AlchemyConceptExtractor, '#extract_concepts' do

    it 'should accept an API key, and file location and return an array of hashes' do
      concepts = AlchemyConceptExtractor.extract_concepts("key",'/dummy/location')
      pending
    end

  end

end
