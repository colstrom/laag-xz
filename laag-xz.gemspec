
# -*- ruby -*-

Gem::Specification.new do |spec|
  tag     = %x{git describe --tags --abbrev=0}.chomp
  commits = %x{git rev-list --count #{tag}..HEAD}.chomp

  spec.name          = "laag-xz"
  spec.version       = "#{tag}.#{commits}"
  spec.authors       = ["Chris Olstrom"]
  spec.email         = ["chris@olstrom.com"]
  spec.summary       = "Library as a Gem - xz"
  spec.homepage      = "https://github.com/colstrom/laag-xz"
  spec.licenses      = ['LGPL-2.1', 'Nonstandard']
  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/laag/xz/extconf.rb"]

  spec.add_runtime_dependency 'laag', '~> 0.4', '>= 0.4.4'
end
