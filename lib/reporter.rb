module AlchemyConceptExtractor
  require 'rdf'
  require 'rdf/rdfxml'
  require 'rdf/trig'

  class Reporter

    attr :concepts
    attr :refiner

    def initialize(concepts,refiner)
      @refiner = refiner
      @concepts = concepts
    end

    def report(format) 
      graph = refiner.refine(concepts) 
      graph.dump(format)
    end

  end
end
