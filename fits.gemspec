lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fits/version'

Gem::Specification.new do |gem|
  gem.name          = "fits"
  gem.version       = Fits::VERSION
  gem.authors       = ["Howard Ding"]
  gem.email         = ["hding2@illinois.edu"]
  gem.description   = %q{Simple wrapper for Tom Habing's FITS/PREMIS web service}
  gem.summary       = %q{Generate FITS for a web url}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'typhoeus', ">= 0.6.2"
end
