# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gif_tool/version"

Gem::Specification.new do |s|
  s.name        = "GifTool"
  s.version     = GifTool::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mariusz Koziel"]
  s.email       = ["adept_koza@o2.pl"]
  s.homepage    = ""
  s.summary     = %q{Gif Tool}
  s.description = %q{Sample gem to read and convert gif format data}

  s.rubyforge_project = "GifTool"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
