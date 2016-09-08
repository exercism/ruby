require 'rspec'
require 'pry'
require_relative 'example.rb'

describe 'SublistTest' do
  it 'test_unique_return_vals' do
    expect([SUBLIST, SUPERLIST, EQUAL, UNEQUAL] == true)
  end

  it 'test_empty_lists' do
    expect(check_lists([], [])).to eq(EQUAL)
  end

  it 'test_empty_list_within' do
    expect(check_lists([], [1, 2, 3])).to eq(SUBLIST)
  end

  it 'test_within_empty_list' do
    expect(check_lists([1], [])).to eq(SUPERLIST)
  end

  it 'test_equal_lists' do
    l1 = [0, 1, 2]
    l2 = [0, 1, 2]
    expect(check_lists(l1, l2)).to eq(EQUAL)
  end

  it 'test_different_lists' do 
    l1 = [0, 1, 2, 3, 4, 5]
    l2 = [1, 2, 3, 4, 5, 6]
    expect(check_lists(l1, l2)).to eq(UNEQUAL)
  end

  it 'test_false_start' do
    l1 = [1, 2, 5]
    l2 = [0, 1, 2, 3, 1, 2, 5, 6]
    expect(check_lists(l1, l2)).to eq(SUBLIST)
  end

  it 'test_consecutive' do
    l1 = [1, 1, 2]
    l2 = [0, 1, 1, 1, 2, 1, 2]
    expect(check_lists(l1,l2)).to eq(SUBLIST)
  end

  it 'test_sublist_at_start' do
    l1 = [0, 1, 2]
    l2 = [0, 1, 2, 3, 4, 5]
    expect(check_lists(l1, l2)).to eq(SUBLIST)
  end
  
  it 'test_sublist_in_middle' do
    l1 = [2, 3, 4]
    l2 = [0, 1, 2, 3, 4, 5]
    expect(check_lists(l1, l2)).to eq(SUBLIST)
  end
  
  it 'test_sublist_at_end' do
    l1 = [3, 4, 5]
    l2 = [0, 1, 2, 3, 4, 5]
    expect(check_lists(l1, l2)).to eq(SUBLIST)
  end
  
  it 'test_at_start_of_superlist' do
    l1 = [0, 1, 2, 3, 4, 5]
    l2 = [0, 1, 2]
    expect(check_lists(l1, l2)).to eq(SUPERLIST)
  end
  
  it 'test_in_middle_of_superlist' do
    l1 = [0, 1, 2, 3, 4, 5]
    l2 = [2, 3]
    expect(check_lists(l1, l2)).to eq(SUPERLIST)
  end
  
  it 'test_at_end_of_superlist' do
    l1 = [0, 1, 2, 3, 4, 5]
    l2 = [3, 4, 5]
    expect(check_lists(l1, l2)).to eq(SUPERLIST)
  end
  
  it 'test_large_lists' do
    l1 = (0..1000).to_a * 1000 + (1000..1100).to_a
    l2 = (900..1050).to_a
    expect(check_lists(l1, l2)).to eq(SUPERLIST)
  end
  
  it 'test_spread_sublist' do
    multiples_of_3 = (3..200).step(3).to_a
    multiples_of_15 = (15..200).step(15).to_a
    expect(check_lists(multiples_of_15, multiples_of_3)).to eq(UNEQUAL)
  end
  
  it 'test_avoid_sets' do
    expect(check_lists([1, 3], [1, 2, 3])).to eq(UNEQUAL)
    expect(check_lists([1, 2, 3], [1, 3])).to eq(UNEQUAL)
    expect(check_lists([1, 2, 3], [3, 2, 1])).to eq(UNEQUAL)
  end
end


