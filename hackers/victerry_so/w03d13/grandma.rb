# Grandma
# Write a Deaf Grandma program.

# Whatever you say to grandma (whatever you type in), she should respond with

# HUH?! SPEAK UP, SONNY!
# unless you shout it (type in all capitals).

# If you shout, she can hear you (or at least she thinks so) and yells back

# NO, NOT SINCE 1938!
# To make your program really believable, have grandma shout a different year each time; maybe any year at random between 1930 and 1950.

# You can't stop talking to grandma until you shout BYE.

# Extensions

# What if grandma doesn't want you to leave? When you shout BYE, she could pretend not to hear you. Change your previous program so that you have to shout BYE three times in a row. Make sure to test your program: if you shout BYE three times, but not in a row, you should still be talking to grandma.

bye = 0
until bye == 3
  print "You: "; you = gets.chomp

  if you != you.upcase || you == ""
    puts "Grandma: HUH?! SPEAK UP, SONNY!"
    bye = 0

  elsif you == "BYE"
    puts "Grandma: I HEARD NOTHING!"
    bye += 1

  else
    puts "Grandma: NO, NOT SINCE #{rand(1930..1950)}!"
    bye = 0
  end

end
puts "Grandma: WHY DON'T YOU LOVE ME?!"