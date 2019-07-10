
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vpr/version'

Gem::Specification.new do |spec|
  spec.name          = 'vpr'
  spec.version       = Vpr::VERSION
  spec.authors       = ['Juan Carlos Ruiz']
  spec.email         = ['JuanCrg90@gmail.com']

  spec.summary       = 'A CLI to visit quickly commits in github'
  spec.description   = 'Visit the github PR using the Commit SHA-1'
  spec.homepage      = 'https://github.com/JuanCrg90/vpr'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_runtime_dependency 'git', '~> 1.5'
  spec.add_runtime_dependency 'launchy', '~> 2.4'
  spec.add_runtime_dependency 'thor', '~> 0.20'
end
