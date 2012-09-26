alchemy-concept-extractor
=========================

[![Build Status](https://secure.travis-ci.org/BBC-Knowlearn/alchemy-concept-extractor.png?branch=master)](http://travis-ci.org/BBC-Knowlearn/alchemy-concept-extractor)


A thin client around the Alchemy REST API.

Requires an AlchemyAPI api key.

In your Gemfile:

    gem 'alchemy-concept-extractor', :git => 'https://github.com/BBC-Knowlearn/alchemy-concept-extractor.git' 

To run:

    require_relative 'alchemy-concept-extractor.rb'

    AlchemyConceptExtractor.extract(
      'api_key',
      'location_of_newline_separated_urls_in_file',
      'location_of_output_files'
    )
