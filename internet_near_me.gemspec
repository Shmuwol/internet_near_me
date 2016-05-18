# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'internet_near_me/version'

Gem::Specification.new do |spec|
  spec.name          = "internet_near_me"
  spec.version       = InternetNearMe::VERSION
  spec.authors       = ["lukegrecki"]
  spec.email         = ["lukegrecki@gmail.com"]

  spec.summary       = "Look up local internet cafes and get their details via yelp."
  spec.homepage      = "https://github.com/lukegrecki/internet_near_me"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   << "internet_near_me"
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "nokogiri", "1.6.7.2"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
