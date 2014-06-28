# Scrabble.score("cabbage")
# # => 14
# Your program should be in a file named scrabble.rb.

# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10
# Extensions

# You can play a :double or a :triple letter.
# You can play a :double or a :triple word.


class Scrabble
  attr_accessor :word, :double

  def initialize(word)
    @word = word
  end

  def self.score(word)
    word.gsub!(/[aeioulnrst]/, "1")
    word.gsub!(/[dg]/, "2")
    word.gsub!(/[bcmp]/, "3")
    word.gsub!(/[fhvwy]/, "4")
    word.gsub!(/[k]/, "5")
    word.gsub!(/[jx]/, "8")
    word.gsub!(/[qz]/, "19") # When you split it, it adds up to 10.
    p word = word.split(//)
    p word = word.collect {|i| i.to_i}
    score = 0
    word.each {|i| score += i}
    p score
  end

end

Scrabble.score("cabbage")
