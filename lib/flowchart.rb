require 'flowchart/choice'
require 'flowchart/decision'

class Flowchart
  def initialize(decision)
    @root_decision = decision
  end

  def decide(data)
    @root_decision.decide(data)
  end
end
