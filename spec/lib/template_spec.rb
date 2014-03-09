require 'spec_helper'

module Stractor
  describe Template do
    describe '#to_regexp' do
      context 'one match' do
        let(:template) { "test {{ match }} test" }

        it 'sets up the correct regex' do
          expect(Template.new(template).to_regexp).to eql(/test\ (?<match>.*?)\ test/)
        end
      end
    end
  end
end