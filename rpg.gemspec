# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rpg/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Michal Krzyzanowski"]
  gem.email         = ["michal.krzyzanowski+github@gmail.com"]
  gem.description   = %q{Real Pesel Generator}
  gem.summary       = %q{Gem for generating valid PESEL numbers}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rpg"
  gem.require_paths = ["lib"]
  gem.version       = Rpg::VERSION
end
