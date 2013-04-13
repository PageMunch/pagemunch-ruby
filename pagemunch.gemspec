# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pagemunch/version'

Gem::Specification.new do |gem|
  gem.name          = "pagemunch"
  gem.version       = Pagemunch::VERSION
  gem.authors       = ["Luke"]
  gem.email         = ["email@luke-roberts.info"]
  gem.summary       = "PageMunch" 
  gem.description   = "A client for the PageMunch web crawler API" 
  gem.homepage      = "https://github.com/PageMunch/pagemunch-ruby"
  gem.license       = "MIT"
  
  gem.files         = ['lib/pagemunch.rb']
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'faraday'
  gem.add_dependency 'faraday_middleware'
end
