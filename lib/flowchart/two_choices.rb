module Flowchart
  class TwoChoices < Choice
    def initialize(args)
      @first_choice = args.fetch(:first_choice)
      @second_choice = args.fetch(:second_choice)
      @choose_first = args.fetch(:choose_first)
      @choose_second = args.fetch(:choose_second)
    end

    def decide(data = nil)
      if @choose_first.call(data)
        @first_choice.decide(data)
      elsif @choose_second.call(data)
        @second_choice.decide(data)
      else
        Flowchart::NoDecision.new
      end
    end
  end
end
