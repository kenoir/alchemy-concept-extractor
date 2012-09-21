Gem::Specification.new do |s|  
  s.name        = 'alchemy-concept-extractor'
  s.version     = '0.0.1'      
  s.date        = '2012-09-21'
  s.summary     = "Alchemy API Concept Extractor"
  s.description = "Runner for REST-assured that loads double responses from the filesystem using a YAML config" 
  s.authors     = ["Philip Lamond"]
  s.email       = 'philip.lamond@bbc.co.uk'      
  s.files       = ["lib/extractor.rb"]     
  s.homepage    = 'https://github.com/BBC-Knowlearn/alchemy-concept-extractor.git'
  s.add_dependency 'rest-client', '>= 1.6.7'
  s.add_dependency 'json', '>= 1.7.5'
end

