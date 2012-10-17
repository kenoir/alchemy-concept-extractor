require 'spec_helper'

describe AlchemyConceptExtractor do

  describe AlchemyConceptExtractor::Refiner do

    subject { AlchemyConceptExtractor::Refiner.new }

    describe AlchemyConceptExtractor::Refiner, '#refine' do

      it 'should accept a set of concepts and return a valid graph' do
        refined_graph = subject.refine(stub_concepts)

        refined_graph.should be_an_instance_of(RDF::Graph)
      end

      it 'should return a list of uris about a concept in the graph' do
        refined_graph = subject.refine(stub_concepts)

        solutions = about_query.execute(refined_graph)
        solutions.count.should > 0

        solutions.each do |solution|
          solution.uri.should_not be_nil
        end
      end

    end

  end

end
