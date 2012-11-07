# -*- encoding: utf-8 -*-
require File.expand_path("../lib/residence/version", __FILE__)

Gem::Specification.new do |s|
  s.name = %q{residence}
  s.version = BrighterPlanet::Residence::VERSION

  s.authors = ["Andy Rossmeissl", "Seamus Abshere", "Ian Hough", "Matt Kling", "Derek Kastner"]
  s.date = %q{2010-12-16}
  s.summary = %q{A carbon model}
  s.description = %q{A software model in Ruby for the greenhouse gas emissions of an residence}
  s.email = %q{andy@rossmeissl.net}
  s.homepage = %q{http://github.com/brighterplanet/residence}
  
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_runtime_dependency 'earth', '~> 1.1.0'
  s.add_runtime_dependency 'emitter', '~> 1.1.0'
  s.add_runtime_dependency 'cohort_analysis', '>=1.0.3'
  s.add_runtime_dependency 'weighted_average', '>=2.0.1'
  s.add_development_dependency 'conversions'
  s.add_development_dependency 'sniff', '~> 1.1.1'
end
