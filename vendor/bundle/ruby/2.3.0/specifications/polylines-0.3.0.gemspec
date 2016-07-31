# -*- encoding: utf-8 -*-
# stub: polylines 0.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "polylines"
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Josh Clayton"]
  s.date = "2015-06-08"
  s.email = ["joshua.clayton@gmail.com"]
  s.homepage = ""
  s.rubygems_version = "2.5.1"
  s.summary = "Easily handle Google polylines"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["= 2.4.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, ["= 2.4.0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, ["= 2.4.0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
