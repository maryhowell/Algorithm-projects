// first pass

// def firstNotRepeatingCharacter(s)
//   s.each_char.detect { |c| s.count(c) == 1  }
// end

function firstNotRepeatingCharacter(s) {

  for (var i = 0; i < s.length; i++) {
    var c = s.charAt(i);
    if (s.indexOf(c) == i && s.indexOf(c, i + 1) == -1) {
      return c;
    }
  }
  return "_";
}
