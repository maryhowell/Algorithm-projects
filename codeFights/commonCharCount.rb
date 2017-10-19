# Given two strings, find the number of common characters between them.
#
# Example
#
# For s1 = "aabcc" and s2 = "adcaa", the output should be
# commonCharacterCount(s1, s2) = 3.
#
# Strings have 3 common characters - 2 "a"s and 1 "c".

def commonCharacterCount(s1, s2)
  w1, w2 = s1.split(""), s2.split("")
  counter = 0
  w1.each do |x|
    if w2.include?(x)
      counter += 1
      w2.delete_at(w2.index(x))
    end
  end
 counter
end
