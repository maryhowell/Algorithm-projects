# Ticket numbers usually consist of an even number of digits. A ticket number 
# is considered lucky if the sum of the first half of the digits is equal to the
# sum of the second half.
#
# Given a ticket number n, determine if it's lucky or not.

def isLucky(n)
  new_array = n.to_s.split("")
  new_length = new_array.length

  a, b = [], []

  (0...new_length / 2).each { |x| a.push(new_array[x].to_i) }
  (new_length / 2...new_length).each { |y| b.push(new_array[y].to_i) }

  if a.inject(:+) == b.inject(:+)
    return true
  else
    false
  end

end
