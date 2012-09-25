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

          # TODO: Should we make a further attempt at disambiguating?
          next if person_uri.nil?
      
          name = entity['text']
          subject = RDF::URI.new(person_uri)

          predicate_name = FOAF.name
          predicate_type = RDF.type

          object_name = RDF::Literal.new(name)
          object_person = FOAF.Person

          type_statement = RDF::Statement.new(
            subject,
            predicate_type,
            object_person)

          person_statement = RDF::Statement.new(
            subject, 
            predicate_name, 
            object_name)

          rdf_graph.insert type_statement 
          rdf_graph.insert person_statement
        end
      end

      rdf_graph
    end

  end

end
