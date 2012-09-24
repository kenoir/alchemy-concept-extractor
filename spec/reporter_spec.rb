require 'spec_helper'

describe AlchemyConceptExtractor do

  describe AlchemyConceptExtractor::Reporter do

    subject { AlchemyConceptExtractor::Reporter.new(dummy_concepts,dummy_refiner) }

    describe AlchemyConceptExtractor::Reporter, '#initialize' do

      it 'should accept and set a refiner and concepts' do
        subject.refiner.should == dummy_refiner 
        subject.concepts.should == dummy_concepts 
      end

    end

    describe AlchemyConceptExtractor::Reporter, '#report' do

      it 'should accept a passed type and return a valid report' do
        subject.report(:ntriples).should_not be_nil 
      end

    end

  end

end
