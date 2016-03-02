require 'spec_helper'

describe Flowchart::Decision do
  before do
    @result = 'foo'
    @no_decision = Flowchart::Decision.new(@result)
  end

  describe 'result' do
    it 'returns the result passed at construction' do
      expect(@no_decision.result).to equal @result
    end
  end
end
