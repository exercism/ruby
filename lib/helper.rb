XRUBY_ROOT = File.join(File.dirname(__FILE__), '..').freeze
XRUBY_LIB = File.join(XRUBY_ROOT, 'lib').freeze
METADATA_REPOSITORY_PATH = File.join(XRUBY_ROOT, '..', 'x-common').freeze

$LOAD_PATH.unshift(XRUBY_LIB)
