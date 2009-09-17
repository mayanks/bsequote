require 'rubygems'
require 'rake/gempackagetask'
require 'rake/rdoctask'
require 'rake/testtask'

spec = Gem::Specification.new do |s| 
  s.name = "BseQuote"
  s.version = "1.0.0"
  s.author = "Mayank Sharma"
  s.email = "mayanks@gmail.com"
  s.homepage = "http://mayanks.blogspot.com/"
  s.platform = Gem::Platform::RUBY
  s.summary = "This gem downloads the BSE stock quote from http://bseindia.com and returns in a hash"
  s.files = FileList["{lib}/*"].to_a
  s.require_path = "lib"
  s.test_files = FileList["{test}/**/*test.rb"].to_a
  s.has_rdoc = true
  s.extra_rdoc_files = ["README"]
#  s.add_dependency("ruby", ">= 1.8.6")
end

Rake::GemPackageTask.new(spec) do |pkg| 
  pkg.need_tar = true 
end 

