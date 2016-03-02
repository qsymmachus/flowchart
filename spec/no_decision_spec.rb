require 'spec_helper'

describe Flowchart::NoDecision do
  before do
    @no_decision = Flowchart::NoDecision.new
  end

  describe 'result' do
    it 'returns nil' do
      expect(@no_decision.result).to be_nil
    end
  end
end
