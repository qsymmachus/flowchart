module Flowchart
  class TwoChoices < Choice
    def initialize(first_choice, second_choice)
      @first_choice = first_choice
      @second_choice = second_choice
    end

    def choose_first(data)
      raise NotImplementedError
    end

    def choose_second(data)
      raise NotImplementedError
    end

    def decide(data = nil)
      if choose_first(data)
        @first_choice.decide(data)
      elsif choose_second(data)
        @second_choice.decide(data)
      else
        Flowchart::NoChoice.new
      end
    end
  end
end
