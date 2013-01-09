lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'rubygems'
require 'rake/clean'
require 'rake/testtask'
require 'date'
require 'wmq/version'

excludes = [
    'lib/wmq/constants.rb',
    'lib/wmq/constants_admin.rb',
    'ext/wmq_structs.c',
    'ext/wmq_reason.c',
    'ext/Makefile',
    'ext/*.o',
    'ext/wmq.so',
    '*.gem',
    'nbproject'
]

Gem::Specification.new do |spec|
  spec.name              = 'rubywmq'
  spec.version           = WMQ::VERSION
  spec.platform          = Gem::Platform::RUBY
  spec.authors           = ['Reid Morrison', 'Edwin Fine']
  spec.email             = ['reidmo@gmail.com']
  spec.homepage          = 'https://github.com/reidmorrison/rubywmq'
  spec.date              = Date.today.to_s
  spec.summary           = "Native Ruby interface into WebSphere MQ"
  spec.description       = "RubyWMQ is a high performance native Ruby interface into WebSphere MQ."
  spec.files             = FileList["./**/*"].exclude(*excludes).map{|f| f.sub(/^\.\//, '')} +
      ['.document']
  spec.extensions        << 'ext/extconf.rb'
  spec.rubyforge_project = 'rubywmq'
  spec.test_file         = 'tests/test.rb'
  spec.has_rdoc          = true
  spec.required_ruby_version = '>= 1.8.4'
  spec.add_development_dependency 'shoulda'
  spec.requirements << 'WebSphere MQ v5.3, v6 or v7 Client or Server with Development Kit'
end