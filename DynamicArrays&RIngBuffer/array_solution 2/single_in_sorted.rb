# Given a sorted array consisting of only integers where every
#  element appears twice except for one element which
#  appears once.  Find the single element that only appears only once.
#  Do it in O(logn) time and O(1) space!

# think of binary search O(logn)
#  what consition are we checking for
#  how do we know which direction should we go next?

def single_in_sorted(arr)
  lo = 0
  hi = arr.length - 1

  # Stopping condition is when our window has closed
  while lo < hi
    #  cutting the array in half
    mid = ((hi - lo) / 2) + lo
    #  returing the item if iti dosent have a pair nearby
    return arr[mid] if arr[mid] != arr[mid - 1] && arr[mid] != arr[mid + 1]
    # if the index is odd and there is a pair below,
    # then the single element is above us
    # if index is even and the pair is above,same;
    # otherwise, the single element is below us
    if (arr[mid] == arr[mid - 1] && mid.odd?) ||
      (arr[mid] == arr[mid + 1] && mid.even?)
      lo = mid + 1
    else
      hi = mid - 1
    end
  end
  #  if we havent redurned yet, then the single element
  #  is at the index we closed over
  arr[lo]
end


[1, 1, 2, 2, 3, 3, 4, 4, 5]
