lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "yarmcl/version"

Gem::Specification.new do |s|
  s.name        = "yarmcl"
  s.version     = YARMCL::VERSION
  s.license     = "MIT"
  s.summary     = "YARMCL"
  s.description = "YARMCL's Another Ruby Model Catalog Library"
  s.authors     = ["Evan Brodie, Nulogy Corporation"]
  s.email       = "engineering@nulogy.com"
  s.files       = Dir["{lib}/**/*.rb", "LICENSE", "README.md"]
  s.homepage    = "https://github.com/nulogy/yarmcl"

  s.add_dependency "require_all", "~> 2.0"

  s.add_development_dependency "bundler", "~> 1.16"
  s.add_development_dependency "rake", "~> 12.3"
  s.add_development_dependency "rspec", "~> 3.7"
  s.add_development_dependency "rubocop", "~> 0.57.2"
end
