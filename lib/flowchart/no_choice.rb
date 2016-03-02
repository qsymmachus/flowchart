module Flowchart
  class NoChoice < Choice
    def decide(data = nil)
      Flowchart::NoDecision.new
    end
  end
end
