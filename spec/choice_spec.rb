require 'spec_helper'

describe Flowchart::Choice do
  before do
    @choice = Flowchart::Choice.new
  end

  describe 'decide' do
    it 'raises a NotImplementedError' do
      expect { @choice.decide }.to raise_error(NotImplementedError)
    end
  end
end
