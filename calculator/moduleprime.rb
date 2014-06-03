module ModulePrime

	def ModulePrime.is_prime?(number)
		if number % 2 == 0
			return "Even dummy"
		else		
			start = (number **0.5).floor
			start.downto(3) do |x|
				if !x.even?
					if number % x == 0
						return "Highest factor is #{x}"
					end
				end
			end
			return "#{number} is prime"
		end
	end
end
