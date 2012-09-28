module AlchemyConceptExtractor
  require 'rdf'
  require 'rdf/rdfxml'
  require 'rdf/trig'

  class Reporter

    attr :graph

    def initialize(graph)
      @graph = graph
    end

    def report(format) 
      Reporter.serialize(@graph,format)
    end

    def self.serialize(graph,format)
      graph.dump(format)
    end

  end
end
