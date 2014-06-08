class Shelter

   attr_accessor :animals_in_shelter, :list_of_clients, :access

   def initialize
      @animals_in_shelter = []
      @list_of_clients = []
   end

   def access(password_input)
      if @admin_password == password_input
         new_pet
      else
         puts password_error
      end
   end

  private

  def password
      @admin_password = "puppy"
  end

  def password_error
      "Access denied: incorrect password."
  end


end



# add class to add pet in admin mode
# add type of animal search