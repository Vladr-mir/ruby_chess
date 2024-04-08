# frozen_string_literal: false

# Basic array helper for basic mehtods
module ArrHelper
  # Sum arrays of the same size
  def sum_arr(arr1, arr2)
    arr1.zip(arr2).map { |arr| arr.inject(:+) }
  end

  def substract_arr(arr1, arr2)
    arr1.zip(arr2).map { |arr| arr.inject(:-) }
  end
end
