module AlchemyConceptExtractor

  class Refiner 

    def initialize

    end

    def refine(concepts)
      RDF::Graph.new << [:hello, RDF::DC.title, "Hello, world!"]
    end

  end

end
