require 'spec_helper'

describe AlchemyConceptExtractor do

  describe AlchemyConceptExtractor::Refiner do

    subject { AlchemyConceptExtractor::Refiner.new }

    describe AlchemyConceptExtractor::Refiner, '#refine' do

      private
      def stub_concepts
        path = File.expand_path('./spec/data/jupiter.json')
        file = File.new(path)
        json = file.read
        concepts = JSON.parse(json)
        concepts
      end

      def people_query
        query = RDF::Query.new({
          :person => {
            RDF.type  => FOAF.Person,
            FOAF.name => :name,
          }
        })
        query
      end

      it 'should accept a set of concepts and return a valid graph' do
        refined_graph = subject.refine(stub_concepts)

        refined_graph.should be_an_instance_of(RDF::Graph)
      end

      it 'should return a list of people in the graph' do
        refined_graph = subject.refine(stub_concepts)

        solutions = people_query.execute(refined_graph)
        solutions.count.should > 0

        solutions.each do |solution|
          solution.name.should_not be_nil
        end
      end

      it 'should return a list of places in the graph' do
        pending
      end

    end

  end

end
