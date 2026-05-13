require 'minitest/autorun'
require_relative 'last_will'

class LastWillTest < Minitest::Test
  def test_family_secrets_unaltered
    #skip
    assert_equal Zhang::bank_number_part(1), 8541
    assert_equal Zhang::bank_number_part(3), 8541 * 3 % 10000
    assert_equal Khan::bank_number_part(1), 4142
    assert_equal Khan::bank_number_part(3), 4142 * 3 % 10000
    assert_equal Garcia::bank_number_part(1), 4023
    assert_equal Garcia::bank_number_part(3), 4023 * 3 % 10000
    assert_equal Zhang::Red::code_fragment, 512
    assert_equal Khan::Red::code_fragment, 148
    assert_equal Garcia::Red::code_fragment, 118
    assert_equal Zhang::Blue::code_fragment, 677
    assert_equal Khan::Blue::code_fragment, 875
    assert_equal Garcia::Blue::code_fragment, 923
  end

  def test_account_number_assembly_method_in_correct_namespace
    #skip
    assert EstateExecutor.include?(assemble_account_number)
  end

  def test_account_number_assembly_method_works
    #skip
    assert_equal EstateExecutor::assemble_account_number(1), 16706
    assert_equal EstateExecutor::assemble_account_number(23), 14238
  end

  def test_code_fragment_number_assembly_method_in_correct_namespace
    #skip
    assert EstateExecutor.include?(assemble_code)
  end

  def test_code_fragments_fit
    #skip
    assert_equal EstateExecutor::assemble_code, 1925550
  end
end
