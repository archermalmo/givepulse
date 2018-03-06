lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'givepulse/version'

Gem::Specification.new do |spec|
    spec.name          = 'givepulse'
    spec.version       = Givepulse::VERSION
    spec.authors       = ['Archer Malmo']
    spec.email         = ['support@archermalmo.com']

    spec.summary       = "A wrapper gem around Givepulse's API"
    spec.description   = "A wrapper gem around Givepulse's API"
    spec.homepage      = 'https://github.com/archermalmo/givepulse'
    spec.license       = 'MIT'

    spec.files = `git ls-files -z`.split("\x0").reject do |f|
        f.match(%r{^(test|spec|features)/})
    end
    spec.bindir        = 'exe'
    spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
    spec.require_paths = ['lib']

    spec.add_development_dependency 'bundler', '~> 1.15'
    spec.add_development_dependency 'dotenv', '~> 2.2'
    spec.add_development_dependency 'pry', '~> 0.11'
    spec.add_development_dependency 'rake', '~> 10.0'
    spec.add_development_dependency 'rspec', '~> 3.0'
    spec.add_development_dependency 'rubocop', '~> 0.51'
    spec.add_development_dependency 'timecop', '~> 0.9'
    spec.add_development_dependency 'webmock', '~> 3.1'
end
