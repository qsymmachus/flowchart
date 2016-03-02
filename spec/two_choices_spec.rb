require 'spec_helper'

describe Flowchart::TwoChoices do
  before do
    @first_choice = Flowchart::Choice.new
    @second_choice = Flowchart::Choice.new
    @choices = Flowchart::TwoChoices.new(@first_choice, @second_choice)
  end

  describe 'decide' do
    it 'raises a NotImplementedError' do
      expect { @choices.decide }.to raise_error(NotImplementedError)
    end
  end
end
