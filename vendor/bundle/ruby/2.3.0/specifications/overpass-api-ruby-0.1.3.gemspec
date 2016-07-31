# -*- encoding: utf-8 -*-
# stub: overpass-api-ruby 0.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "overpass-api-ruby"
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Bruno Salerno"]
  s.date = "2015-08-30"
  s.description = "A Ruby wrapper for OpenStreetMap Overpass API"
  s.email = ["br.salerno@gmail.com"]
  s.homepage = "https://github.com/BrunoSalerno/overpass-api-ruby"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Returns a Hash from a query"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httpi>, ["~> 2.4.0"])
      s.add_runtime_dependency(%q<diskcached>, [">= 0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 3"])
    else
      s.add_dependency(%q<httpi>, ["~> 2.4.0"])
      s.add_dependency(%q<diskcached>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 3"])
    end
  else
    s.add_dependency(%q<httpi>, ["~> 2.4.0"])
    s.add_dependency(%q<diskcached>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 3"])
  end
end
