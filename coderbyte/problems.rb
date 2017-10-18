def FirstFactorial(num)
  (1..num).reduce(:*) || 1
  # code goes here
end

# keep this function call here
# puts FirstFactorial(STDIN.gets)

def FirstReverse(str)
  str.reverse
end

# keep this function call here
# puts FirstReverse(STDIN.gets)

def LongestWord(sen)
   arr = sen.split(" ")
   arr.sort! { |a, b| b.length <=> a.length }
   arr[0]

end

# keep this function call here
# puts LongestWord(STDIN.gets)
