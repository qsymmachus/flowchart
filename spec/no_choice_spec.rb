require 'spec_helper'

describe Flowchart::NoChoice do
  before do
    @no_choice = Flowchart::NoChoice.new
  end

  describe 'decide' do
    it 'returns an instance of Flowchart::NoDecision' do
      expect(@no_choice.decide).to be_a Flowchart::NoDecision
    end
  end
end
