MRuby::Gem::Specification.new('mruby-rspec') do |spec|
  spec.license = 'MIT'
  spec.authors = [
    'Seba Gamboa',
    'mruby developers',
    'Ryo Okubo'
  ]
  spec.summary = %q{rspec for mruby}
  spec.version = '0.0.1'

  spec.test_rbfiles = Dir.glob("#{dir}/spec/**/*_spec.rb")

  # Required to print test errors
  spec.add_dependency('mruby-print', :core => 'mruby-print')
end
