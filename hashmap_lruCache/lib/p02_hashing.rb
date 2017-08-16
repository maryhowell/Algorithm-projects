
class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    storage = ""

    self.each_with_index { |el, idx| storage += (el.to_s.ord + idx).to_s }
    storage.to_i.hash
  end
end

class String
  def hash
    storage = []

    self.chars.each_with_index { |el, idx| storage << el.ord + idx }

    storage.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  
  def hash
    number = 0

    self.each do |key, val|
      number += key.to_s.ord + val.ord
    end

    number.hash
  end
end
