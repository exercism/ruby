require 'minitest/autorun'
require_relative 'grep'

# Common test data version: 1.2.0 4f2efaa
class GrepTest < Minitest::Test
  def setup
    IO.write 'iliad.txt', <<~ILIAD
      Achilles sing, O Goddess! Peleus' son;
      His wrath pernicious, who ten thousand woes
      Caused to Achaia's host, sent many a soul
      Illustrious into Ades premature,
      And Heroes gave (so stood the will of Jove)
      To dogs and to all ravening fowls a prey,
      When fierce dispute had separated once
      The noble Chief Achilles from the son
      Of Atreus, Agamemnon, King of men.
    ILIAD

    IO.write 'midsummer-night.txt', <<~MSNIGHT
      I do entreat your grace to pardon me.
      I know not by what power I am made bold,
      Nor how it may concern my modesty,
      In such a presence here to plead my thoughts;
      But I beseech your grace that I may know
      The worst that may befall me in this case,
      If I refuse to wed Demetrius.
    MSNIGHT

    IO.write 'paradise-lost.txt', <<~PARADISE
      Of Mans First Disobedience, and the Fruit
      Of that Forbidden Tree, whose mortal tast
      Brought Death into the World, and all our woe,
      With loss of Eden, till one greater Man
      Restore us, and regain the blissful Seat,
      Sing Heav'nly Muse, that on the secret top
      Of Oreb, or of Sinai, didst inspire
      That Shepherd, who first taught the chosen Seed
    PARADISE
  end

  def teardown
    File.delete('iliad.txt')
    File.delete('midsummer-night.txt')
    File.delete('paradise-lost.txt')
  end

  def test_one_file_one_match_no_flags
    # skip
    pattern = "Agamemnon"
    flags = []
    files = ["iliad.txt"]
    expected = <<~EXPECTED.rstrip
      Of Atreus, Agamemnon, King of men.
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_one_file_one_match_print_line_numbers_flag
    skip
    pattern = "Forbidden"
    flags = ["-n"]
    files = ["paradise-lost.txt"]
    expected = <<~EXPECTED.rstrip
      2:Of that Forbidden Tree, whose mortal tast
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_one_file_one_match_case_insensitive_flag
    skip
    pattern = "FORBIDDEN"
    flags = ["-i"]
    files = ["paradise-lost.txt"]
    expected = <<~EXPECTED.rstrip
      Of that Forbidden Tree, whose mortal tast
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_one_file_one_match_print_file_names_flag
    skip
    pattern = "Forbidden"
    flags = ["-l"]
    files = ["paradise-lost.txt"]
    expected = <<~EXPECTED.rstrip
      paradise-lost.txt
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_one_file_one_match_match_entire_lines_flag
    skip
    pattern = "With loss of Eden, till one greater Man"
    flags = ["-x"]
    files = ["paradise-lost.txt"]
    expected = <<~EXPECTED.rstrip
      With loss of Eden, till one greater Man
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_one_file_one_match_multiple_flags
    skip
    pattern = "OF ATREUS, Agamemnon, KIng of MEN."
    flags = ["-n", "-i", "-x"]
    files = ["iliad.txt"]
    expected = <<~EXPECTED.rstrip
      9:Of Atreus, Agamemnon, King of men.
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_one_file_several_matches_no_flags
    skip
    pattern = "may"
    flags = []
    files = ["midsummer-night.txt"]
    expected = <<~EXPECTED.rstrip
      Nor how it may concern my modesty,
      But I beseech your grace that I may know
      The worst that may befall me in this case,
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_one_file_several_matches_print_line_numbers_flag
    skip
    pattern = "may"
    flags = ["-n"]
    files = ["midsummer-night.txt"]
    expected = <<~EXPECTED.rstrip
      3:Nor how it may concern my modesty,
      5:But I beseech your grace that I may know
      6:The worst that may befall me in this case,
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_one_file_several_matches_match_entire_lines_flag
    skip
    pattern = "may"
    flags = ["-x"]
    files = ["midsummer-night.txt"]
    expected = <<~EXPECTED.rstrip

    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_one_file_several_matches_case_insensitive_flag
    skip
    pattern = "ACHILLES"
    flags = ["-i"]
    files = ["iliad.txt"]
    expected = <<~EXPECTED.rstrip
      Achilles sing, O Goddess! Peleus' son;
      The noble Chief Achilles from the son
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_one_file_several_matches_inverted_flag
    skip
    pattern = "Of"
    flags = ["-v"]
    files = ["paradise-lost.txt"]
    expected = <<~EXPECTED.rstrip
      Brought Death into the World, and all our woe,
      With loss of Eden, till one greater Man
      Restore us, and regain the blissful Seat,
      Sing Heav'nly Muse, that on the secret top
      That Shepherd, who first taught the chosen Seed
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_one_file_no_matches_various_flags
    skip
    pattern = "Gandalf"
    flags = ["-n", "-l", "-x", "-i"]
    files = ["iliad.txt"]
    expected = <<~EXPECTED.rstrip

    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_one_file_one_match_file_flag_takes_precedence_over_line_flag
    skip
    pattern = "ten"
    flags = ["-n", "-l"]
    files = ["iliad.txt"]
    expected = <<~EXPECTED.rstrip
      iliad.txt
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_one_file_several_matches_inverted_and_match_entire_lines_flags
    skip
    pattern = "Illustrious into Ades premature,"
    flags = ["-x", "-v"]
    files = ["iliad.txt"]
    expected = <<~EXPECTED.rstrip
      Achilles sing, O Goddess! Peleus' son;
      His wrath pernicious, who ten thousand woes
      Caused to Achaia's host, sent many a soul
      And Heroes gave (so stood the will of Jove)
      To dogs and to all ravening fowls a prey,
      When fierce dispute had separated once
      The noble Chief Achilles from the son
      Of Atreus, Agamemnon, King of men.
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_multiple_files_one_match_no_flags
    skip
    pattern = "Agamemnon"
    flags = []
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]
    expected = <<~EXPECTED.rstrip
      iliad.txt:Of Atreus, Agamemnon, King of men.
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_multiple_files_several_matches_no_flags
    skip
    pattern = "may"
    flags = []
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]
    expected = <<~EXPECTED.rstrip
      midsummer-night.txt:Nor how it may concern my modesty,
      midsummer-night.txt:But I beseech your grace that I may know
      midsummer-night.txt:The worst that may befall me in this case,
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_multiple_files_several_matches_print_line_numbers_flag
    skip
    pattern = "that"
    flags = ["-n"]
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]
    expected = <<~EXPECTED.rstrip
      midsummer-night.txt:5:But I beseech your grace that I may know
      midsummer-night.txt:6:The worst that may befall me in this case,
      paradise-lost.txt:2:Of that Forbidden Tree, whose mortal tast
      paradise-lost.txt:6:Sing Heav'nly Muse, that on the secret top
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_multiple_files_one_match_print_file_names_flag
    skip
    pattern = "who"
    flags = ["-l"]
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]
    expected = <<~EXPECTED.rstrip
      iliad.txt
      paradise-lost.txt
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_multiple_files_several_matches_case_insensitive_flag
    skip
    pattern = "TO"
    flags = ["-i"]
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]
    expected = <<~EXPECTED.rstrip
      iliad.txt:Caused to Achaia's host, sent many a soul
      iliad.txt:Illustrious into Ades premature,
      iliad.txt:And Heroes gave (so stood the will of Jove)
      iliad.txt:To dogs and to all ravening fowls a prey,
      midsummer-night.txt:I do entreat your grace to pardon me.
      midsummer-night.txt:In such a presence here to plead my thoughts;
      midsummer-night.txt:If I refuse to wed Demetrius.
      paradise-lost.txt:Brought Death into the World, and all our woe,
      paradise-lost.txt:Restore us, and regain the blissful Seat,
      paradise-lost.txt:Sing Heav'nly Muse, that on the secret top
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_multiple_files_several_matches_inverted_flag
    skip
    pattern = "a"
    flags = ["-v"]
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]
    expected = <<~EXPECTED.rstrip
      iliad.txt:Achilles sing, O Goddess! Peleus' son;
      iliad.txt:The noble Chief Achilles from the son
      midsummer-night.txt:If I refuse to wed Demetrius.
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_multiple_files_one_match_match_entire_lines_flag
    skip
    pattern = "But I beseech your grace that I may know"
    flags = ["-x"]
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]
    expected = <<~EXPECTED.rstrip
      midsummer-night.txt:But I beseech your grace that I may know
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_multiple_files_one_match_multiple_flags
    skip
    pattern = "WITH LOSS OF EDEN, TILL ONE GREATER MAN"
    flags = ["-n", "-i", "-x"]
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]
    expected = <<~EXPECTED.rstrip
      paradise-lost.txt:4:With loss of Eden, till one greater Man
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_multiple_files_no_matches_various_flags
    skip
    pattern = "Frodo"
    flags = ["-n", "-l", "-x", "-i"]
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]
    expected = <<~EXPECTED.rstrip

    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_multiple_files_several_matches_file_flag_takes_precedence_over_line_number_flag
    skip
    pattern = "who"
    flags = ["-n", "-l"]
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]
    expected = <<~EXPECTED.rstrip
      iliad.txt
      paradise-lost.txt
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end

  def test_multiple_files_several_matches_inverted_and_match_entire_lines_flags
    skip
    pattern = "Illustrious into Ades premature,"
    flags = ["-x", "-v"]
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]
    expected = <<~EXPECTED.rstrip
      iliad.txt:Achilles sing, O Goddess! Peleus' son;
      iliad.txt:His wrath pernicious, who ten thousand woes
      iliad.txt:Caused to Achaia's host, sent many a soul
      iliad.txt:And Heroes gave (so stood the will of Jove)
      iliad.txt:To dogs and to all ravening fowls a prey,
      iliad.txt:When fierce dispute had separated once
      iliad.txt:The noble Chief Achilles from the son
      iliad.txt:Of Atreus, Agamemnon, King of men.
      midsummer-night.txt:I do entreat your grace to pardon me.
      midsummer-night.txt:I know not by what power I am made bold,
      midsummer-night.txt:Nor how it may concern my modesty,
      midsummer-night.txt:In such a presence here to plead my thoughts;
      midsummer-night.txt:But I beseech your grace that I may know
      midsummer-night.txt:The worst that may befall me in this case,
      midsummer-night.txt:If I refuse to wed Demetrius.
      paradise-lost.txt:Of Mans First Disobedience, and the Fruit
      paradise-lost.txt:Of that Forbidden Tree, whose mortal tast
      paradise-lost.txt:Brought Death into the World, and all our woe,
      paradise-lost.txt:With loss of Eden, till one greater Man
      paradise-lost.txt:Restore us, and regain the blissful Seat,
      paradise-lost.txt:Sing Heav'nly Muse, that on the secret top
      paradise-lost.txt:Of Oreb, or of Sinai, didst inspire
      paradise-lost.txt:That Shepherd, who first taught the chosen Seed
    EXPECTED

    assert_equal expected, Grep.grep(pattern, flags, files)
  end
end
