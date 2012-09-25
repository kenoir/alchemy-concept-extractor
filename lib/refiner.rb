module AlchemyConceptExtractor

  class Refiner 

    def refine(concepts)

      rdf_graph = RDF::Graph.new

      concepts['entities'].each do |entity|

        if entity['type'] == 'Person'
          person_uri = nil
          if entity.has_key? 'disambiguated'
            person_uri = entity['disambiguated']['dbpedia']
          end

          # TODO: Should we make a further attempt at disambiguating?
          next if person_uri.nil?

          name = entity['text']
          subject = RDF::URI.new(person_uri)

          rdf_graph.insert person_name_statement(subject,name) 
          rdf_graph.insert person_type_statement(subject)
        elsif entity['type'] == 'Country' || entity['type'] == 'City'
          place_uri = nil
          if entity.has_key? 'disambiguated'
            place_uri = entity['disambiguated']['dbpedia']
          end

          next if place_uri.nil?

          name = entity['text']
          subject = RDF::URI.new(place_uri)

          rdf_graph.insert place_name_statement(subject,name) 
          rdf_graph.insert place_type_statement(subject)
        end
      end

      rdf_graph
    end

    private 
    def insert_statement(statement)
      rdf_graph.insert statement
    end

    private
    def place_name_statement(subject,name)
      object_name = RDF::Literal.new(name)
      predicate_name = RDFS.label

      place_statement = RDF::Statement.new(
        subject, 
        predicate_name, 
        object_name
      )

      place_statement
    end

    private
    def place_type_statement(subject)
      predicate_type = RDF.type
      event = RDF::Vocabulary.new("http://purl.org/NET/c4dm/event.owl")
      object_place = event.place

      type_statement = RDF::Statement.new(
        subject,
        predicate_type,
        object_place
      )

      type_statement
    end

    private 
    def person_name_statement(subject,name)
      object_name = RDF::Literal.new(name)
      predicate_name = FOAF.name

      person_statement = RDF::Statement.new(
        subject, 
        predicate_name, 
        object_name
      )

      person_statement
    end

    private
    def person_type_statement(subject)
      predicate_type = RDF.type
      object_person = FOAF.Person

      type_statement = RDF::Statement.new(
        subject,
        predicate_type,
        object_person
      )

      type_statement
    end

  end

end
