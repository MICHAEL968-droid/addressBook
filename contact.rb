
require "./phone_number"
require './address'

class Contact
    attr_writer  :first_name,:middle_name,:last_name
    attr_reader  :phone_numbers, :addresses

    def initialize
        @phone_numbers = []
        @addresses  = []
    end

    def add_phone_number(kind,number)
        phone_number = PhoneNumber.new
        phone_number.kind = kind
        phone_number.number = number
        phone_numbers.push(phone_number)
    end

    def add_address(kind, street_1, street_2, city, state, postal_code)
        address = Address.new
        address.kind = kind
        address.street_1 = street_1
        address.street_2 = street_2
        address.city = city
        address.state = state
        address.postal_code = postal_code
        addresses.push(address)
    end



    def first_name
        @first_name
    end

    def middle_name
        @middle_name
    end

    def last_name
        @last_name
    end

    def first_last
        first_name + " " +last_name
    end

    def last_first
        last_first = last_name
        last_first+=","
        last_first+=first_name
        if !@middle_name.nil?
            last_first+=" "
            last_first += middle_name.slice(0,1)
            last_first += "."
        end
        last_first
    end
    
    
    
    def full_name
        full_name = first_name
        if !@middle_name.nil?
            full_name+= " "
            full_name+=middle_name
        end
        full_name+= ' '
        full_name+=last_name
        full_name
    end
    def to_s(format = "full_name")
        case format
        when 'full_name'
            full_name
        when 'last_first'
            last_first
        when  'first'
            first_name
        when 'last'
            last_name
        else
            first_last
        end

    end

    def print_phone_numbers
        puts "Phone Numbers"
        phone_numbers.each { |phone_number| puts phone_number }
    end

    def print_addresses
        puts "Addresses"
        addresses.each { |address| puts address.to_s('short') }
    end

end


jason = Contact.new
jason.first_name = "Jason"
jason.last_name = "Seifer"
jason.add_phone_number("Home", "123-456-7890")
jason.add_phone_number("Work", "456-789-0123")
jason.add_address("Home", "123 Main St.", "", "Portland", "OR", "12345")

puts jason.to_s('full_name')
jason.print_phone_numbers
jason.print_addresses

# jason = Contact.new 
# jason.first_name = "Jason"
# jason.last_name = "Seifer"
# puts jason.to_s
# puts jason.to_s('full_name')
# puts jason.to_s('last_first')


# nick = Contact.new 
# nick.first_name = "Nick"
# nick.middle_name = "A"
# nick.last_name = "Pettit"
# puts nick.to_s('first_last')
# puts nick.full_name