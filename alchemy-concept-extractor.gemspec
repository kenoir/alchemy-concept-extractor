Gem::Specification.new do |s|  
  s.name        = 'alchemy-concept-extractor'
  s.version     = '0.0.2'      
  s.date        = '2012-09-25'
  s.summary     = "Alchemy API Concept Extractor"
  s.description = "Extracts concepts for a given URI from the Alchemy API (http://www.alchemyapi.com/)" 
  s.authors     = ["Philip Lamond"]
  s.email       = 'philip.lamond@bbc.co.uk'      
  s.files       = ["alchemy-concept-extractor.rb"]     
  s.homepage    = 'https://github.com/BBC-Knowlearn/alchemy-concept-extractor.git'
  s.add_dependency 'rest-client', '>= 1.6.7'
  s.add_dependency 'json', '>= 1.7.5'
end
