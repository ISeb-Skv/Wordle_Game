Gem::Specification.new do |spec|
  spec.name          = "wordle_game"
  spec.version       = "0.2.0"
  spec.authors       = ["Skvortsov Ilya"]
  spec.email         = ["ilya.skvortsov.2004@mail.com"]
  spec.summary       = %q{Wordle game gem}
  spec.description   = %q{A Ruby gem that allows you to play the popular word-guessing game Wordle in your terminal.}
  spec.homepage      = "https://github.com/SebasTheOnlyOne/wordle_game"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($\)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end