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

          rdf_graph.insert person_name_statement(subject,name) 
          rdf_graph.insert person_type_statement(subject)
        end
      end

      rdf_graph
    end

    private 
    def insert_statement(statement)
      rdf_graph.insert statement
    end

    private 
    def person_name_statement(subject,name)
      object_name = RDF::Literal.new(name)
      predicate_name = FOAF.name

      person_statement = RDF::Statement.new(
        subject, 
        predicate_name, 
        object_name)
    
      person_statement
    end

    private
    def person_type_statement(subject)
      predicate_type = RDF.type
      object_person = FOAF.Person

      type_statement = RDF::Statement.new(
        subject,
        predicate_type,
        object_person)

      type_statement
    end

  end

end
