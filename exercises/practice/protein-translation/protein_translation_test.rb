require 'minitest/autorun'
require_relative 'protein_translation'

class ProteinTranslationTest < Minitest::Test
  def test_empty_rna_sequence_results_in_no_proteins
    # skip
    strand = ''
    actual = Translation.of_rna(strand)
    expected = %w[]
    assert_equal expected, actual
  end

  def test_methionine_rna_sequence
    skip
    strand = 'AUG'
    actual = Translation.of_rna(strand)
    expected = %w[Methionine]
    assert_equal expected, actual
  end

  def test_phenylalanine_rna_sequence_1
    skip
    strand = 'UUU'
    actual = Translation.of_rna(strand)
    expected = %w[Phenylalanine]
    assert_equal expected, actual
  end

  def test_phenylalanine_rna_sequence_2
    skip
    strand = 'UUC'
    actual = Translation.of_rna(strand)
    expected = %w[Phenylalanine]
    assert_equal expected, actual
  end

  def test_leucine_rna_sequence_1
    skip
    strand = 'UUA'
    actual = Translation.of_rna(strand)
    expected = %w[Leucine]
    assert_equal expected, actual
  end

  def test_leucine_rna_sequence_2
    skip
    strand = 'UUG'
    actual = Translation.of_rna(strand)
    expected = %w[Leucine]
    assert_equal expected, actual
  end

  def test_serine_rna_sequence_1
    skip
    strand = 'UCU'
    actual = Translation.of_rna(strand)
    expected = %w[Serine]
    assert_equal expected, actual
  end

  def test_serine_rna_sequence_2
    skip
    strand = 'UCC'
    actual = Translation.of_rna(strand)
    expected = %w[Serine]
    assert_equal expected, actual
  end

  def test_serine_rna_sequence_3
    skip
    strand = 'UCA'
    actual = Translation.of_rna(strand)
    expected = %w[Serine]
    assert_equal expected, actual
  end

  def test_serine_rna_sequence_4
    skip
    strand = 'UCG'
    actual = Translation.of_rna(strand)
    expected = %w[Serine]
    assert_equal expected, actual
  end

  def test_tyrosine_rna_sequence_1
    skip
    strand = 'UAU'
    actual = Translation.of_rna(strand)
    expected = %w[Tyrosine]
    assert_equal expected, actual
  end

  def test_tyrosine_rna_sequence_2
    skip
    strand = 'UAC'
    actual = Translation.of_rna(strand)
    expected = %w[Tyrosine]
    assert_equal expected, actual
  end

  def test_cysteine_rna_sequence_1
    skip
    strand = 'UGU'
    actual = Translation.of_rna(strand)
    expected = %w[Cysteine]
    assert_equal expected, actual
  end

  def test_cysteine_rna_sequence_2
    skip
    strand = 'UGC'
    actual = Translation.of_rna(strand)
    expected = %w[Cysteine]
    assert_equal expected, actual
  end

  def test_tryptophan_rna_sequence
    skip
    strand = 'UGG'
    actual = Translation.of_rna(strand)
    expected = %w[Tryptophan]
    assert_equal expected, actual
  end

  def test_stop_codon_rna_sequence_1
    skip
    strand = 'UAA'
    actual = Translation.of_rna(strand)
    expected = %w[]
    assert_equal expected, actual
  end

  def test_stop_codon_rna_sequence_2
    skip
    strand = 'UAG'
    actual = Translation.of_rna(strand)
    expected = %w[]
    assert_equal expected, actual
  end

  def test_stop_codon_rna_sequence_3
    skip
    strand = 'UGA'
    actual = Translation.of_rna(strand)
    expected = %w[]
    assert_equal expected, actual
  end

  def test_sequence_of_two_protein_codons_translates_into_proteins
    skip
    strand = 'UUUUUU'
    actual = Translation.of_rna(strand)
    expected = %w[Phenylalanine Phenylalanine]
    assert_equal expected, actual
  end

  def test_sequence_of_two_different_protein_codons_translates_into_proteins
    skip
    strand = 'UUAUUG'
    actual = Translation.of_rna(strand)
    expected = %w[Leucine Leucine]
    assert_equal expected, actual
  end

  def test_translate_rna_strand_into_correct_protein_list
    skip
    strand = 'AUGUUUUGG'
    actual = Translation.of_rna(strand)
    expected = %w[Methionine Phenylalanine Tryptophan]
    assert_equal expected, actual
  end

  def test_translation_stops_if_stop_codon_at_beginning_of_sequence
    skip
    strand = 'UAGUGG'
    actual = Translation.of_rna(strand)
    expected = %w[]
    assert_equal expected, actual
  end

  def test_translation_stops_if_stop_codon_at_end_of_two_codon_sequence
    skip
    strand = 'UGGUAG'
    actual = Translation.of_rna(strand)
    expected = %w[Tryptophan]
    assert_equal expected, actual
  end

  def test_translation_stops_if_stop_codon_at_end_of_three_codon_sequence
    skip
    strand = 'AUGUUUUAA'
    actual = Translation.of_rna(strand)
    expected = %w[Methionine Phenylalanine]
    assert_equal expected, actual
  end

  def test_translation_stops_if_stop_codon_in_middle_of_three_codon_sequence
    skip
    strand = 'UGGUAGUGG'
    actual = Translation.of_rna(strand)
    expected = %w[Tryptophan]
    assert_equal expected, actual
  end

  def test_translation_stops_if_stop_codon_in_middle_of_six_codon_sequence
    skip
    strand = 'UGGUGUUAUUAAUGGUUU'
    actual = Translation.of_rna(strand)
    expected = %w[Tryptophan Cysteine Tyrosine]
    assert_equal expected, actual
  end

  def test_sequence_of_two_non_stop_codons_does_not_translate_to_a_stop_codon
    skip
    strand = 'AUGAUG'
    actual = Translation.of_rna(strand)
    expected = %w[Methionine Methionine]
    assert_equal expected, actual
  end

  def test_non_existing_codon_cant_translate
    skip
    strand = 'AAA'
    assert_raises(InvalidCodonError) do
      Translation.of_rna(strand)
    end
  end

  def test_unknown_amino_acids_not_part_of_a_codon_cant_translate
    skip
    strand = 'XYZ'
    assert_raises(InvalidCodonError) do
      Translation.of_rna(strand)
    end
  end

  def test_incomplete_rna_sequence_cant_translate
    skip
    strand = 'AUGU'
    assert_raises(InvalidCodonError) do
      Translation.of_rna(strand)
    end
  end

  def test_incomplete_rna_sequence_can_translate_if_valid_until_a_stop_codon
    skip
    strand = 'UUCUUCUAAUGGU'
    actual = Translation.of_rna(strand)
    expected = %w[Phenylalanine Phenylalanine]
    assert_equal expected, actual
  end
end
