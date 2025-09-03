require 'minitest/autorun'
require_relative 'diamond'

class DiamondTest < Minitest::Test
  def test_degenerate_case_with_a_single_a_row
    # skip
    answer = Diamond.make_diamond('A')
    string = "A\n"\

    assert_equal string, answer
  end

  def test_degenerate_case_with_no_row_containing_3_distinct_groups_of_spaces
    skip
    answer = Diamond.make_diamond('B')
    string = " A \n"\
            "B B\n"\
            " A \n"\

    assert_equal string, answer
  end

  def test_smallest_non_degenerate_case_with_odd_diamond_side_length
    skip
    answer = Diamond.make_diamond('C')
    string = "  A  \n"\
            " B B \n"\
            "C   C\n"\
            " B B \n"\
            "  A  \n"\

    assert_equal string, answer
  end

  def test_smallest_non_degenerate_case_with_even_diamond_side_length
    skip
    answer = Diamond.make_diamond('D')
    string = "   A   \n"\
            "  B B  \n"\
            " C   C \n"\
            "D     D\n"\
            " C   C \n"\
            "  B B  \n"\
            "   A   \n"\

    assert_equal string, answer
  end

  def test_largest_possible_diamond
    skip
    answer = Diamond.make_diamond('Z')
    string = "                         A                         \n"\
            "                        B B                        \n"\
            "                       C   C                       \n"\
            "                      D     D                      \n"\
            "                     E       E                     \n"\
            "                    F         F                    \n"\
            "                   G           G                   \n"\
            "                  H             H                  \n"\
            "                 I               I                 \n"\
            "                J                 J                \n"\
            "               K                   K               \n"\
            "              L                     L              \n"\
            "             M                       M             \n"\
            "            N                         N            \n"\
            "           O                           O           \n"\
            "          P                             P          \n"\
            "         Q                               Q         \n"\
            "        R                                 R        \n"\
            "       S                                   S       \n"\
            "      T                                     T      \n"\
            "     U                                       U     \n"\
            "    V                                         V    \n"\
            "   W                                           W   \n"\
            "  X                                             X  \n"\
            " Y                                               Y \n"\
            "Z                                                 Z\n"\
            " Y                                               Y \n"\
            "  X                                             X  \n"\
            "   W                                           W   \n"\
            "    V                                         V    \n"\
            "     U                                       U     \n"\
            "      T                                     T      \n"\
            "       S                                   S       \n"\
            "        R                                 R        \n"\
            "         Q                               Q         \n"\
            "          P                             P          \n"\
            "           O                           O           \n"\
            "            N                         N            \n"\
            "             M                       M             \n"\
            "              L                     L              \n"\
            "               K                   K               \n"\
            "                J                 J                \n"\
            "                 I               I                 \n"\
            "                  H             H                  \n"\
            "                   G           G                   \n"\
            "                    F         F                    \n"\
            "                     E       E                     \n"\
            "                      D     D                      \n"\
            "                       C   C                       \n"\
            "                        B B                        \n"\
            "                         A                         \n"\

    assert_equal string, answer
  end
end
