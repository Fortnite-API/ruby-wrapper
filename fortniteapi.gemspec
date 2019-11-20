lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'fortniteapi'
  spec.version       = '0.0.1'
  spec.authors       = ['xMistt']
  spec.summary       = 'Ruby implementation for https://fortnite-api.com'
  spec.homepage      = 'https://github.com/Fortnite-API/ruby-wrapper'
    
  spec.files         = Dir['bin/*'] +
                       Dir['lib/**/*.rb']

  spec.require_paths = ['lib']


  spec.add_runtime_dependency 'httparty', '~> 0.17.1'
end
