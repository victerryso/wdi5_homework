=begin
1. Add a building
2. Add an apartment - available, all
3. Add a tenant
4. Remove
=end
require 'pry'

require_relative 'apartment'
require_relative 'building'
require_relative 'tenant'
require_relative 'MenuPage'

b1 = Building.new("18 Rodger St, Darlinghurst 2000 Sydney", :modern, false, false, 4)
a1 = Apartment.new(700, 3, 2)
t1 = Tenant.new("Jeff Morrison", 45, :male)
managed_buildings = [b1]
#binding.pry
b1.array[0] = a1
a1.array[0] = t1


menu = MenuPage.new(b1)
menu_hierarchy =[menu]
#binding.pry
loop do
  loop do
    current_menu_obj = menu_hierarchy[-1]
    current_menu_obj.display_options(current_menu_obj.object_array)
    current_menu_obj.options_select(current_menu_obj.object_array)
    if current_menu_obj.option.class != String
      if current_menu_obj.option.methods.include? :array
        new_menu_obj = MenuPage.new(current_menu_obj.option)
        menu_hierarchy << new_menu_obj
      end
    end
    break if current_menu_obj.option == 'b'
  end
  menu_hierarchy.pop
end


