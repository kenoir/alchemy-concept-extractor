alchemy-concept-extractor
=========================

[![Build Status](https://secure.travis-ci.org/BBC-Knowlearn/alchemy-concept-extractor.png?branch=master)](http://travis-ci.org/BBC-Knowlearn/alchemy-concept-extractor)


A thin client around the Alchemy REST API.

Requires an AlchemyAPI api key.

In your Gemfile:

    gem 'alchemy-concept-extractor', :git => 'https://github.com/BBC-Knowlearn/alchemy-concept-extractor.git' 

To run:

    require 'alchemy-concept-extractor'

    ConceptExtractor.extractConcepts
