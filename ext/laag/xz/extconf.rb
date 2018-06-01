
# -*- ruby -*-

require 'mkmf' # Ruby Standard Library

require 'laag' # MIT License
require_relative '../../../lib/laag/xz'

LAAG::BuildEnvironment
  .new(LAAG.xz, disable: %w[pre-clean])
  .script do
  default!(
    configure: [
      "--disable-lzma-links",
      "--disable-lzmadec",
      "--disable-lzmainfo",
      "--disable-scripts",
    ])
end

create_makefile 'laag/xz'
