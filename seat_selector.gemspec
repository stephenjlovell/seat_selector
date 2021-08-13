# encoding: utf-8
require File.expand_path('../lib/seat_selector/version', __FILE__)

Gem::Specification.new do |s|
  s.name                        = 'seat_selector'
  s.version                     = SeatSelector::VERSION.to_s
  s.date                        = Time.now.strftime('%Y-%m-%d')
  s.summary                     = 'Finds the best seat(s) at a given venue.'
  s.description                 = 'A simple practice app demonstrating how to make a gem.'
  s.homepage                    = 'https://github.com/stephenjlovell/seat_selector'
  s.email                       = ['sjlovell34@gmail.com']
  s.authors                     = ['Steve Lovell']
  s.platform                    = Gem::Platform::RUBY
  s.license                     = 'MIT'
  s.files                       = %w(Gemfile) + Dir.glob('{lib}/**/*')
  s.executables                 = Dir.glob('bin/*').map { |f| File.basename(f) }
  s.extra_rdoc_files            = %w(LICENSE README.md CHANGELOG.md)
  s.require_paths               = ['lib']
  s.required_ruby_version       = '>= 2.7.3'
  s.add_development_dependency  'rspec', '~> 3.10'
end
