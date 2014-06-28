class Shelter
	attr_accessor :clients, :animals_shelter, :animals_clients

	def initialize(clients, animals_shelter,animals_clients)
         @clients = ["David", "Frances"]
         @animals_shelter = ["Benjo", "Sally"]
         @animals_clients = ["Denis", "Ranee"]
    end

    def to_s
    	""
    end
end