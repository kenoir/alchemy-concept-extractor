module AlchemyConceptExtractor
  module Triples

    include RDF

    def about_triples(thing)
      triples = {
        :name => {
          :subject => RDF::URI.new(@object),
          :predicate => RDF.about,
          :object => RDF::URI.new(thing['disambiguated']['dbpedia'])
        }
      }

      triples
    end

  end
end
