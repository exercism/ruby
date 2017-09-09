EXERCISM_RUBY_ROOT = File.join(File.dirname(__FILE__), '..').freeze
EXERCISM_RUBY_LIB = File.join(EXERCISM_RUBY_ROOT, 'lib').freeze
EXERCISM_RUBY_DOCS = File.join(EXERCISM_RUBY_ROOT, 'docs/EXERCISE_README_INSERT.md').freeze
METADATA_REPOSITORY_PATH = File.join(EXERCISM_RUBY_ROOT, '..', 'problem-specifications').freeze

$LOAD_PATH.unshift(EXERCISM_RUBY_LIB)
