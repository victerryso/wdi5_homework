require_relative 'main.rb'

#### MENUS ####

def root_menu
  puts `clear`
  puts "===== WONDERBAR BUILDING DATABASE =====\n"
  puts "Welcome. What would you like to do?"
  puts "1. Add"
  puts "2. Remove"
  puts "3. Move"
  puts "4. List & Sort\n\n"
  puts "000. Quit"

  menu_choice = choice_transform.to_s

  case menu_choice
    when "1" then top_add_menu
    when "2" then top_remove_menu
    when "3" then top_move_menu
    when "4" then top_list_sort_menu
    when "000" then quit
    else 
    menu_choice = choice_transform.to_s
  end
end

#### TOP LEVEL ####

def top_add_menu
  puts`clear`
  puts "MAKE ADDITIONS TO DATABASE"
  puts "1. Add a new building"
  puts "2. Add a new apartment"
  puts "3. Add a new tenant"
  menu_rq_access
  menu_instructions

  menu_choice = choice_transform

  case menu_choice
    when "1" then add_building_tool
    when "2" then add_apartment_tool
    when "3" then add_tenant_tool
    else menu_choice # how to loop back to menu_choice input?
  end
end

def top_remove_menu
  puts`clear`
  puts "REMOVE MENU"
  puts "1. Remove a tenant"
  puts menu_instructions
end

def top_move_menu
  puts`clear`
  puts "MOVE MENU"
  puts "1. Move a tenant"
  puts menu_instructions
end

def top_list_sort_menu
  puts`clear`
  puts "LIST AND SORT MENU"
  puts "1. List buildings"
  puts "2. List apartments"
  puts "3. List occupants"
  puts "4. Sort buildings"
  puts "5. Sort apartments"
  puts "6. Sort occupants"
  puts menu_instructions

  case menu_choice
    when "1" then puts list_buildings
    when "2" then add_apartment_tool
    when "3" then add_tenant_tool
    else menu_choice # how to loop back to menu_choice input?
    end
end

  def sub_list_apartment_menu
    puts`clear`
    puts "LIST APARTMENTS"
    puts "1. List all apartments"
    puts "2. List available apartments"
    puts "3. List occupied apartments"
    puts menu_instructions
  end

#### END MENUS ####