# -*- encoding: utf-8 -*-
# stub: httpi 2.4.2 ruby lib

Gem::Specification.new do |s|
  s.name = "httpi"
  s.version = "2.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Daniel Harrington", "Martin Tepper"]
  s.date = "2016-04-29"
  s.description = "Common interface for Ruby's HTTP libraries"
  s.email = "me@rubiii.com"
  s.homepage = "http://github.com/savonrb/httpi"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")
  s.rubyforge_project = "httpi"
  s.rubygems_version = "2.5.1"
  s.summary = "Common interface for Ruby's HTTP libraries"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 0"])
      s.add_runtime_dependency(%q<socksify>, [">= 0"])
      s.add_development_dependency(%q<rubyntlm>, ["~> 0.3.2"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.14"])
      s.add_development_dependency(%q<mocha>, ["~> 0.13"])
      s.add_development_dependency(%q<puma>, ["~> 2.3.2"])
      s.add_development_dependency(%q<webmock>, [">= 0"])
    else
      s.add_dependency(%q<rack>, [">= 0"])
      s.add_dependency(%q<socksify>, [">= 0"])
      s.add_dependency(%q<rubyntlm>, ["~> 0.3.2"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, ["~> 2.14"])
      s.add_dependency(%q<mocha>, ["~> 0.13"])
      s.add_dependency(%q<puma>, ["~> 2.3.2"])
      s.add_dependency(%q<webmock>, [">= 0"])
    end
  else
    s.add_dependency(%q<rack>, [">= 0"])
    s.add_dependency(%q<socksify>, [">= 0"])
    s.add_dependency(%q<rubyntlm>, ["~> 0.3.2"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, ["~> 2.14"])
    s.add_dependency(%q<mocha>, ["~> 0.13"])
    s.add_dependency(%q<puma>, ["~> 2.3.2"])
    s.add_dependency(%q<webmock>, [">= 0"])
  end
end
