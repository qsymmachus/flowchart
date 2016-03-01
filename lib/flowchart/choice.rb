module Flowchart
  class Choice
    def initialize(choices = [])
        @choices = choices
    end

    def decide(data)
      raise NotImplementedError
    end
  end
end
