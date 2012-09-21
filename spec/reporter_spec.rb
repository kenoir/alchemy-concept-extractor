require 'spec_helper'

describe AlchemyConceptExtractor do
  describe AlchemyConceptExtractor::Reporter do

    subject { AlchemyConceptExtractor::Reporter.new }

    describe AlchemyConceptExtractor::Reporter, '#report' do

      it 'should return a valid report' do
        subject.report.should_not be_nil 
      end

    end

  end
end
