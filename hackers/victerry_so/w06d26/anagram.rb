# Anagram Detector
# Write a program that, given a word and a list of possible anagrams, selects the correct one(s).

# In other words, given: "listen" and %w(enlists google inlets banana) the program should return "inlets".

p word = 'listen'
p array = %w(enlists google inlets banana)
array.select { |w| p w if word.chars.sort == w.chars.sort }