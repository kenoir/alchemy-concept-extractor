require_relative 'alchemy-concept-extractor.rb'

AlchemyConceptExtractor.extract(
  'api_key',
  'data/urls.dat',
  'data/out/out.ntriples')

