class MenuPage
  attr_accessor :option, :object_array
  def initialize(object)
    @title = nil
    @model = object
    @object_array = object.array
    @option = nil
  end

  def input_sanitation(message)
    print message
    output = nil
    loop do
      begin
        output = gets.chomp.downcase
        unless (output == 'q') || (output == 'a') || (output == 'r') || (output == 'b') || (output == 's') || (output =='e')
          output = Integer(output)
        else
          return output
        end
      rescue
        puts "Input needs to something valid (Int or Q or A or R or B)"
      end
      break if output.class == Fixnum
    end
    output
  end

  def display_options(array)
    puts `clear`
    puts "HappiTails Database"
    puts "======================================="
    puts "No. \t Description"
    array.each_with_index do |item, index|
      puts "#{index}. \t #{item.to_s}"
    end
  end
  #return array element or do (String) other operation
  def options_select(array)
    puts "(B)ack (A)dd (R)emove (E)dit (Q)quit"
    choice = nil
    while choice == nil
      choice = input_sanitation("Choice?")
      if choice.is_a?Integer
        if !(0..array.length).include?(choice)
          puts "Choose a number from the list"
          choice = nil
        else
          @option = array[choice]
          return array[choice]
        end
      else
        case choice
        when 'q' then Kernel.exit
        when 'a' then add
        when 'r' then remove(array)
        when 'b' then choice
        when 'e' then edit(array)
        end
        @option = choice
      end
    end
  end

  def set_attributes
    attributes = (@object_array[0].methods - Object.methods).select{|x| x.to_s.include?("=") && !x.to_s.include?("array")}
  end

  def get_attributes
    attributes = (@object_array[0].methods - Object.methods).select{|x| !x.to_s.include?("=") && !x.to_s.include?("array")}
  end

  def add
    parameters = {}
    attributes = set_attributes
    attributes.each do |symbol|
      puts "What is the #{symbol}?"
      parameters[symbol] = gets.chomp
    end
    new_object = @object_array[0].class.new
    parameters.each do |key, value|
      new_object.method(key).call(value)
    end
    @object_array << new_object
  end

  def remove(array)
    display_options(array)
    puts "REMOVING"
    object = options_select(array)

    puts "Are you sure you want to remove #{object.to_s} Y/N?"
    yes_or_no = gets.chomp.downcase
    case yes_or_no
    when 'y' then @object_array.delete(object)
    when 'n' then yes_or_no
    else puts "that is not valid"
    end
    yes_or_no
  end

  def edit(array)
    display_options(array)
    puts "EDITING"
    object = options_select(array)

    attributes = get_attributes
    puts "No. \t Attribute \t Current"
    attributes.each_with_index do |attribute, index|
      puts "#{index}. \t #{attribute} \t #{object.method(attribute).call.to_s}"
    end
    attribute = options_select(attributes)
    method_call = (attribute.to_s + "=").to_sym
    object.method(method_call).call(gets.chomp)
  end

end
