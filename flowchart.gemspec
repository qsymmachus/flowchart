lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flowchart/version'

Gem::Specification.new do |spec|
  spec.name        = 'flowchart'
  spec.version     = '1.0.0'
  spec.summary     = "A library for building flowcharts, also known as decision trees!"
  spec.authors     = "John Olmsted"
  spec.email       = 'johnaolmsted@egmail.com'
  spec.homepage    = 'https://github.com/qsymmachus/flowchart'

  spec.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
