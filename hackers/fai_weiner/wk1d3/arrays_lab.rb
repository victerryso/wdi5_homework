# 1
days_of_the_week = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

# 2
step_2 = days_of_the_week.pop
days_of_the_week.unshift step_2

# 3
days = [days_of_the_week[1..5], [days_of_the_week.last, days_of_the_week.first]]

#4
days.delete_at 1 # Can also write 'days.pop'

#5
days.flatten!.sort!