require 'minitest/autorun'
require_relative 'last_will'

class LastWillTest < Minitest::Test
  def test_family_secrets_unaltered
    assert_equal 8_541, ::Zhang.bank_number_part(1)
    assert_equal 8_541 * 3 % 10_000, ::Zhang.bank_number_part(3)

    assert_equal 4_142, ::Khan.bank_number_part(1)
    assert_equal 4_142 * 3 % 10_000, ::Khan.bank_number_part(3)

    assert_equal 4_023, ::Garcia.bank_number_part(1)
    assert_equal 4_023 * 3 % 10_000, ::Garcia.bank_number_part(3)

    assert_equal 512, ::Zhang::Red.code_fragment
    assert_equal 148, ::Khan::Red.code_fragment
    assert_equal 118, ::Garcia::Red.code_fragment

    assert_equal 677, ::Zhang::Blue.code_fragment
    assert_equal 875, ::Khan::Blue.code_fragment
    assert_equal 923, ::Garcia::Blue.code_fragment
  end

  def test_account_number_assembly_method_in_correct_namespace
    assert_respond_to(::EstateExecutor, :assemble_account_number)
  end

  def test_account_number_assembly_method_works
    assert_equal 16_706, ::EstateExecutor.assemble_account_number(1)
    assert_equal 14_238, ::EstateExecutor.assemble_account_number(23)
  end

  def test_code_fragment_number_assembly_method_in_correct_namespace
    assert_respond_to(::EstateExecutor, :assemble_code)
  end

  def test_code_fragments_fit
    assert_equal 1_925_550, ::EstateExecutor.assemble_code
  end
end
