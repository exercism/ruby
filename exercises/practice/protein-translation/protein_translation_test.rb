require 'minitest/autorun'
require_relative 'protein_translation'

class ProteinTranslationTest < Minitest::Test
  def test_empty_rna_sequence_results_in_no_proteins
    # skip
    strand = ""
    expected = []
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_methionine_rna_sequence
    skip
    strand = "AUG"
    expected = ["Methionine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_phenylalanine_rna_sequence_1
    skip
    strand = "UUU"
    expected = ["Phenylalanine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_phenylalanine_rna_sequence_2
    skip
    strand = "UUC"
    expected = ["Phenylalanine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_leucine_rna_sequence_1
    skip
    strand = "UUA"
    expected = ["Leucine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_leucine_rna_sequence_2
    skip
    strand = "UUG"
    expected = ["Leucine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_serine_rna_sequence_1
    skip
    strand = "UCU"
    expected = ["Serine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_serine_rna_sequence_2
    skip
    strand = "UCC"
    expected = ["Serine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_serine_rna_sequence_3
    skip
    strand = "UCA"
    expected = ["Serine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_serine_rna_sequence_4
    skip
    strand = "UCG"
    expected = ["Serine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_tyrosine_rna_sequence_1
    skip
    strand = "UAU"
    expected = ["Tyrosine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_tyrosine_rna_sequence_2
    skip
    strand = "UAC"
    expected = ["Tyrosine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_cysteine_rna_sequence_1
    skip
    strand = "UGU"
    expected = ["Cysteine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_cysteine_rna_sequence_2
    skip
    strand = "UGC"
    expected = ["Cysteine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_tryptophan_rna_sequence
    skip
    strand = "UGG"
    expected = ["Tryptophan"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_stop_codon_rna_sequence_1
    skip
    strand = "UAA"
    expected = []
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_stop_codon_rna_sequence_2
    skip
    strand = "UAG"
    expected = []
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_stop_codon_rna_sequence_3
    skip
    strand = "UGA"
    expected = []
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_sequence_of_two_protein_codons_translates_into_proteins
    skip
    strand = "UUUUUU"
    expected = %w[Phenylalanine Phenylalanine]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_sequence_of_two_different_protein_codons_translates_into_proteins
    skip
    strand = "UUAUUG"
    expected = %w[Leucine Leucine]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_translate_rna_strand_into_correct_protein_list
    skip
    strand = "AUGUUUUGG"
    expected = %w[Methionine Phenylalanine Tryptophan]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_translation_stops_if_stop_codon_at_beginning_of_sequence
    skip
    strand = "UAGUGG"
    expected = []
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_translation_stops_if_stop_codon_at_end_of_two_codon_sequence
    skip
    strand = "UGGUAG"
    expected = ["Tryptophan"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_translation_stops_if_stop_codon_at_end_of_three_codon_sequence
    skip
    strand = "AUGUUUUAA"
    expected = %w[Methionine Phenylalanine]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_translation_stops_if_stop_codon_in_middle_of_three_codon_sequence
    skip
    strand = "UGGUAGUGG"
    expected = ["Tryptophan"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_translation_stops_if_stop_codon_in_middle_of_six_codon_sequence
    skip
    strand = "UGGUGUUAUUAAUGGUUU"
    expected = %w[Tryptophan Cysteine Tyrosine]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_non_existing_codon_cant_translate
    skip
    strand = "AAA"
    assert_raises(InvalidCodonError) do
      Translation.of_rna(strand)
    end
  end

  def test_unknown_amino_acids_not_part_of_a_codon_cant_translate
    skip
    strand = "XYZ"
    assert_raises(InvalidCodonError) do
      Translation.of_rna(strand)
    end
  end

  def test_incomplete_rna_sequence_cant_translate
    skip
    strand = "AUGU"
    assert_raises(InvalidCodonError) do
      Translation.of_rna(strand)
    end
  end

  def test_incomplete_rna_sequence_can_translate_if_valid_until_a_stop_codon
    skip
    strand = "UUCUUCUAAUGGU"
    expected = %w[Phenylalanine Phenylalanine]
    assert_equal expected, Translation.of_rna(strand)
  end
end
