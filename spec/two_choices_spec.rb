require 'spec_helper'

describe Flowchart::TwoChoices do
  describe 'instantiation' do
    it 'throws an error if expected argument key is missing' do
      @expected_keys = [:first_choice, :second_choice, :choose_first, :choose_second]

      @expected_keys.each do |excluded_key|
        expect {
          # Build an args hash with all but one of the expected keys:
          args = Hash.new(
            @expected_keys - [excluded_key].zip(
              (1...@expected_keys.length - 1).to_a
            )
          )
          Flowchart::TwoChoices.new(args)
        }.to raise_error KeyError
      end
    end
  end

  describe 'decide' do
    before do
      @first_decision = Flowchart::Decision.new('first')
      @second_decision = Flowchart::Decision.new('second')
      @first_choice = double(Flowchart::Choice::class, decide: @first_decision)
      @second_choice = double(Flowchart::Choice::class, decide: @second_decision)
    end

    context 'choose_first returns true' do
      it 'returns the result of first_choice#decide' do
        @choose_first = Proc.new { |data| true }
        @choose_second = Proc.new { |data| false }
        @two_choices = Flowchart::TwoChoices.new({
          first_choice: @first_choice,
          second_choice: @second_choice,
          choose_first: @choose_first,
          choose_second: @choose_second
        })

        expect(@two_choices.decide).to equal @first_choice.decide
      end
    end

    context 'choose_second returns true' do
      it 'returns the result of second_choice#decide' do
        @choose_first = Proc.new { |data| false }
        @choose_second = Proc.new { |data| true }
        @two_choices = Flowchart::TwoChoices.new({
          first_choice: @first_choice,
          second_choice: @second_choice,
          choose_first: @choose_first,
          choose_second: @choose_second
        })

        expect(@two_choices.decide).to equal @second_choice.decide
      end
    end

    context 'neither choose_first nor choose_second return true' do
      it 'returns an instance of Flowchart::NoChoice' do
        @choose_first = Proc.new { |data| false }
        @choose_second = Proc.new { |data| false }
        @two_choices = Flowchart::TwoChoices.new({
          first_choice: @first_choice,
          second_choice: @second_choice,
          choose_first: @choose_first,
          choose_second: @choose_second
        })

        expect(@two_choices.decide).to be_a Flowchart::NoDecision
      end
    end
  end
end
