module AlchemyConceptExtractor
  require_relative 'mixin/triples.rb'

  class Refiner 

    include Triples

    def refine(concepts)
      rdf_graph = RDF::Graph.new
      all_triples = Array.new
      
      @object = concepts['url']

      concepts['entities'].each do | entity |

        case entity['type']
        when "City" || "Country" 
          all_triples.concat triples(entity) { place_triples(entity) }
        when "Person" 
          all_triples.concat triples(entity) { person_triples(entity) }
        end
      end

      statements(all_triples).each do | statement |
        rdf_graph.insert statement  
      end

      rdf_graph
    end

    private 
    def triples(entity)
      triples = Array.new
      uri = disambiguated_uri(entity)
      return triples if uri.nil?

      new_triples = yield
      new_triples.each do | key,triple |
        triples.push(triple)
      end

      triples
    end

    private
    def statements(triples)
      statements = Array.new

      triples.each do | triple |
        statement = RDF::Statement.new(
          triple[:subject], 
          triple[:predicate],
          triple[:object]
        )
        statements.push(statement)
      end

      statements
    end
    
    private 
    def disambiguated_uri(entity)
      uri = nil
      if entity.instance_of?(Hash) and entity.has_key? 'disambiguated'
        uri = entity['disambiguated']['dbpedia']
      end
    
      uri
    end
  end
end
