class Array

  def intersects?(other)
    (self & other).size > 0
  end

  def last_index
    size - 1
  end

  # assumes array is sorted
  def sort_find_index(target)
    sort_find_index_between(target, 0, size - 1, 0)
  end

  # assumes array is sorted
  def sort_find(target)
    i = sort_find_index(target)
    i ? at(i) : nil
  end

  def sort_include?(target)
    sort_find_index(target) != nil
  end

  def reverse_each_with_index
    (size - 1).downto(0) do |i|
      yield self[i], i
    end
  end

  def each_except_first
    (1...size).each do |i|
      yield self[i]
    end
  end

  def each_except_first_with_index
    (1...size).each do |i|
      yield self[i], i
    end
  end

  protected

  # assumes array is sorted
  def sort_find_index_between(target, first_index, last_index, match)
    assert first_index <= last_index, __method__, 'find index sort error'
    assert first_index >= 0, __method__, 'find index sort error'
    assert first_index < size, __method__, 'find index sort error'
    assert last_index >= 0, __method__, 'find index sort error'
    assert last_index < size, __method__, 'find index sort error'
    mid_index = ((first_index + last_index) / 2).to_i
    cmp = at(mid_index) <=> target
    if cmp == 0
      mid_index
    elsif cmp > 0
      if mid_index > first_index
        sort_find_index_between(target, first_index, mid_index - 1, match)
      else
        match > 0 ? mid_index : nil
      end
    else
      if mid_index < last_index
        sort_find_index_between(target, mid_index + 1, last_index, match)
      else
        match < 0 ? mid_index : nil
      end
    end
  end
end

