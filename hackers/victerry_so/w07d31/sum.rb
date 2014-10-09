# Sum of Multiples
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Write a program that, given a number, can find the sum of all the multiples of 3 or 5 up to and including that number.
# Allow the program to be configured to find the sum of multiples of numbers other than 3 and 5.

number = 1000
array = [3, 5]
sum = 0

(1...number).each do |x|
  array.each do |y|
    if x % y == 0
      p sum += x
      break
    end
  end
end