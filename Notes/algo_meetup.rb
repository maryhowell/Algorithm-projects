# stack and queue problems to think about.

#  anagrams
# example a1 = "cat" a2 = "cat"
#  example a1 = "aab" a2 = "caaa"
# use hashmap to push all items into hash with counter



# palendrome
def is_palendrome?(input1, input2)
 return true if input1.reverse == input2
end
 # if longer than one word
 # 1. split on spaces check first and last letter are the same
 # 2. have current max and replace if bigger

 # matching brackets
 # have to use a stack to implement this.
 # 1. if open you need to add to stack
 # 2. if close peren pop off stack
 # 3. if stack empty return true
 # 4. if type to pop empty stack return false.
# could look at input as +1 and -1 and if value is 0 return true
 # example 1 ((())) true
 # example 2 ()()) false


# multiple types of matching brackets
# need look up table for matching
# pop and push if there is no match it returns true

# keeping it in a stack helps retain its nested qualities
# works for stack but not a queue (queue would give false positive.)
