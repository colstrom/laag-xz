
# -*- ruby -*-

require 'laag/library' # MIT License

module LAAG
  XZ_GEM_ROOT = File.expand_path(File.join(__dir__, %w[.. ..]))
  XZ_ORIGIN  = 'git.tukaani.org/xz'
  XZ_VERSION = (
    $LOADED_FEATURES
      .map { |f| f.match %r{/laag-xz-(?<version>[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)} }
      .compact
      .map { |gem| gem['version'] }
      .uniq
      .first
  ) || (
    File
      .basename(XZ_GEM_ROOT)
      .match(%r{^laag-xz-(?<version>[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)})['version']
  )

  def self.xz
    @@xz ||= Library.new(
      gem_root: XZ_GEM_ROOT,
      origin:   XZ_ORIGIN,
      version:  XZ_VERSION
    )
  end
end
