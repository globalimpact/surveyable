# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'surveyable/version'

Gem::Specification.new do |spec|
  spec.name          = "surveyable"
  spec.version       = Surveyable::VERSION
  spec.authors       = ["Lee Dykes"]
  spec.email         = ['lee.dykes@charity.org']

  spec.summary       = 'Models for attaching questions to a survey (polymorphic) and answers to a response (polymorphic)'
  spec.description   = 'Models for attaching questions to a survey (polymorphic) and answers to a response (polymorphic)'
  spec.homepage      = 'https://github.com/globalimpact/surveyable'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "charity.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.10"
  #spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "activerecord", "~> 4.0", '>=4.0.0'
end
