module AlchemyConceptExtractor
  module Triples

    include RDF

    def person_triples(person)
      event = RDF::Vocabulary.new("http://purl.org/NET/c4dm/event.owl#")

      triples = {
        :name => {
          :object=> @object, 
          :subject=> RDF::URI.new(person['disambiguated']['dbpedia']),
          :predicate => event.agent 
        }
      }

      triples
    end

    def place_triples(place)
      event = RDF::Vocabulary.new("http://purl.org/NET/c4dm/event.owl#")

      triples = {
        :name => {
          :object=> @object,
          :subject=> RDF::URI.new(place['disambiguated']['dbpedia']),
          :predicate => event.place 
        }
      }

      triples
    end

  end
end
