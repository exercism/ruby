require_relative '../lib/generator'
require 'minitest/autorun'

class GeneratorTest < Minitest::Test
  def test_importning_toml
    assert_equal %w[1e22cceb-c5e4-4562-9afe-aef07ad1eaf4 79ae3889-a5c0-4b01-baf0-232d31180c08 ec7000a7-3931-4a17-890e-33ca2073a548 32dd261c-0c92-469a-9c5c-b192e94a63b0 ae2ac9fa-a606-4d05-8244-3bcc4659c1d4 0e4b1e7c-1a6d-48fb-81a7-bf65eb9e69f9 6a078f49-c68d-4b7b-89af-33a1a98c28cc],
      Generator.new("two_fer").toml("generatorv2/test/misc/tests.toml")
  end

  def test_importing_toml_with_no_include
    assert_equal %w[1e22cceb-c5e4-4562-9afe-aef07ad1eaf4 79ae3889-a5c0-4b01-baf0-232d31180c08 ec7000a7-3931-4a17-890e-33ca2073a548 32dd261c-0c92-469a-9c5c-b192e94a63b0 ae2ac9fa-a606-4d05-8244-3bcc4659c1d4 6a078f49-c68d-4b7b-89af-33a1a98c28cc],
      Generator.new("two_fer").toml("generatorv2/test/misc/tests_no_include.toml")
  end

  def test_importing_toml_with_all_excluded
    assert_empty Generator.new("two_fer").toml("generatorv2/test/misc/tests_all_excluded.toml")
  end
end
