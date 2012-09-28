Gem::Specification.new do |s|  
  s.name        = 'alchemy-concept-extractor'
  s.version     = '0.0.3'      
  s.date        = '2012-09-25'
  s.summary     = "Alchemy API Concept Extractor"
  s.description = "Extracts concepts for a given URI from the Alchemy API (http://www.alchemyapi.com/)" 
  s.authors     = ["Philip Lamond","Robert Kenny"]
  s.email       = 'philip.lamond@bbc.co.uk'      
  s.files       = ["lib/alchemy-concept-extractor.rb"]     
  s.homepage    = 'https://github.com/BBC-Knowlearn/alchemy-concept-extractor.git'
  s.add_dependency 'rest-client', '>= 1.6.7'
  s.add_dependency 'json', '>= 1.7.5'
  s.add_dependency 'rdf', '>= 0.3.8'
  s.add_dependency 'rdf-rdfxml', '>= 0.3.8'
  s.add_dependency 'rdf-trig', '>= 0.1.3'
  s.add_dependency 'rdf-turtle','>= 0.1.2'
  s.add_dependency 'rdf-xsd', '>= 0.3.8'
end
