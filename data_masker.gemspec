# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'data_masker/version'

Gem::Specification.new do |spec|
  spec.name          = 'data_masker'
  spec.version       = DataMasker::VERSION
  spec.authors       = ['Peak Xu']
  spec.email         = ['peak.xu@gmail.com']

  spec.summary       = 'Fast way to mask user data for testing or demos'
  spec.description   = 'Mask user data like names in a quick and deterministic'\
                       ' way'
  spec.homepage      = 'https://github.com/peakxu/data_masker'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'pry', '~> 0.10.3'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.4.0'
  spec.add_development_dependency 'rubocop', '~> 0.35.1'
end
