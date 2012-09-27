require 'spec_helper'


describe AlchemyConceptExtractor do

  describe AlchemyConceptExtractor::ConceptExtractor do

    subject { AlchemyConceptExtractor::ConceptExtractor.new(
      dummy_api_key,
      outfile_location,
      datfile_location,
      output_format,
      dummy_rest_client)
    }

    describe AlchemyConceptExtractor::ConceptExtractor, '#uris' do
      it 'return an array of URIs' do
        uris = subject.uris
        uris.should be_an_instance_of(Array)
        uris.count.should > 0
        uris.first.should == "http://www.example.com/1"
      end
    end

    describe AlchemyConceptExtractor::ConceptExtractor, '#initialise' do
      it 'should accept and set an API key, file location to read from, file location to write to, and output type' do
        subject.api_key.should == dummy_api_key
        subject.datfile_location.should == datfile_location
        subject.outfile_location.should == outfile_location
        subject.output_format.should == output_format
        subject.rest_client.should == dummy_rest_client
      end
    end

    describe AlchemyConceptExtractor::ConceptExtractor, '#extract' do
      it 'should create a single valid rdf file' do
        subject.extract

        graph = RDF::Graph.load(outfile_location)
      end

      it 'should accept different output formats (:ntriples,:rdfxml,:nquads,:trig)  and write the appropriate output' do
        formats = [:ntriples,:rdfxml,:nquads,:trig]
        formats.each do |format|
          concept_extractor =  AlchemyConceptExtractor::ConceptExtractor.new(
            dummy_api_key,
            outfile_location,
            datfile_location,
            format,
            dummy_rest_client
          )

          concept_extractor.extract

          Dir["#{outfile_location}/*"].each do | file_location |
            should_not_raise_bad_format_exception(format,file_location)
          end
        end

      end
    end

  end

  describe AlchemyConceptExtractor, '#extract' do

    it 'should create a new instance of ConceptExtractor and call extract on it' do
      concept_extractor = double('concept_extractor')
      concept_extractor.should_receive(:extract)

      AlchemyConceptExtractor::ConceptExtractor.should_receive(:new) { concept_extractor }

      AlchemyConceptExtractor.extract(dummy_api_key,datfile_location,outfile_location,output_format)
    end

  end

end
