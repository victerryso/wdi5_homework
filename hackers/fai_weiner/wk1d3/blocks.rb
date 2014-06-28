cutlery = ['fork', 'spoon', 'knife', 'spork']
cutlery.each do |piece|
  puts "A piece of cutlery is a #{piece.upcase}"
end

brothers = {:groupo => "love", :harpo => "young", :chico => "yes"}

brothers.each do |b|
  p b
end

brothers.each do |name, info|
  puts "#{name.to_s.upcase} plays #{info}."
end


n = (1..100).to_a
n.select do |i|
  i.even?
end

n.all? do |i|
  i.even?
end