require 'flowchart/choice'
require 'flowchart/decision'
require "flowchart/version"

module Flowchart
  class Chart
    def initialize(decision)
      @root_decision = decision
    end

    def decide(data)
      @root_decision.decide(data)
    end
  end
end
