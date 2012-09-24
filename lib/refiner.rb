module AlchemyConceptExtractor

  class Refiner 

    def refine(concepts)

      rdf_graph = RDF::Graph.new

      concepts['entities'].each do |entity|
        if entity['type'] == 'Person'
       
          person_uri = ""
          if entity['disambiguated'].nil?
            person_uri = entity['dbpedia']
          else
            person_uri = entity['disambiguated']['dbpedia']
          end
      
          name = entity['text']
          s = RDF::URI.new(person_uri)
          p = FOAF.name
          o = RDF::Literal.new(name)
          person_statement = RDF::Statement.new(s, p, o)

          rdf_graph.insert person_statement
        end
      end

      rdf_graph
    end

  end

end
