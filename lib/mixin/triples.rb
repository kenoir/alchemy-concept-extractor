module AlchemyConceptExtractor
  module Triples

    def person_triples(person)
      name = person['text']

      triples = {
        :name => {
        :subject => RDF::URI.new(person['disambiguated']['dbpedia']),
        :object => RDF::Literal.new(name),
        :predicate => FOAF.name
      },
        :type => {
        :subject => RDF::URI.new(person['disambiguated']['dbpedia']),
        :object => FOAF.Person,
        :predicate => RDF.type 
      }

      }

      triples
    end

    def place_triples(place)
      name = place['text']
      event = RDF::Vocabulary.new("http://purl.org/NET/c4dm/event.owl")

      triples = {
        :name => {
        :subject => RDF::URI.new(place['disambiguated']['dbpedia']),
        :object => RDF::Literal.new(name),
        :predicate => RDFS.label
      },
        :type => {
        :subject => RDF::URI.new(place['disambiguated']['dbpedia']),
        :object => event.place,
        :predicate => RDF.type
      }
      }

      triples
    end

  end
end
