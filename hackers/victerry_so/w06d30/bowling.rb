frames = []
count = 0
score = 0

# For the first nine frames
until count == 9
  puts "Frame #{count + 1}"

  p "First Bowl: "; first = gets.chomp
  multiplier = 1
  multiplier = 2 if frames.length > 0 && frames[-1][0] + frames[-1][1] == 10
  multiplier = 3 if frames.length > 1 && frames[-1][0] == 10 && frames[-2][0] == 10
  score += multiplier * first

  if first == 10
    second = 0
  else
    p "Second Bowl: "; second = gets.chomp
    multiplier = 1
    multiplier = 2 if frames.length > 0 && frames[-1][0] == 10
    score += multiplier * second
  end

  p score
  p frames << [first, second]
  count += 1

end

# For the 10th Frame
p "First Bowl: "; first = gets.chomp
multiplier = 1
multiplier = 2 if frames[-1][0] + frames[-1][1] == 10
multiplier = 3 if frames[-1][0] == 10 && frames[-2][0] == 10
score += multiplier * first

p "Second Bowl: "; second = gets.chomp
multiplier = 1
multiplier = 2 if frames[-1][0] == 10 || first == 10
score += multiplier * second

if first == 10 || first + second == 10
  p "Third Bowl: "; third = gets.chomp
  score += third
end

p score
p frames << [first, second, third]