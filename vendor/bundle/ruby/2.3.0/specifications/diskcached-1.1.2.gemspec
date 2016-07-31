# -*- encoding: utf-8 -*-
# stub: diskcached 1.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "diskcached"
  s.version = "1.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Joshua Mervine"]
  s.date = "2015-04-16"
  s.description = "Simple disk cache for things like Sinatra which is implemented much like Memcached in hopes that in some cases they're interchangeable."
  s.email = ["joshua@mervine.net"]
  s.homepage = "http://diskcached.rubyops.net/"
  s.rubygems_version = "2.5.1"
  s.summary = "Simple disk cache"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
  end
end
