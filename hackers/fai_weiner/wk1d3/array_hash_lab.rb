### A
a = ["Anil", "Erik", "Jonathan"]

# 1. How would you return the string "Erik"?
a[1]

# 2. How would you add your name to the array?
a.push "Fai"
a << "Eli"

### B
h = {0 => "Zero", 1 => "One", :two => "Two", "two" => 2}

# 1. How would you return the string "One"?
h[1]

# 2. How would you return the string "Two"?
h[:two]

# 3. How would you return the number 2?
p h["two"]

# 4. How would you add {3 => "Three"} to the hash?
h[3] = "Three"

# 5. How would you add {:four => 4} to the hash?
h[:four] = 4

### C
is = {true => "It's true!", false => "It's false"}

# 1. What is the return value of is[2 + 2 == 4]?
"It's true!"

# 2. What is the return value of is["Erik" == "Jonathan"]?
"It's false"

# 3. What is the return value of is[9 > 10]?
"It's false"

# 4. What is the return value of is[0]?
nil

# 5. What is the return value of is["Erik"]?
nil

### D
users = {
  "Jonathan" => {
    :twitter => "tronathan",
    :favorite_numbers => [12, 42, 75],
  },
  "Erik" => {
    :twitter => "sferik",
    :favorite_numbers => [8, 12, 24],
  },
  "Anil" => {
    :twitter => "bridgpal",
    :favorite_numbers => [12, 14, 85],
  },
}

# How would you access Jonathan's Twitter handle (i.e. the string "tronathan")?
puts users["Jonathan"][:twitter]

# How would you add the number 7 to Erik's favorite numbers?
users["Erik"][:favorite_numbers] << 7

# How would you add yourself to the users hash?
users["Jorge"] = {:twitter => "edwardawkward", :favorite_numbers => [555]}

# How would you return the array of Erik's favorite numbers?
users["Erik"][:favorite_numbers]

# How would you return the smallest of Erik's favorite numbers?
users["Erik"][:favorite_numbers].min

# How would you return an array of Anil's favorite numbers that are also even?
# users["Anil"][:favorite_numbers].select { |x|, .even? }

# How would you return an array of the favorite numbers common to all users?
users[:favorite_numbers]

# How would you return an array containing all users' favorite numbers, sorted, and excluding duplicates?
