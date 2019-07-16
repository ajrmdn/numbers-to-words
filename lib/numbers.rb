#!/usr/bin/env ruby
require('pry')
require('rspec')

def number_to_letter (number)

  one_hash = {
    1 => "one ",
    2 =>"two ",
    3 => "three ",
    4 => "four ",
    5=>"five ",
    6=>"six ",
    7=>"seven ",
    8=>"eight ",
    9=>"nine "
  }

  teens_hash={
    11=>"eleven " ,
    12=>"twelve " ,
    13=>"thirteen " ,
    14=>"fourteen " ,
    15=>"fifteen " ,
    16=>"sixteen " ,
    17=>"seventeen" ,
    18=>"eighteen " ,
    19=>"nineteen "
  }

  ten_hash = {
    10=>"ten " ,
    20=>"twenty " ,
    30=>"thirty ",
    40=>"forty " ,
    50=>"fifty ",
    60=>"sixty ",
    70=>"seventy ",
    80=>"eighty ",
    90=>"ninety "
  }

  large_values = {
    100=>"hundred ",
    1000=>"thousand ",
    1000000=>"million ",
    1000000000=>"billion ",
    1000000000000=>"trillion "
  }

  number_string = ""
  output_string = ""
  trillions = number/1000000000000
  if trillions > 0
      number_string.concat(trillions.to_s)
      number_string.concat(" 1000000000000 ")
  end
  number -= (trillions*1000000000000)



  billions = number/1000000000
  if billions > 0
      number_string.concat(billions.to_s)
      number_string.concat(" 1000000000 ")
  end
  number -= (billions*1000000000)



  millions = number/1000000
  if millions > 0
      number_string.concat(millions.to_s)
      number_string.concat(" 1000000 ")
  end
  number -= (millions*1000000)


  thousands = number/1000
  if thousands > 0
      number_string.concat(thousands.to_s)
      number_string.concat(" 1000 ")
  end
  number -= (thousands*1000)


  hundreds = number/100
  if hundreds > 0
    number_string.concat(hundreds.to_s)
    number_string.concat(" 100 ")
  end
  number -= (hundreds*100)
  if number > 0
      number_string.concat(number.to_s)
  end
  string_array = number_string.split

  string_array.each do |string|
  number_to_convert = string.to_i
    case
      #this handles conversion of large values (trillion)
    when number_to_convert%100 === 0 && number_to_convert >= 999
        output_string.concat(large_values.fetch(number_to_convert))
      # this handles weird hundreds (nine hundred thousand)
    when number_to_convert >= 101 && number_to_convert <= 999
        hundreds_convert = number_to_convert - (number_to_convert%100)

        if hundreds_convert > 0
          output_string.concat(one_hash.fetch( (hundreds_convert/100) ))
          output_string.concat("hundred ")
        end
        number_to_convert -= hundreds_convert
        if teens_hash.has_key?(number_to_convert)
           output_string.concat(teens_hash.fetch(number_to_convert))
        else
          tens_convert = number_to_convert - (number_to_convert%10)
          if tens_convert > 0
            output_string.concat(ten_hash.fetch(tens_convert))
          end
          number_to_convert -= tens_convert
          ones_convert = number_to_convert
          # this converts individual numbers (one)

          if ones_convert > 0
            output_string.concat(one_hash.fetch(ones_convert))
          end

        end
      #this handles flat tens (thirty)
    when number_to_convert === 100
          output_string.concat("hundred ")
    when number_to_convert%10 === 0 && number_to_convert<100
        output_string.concat(ten_hash.fetch(number_to_convert))
      # this handles thirty threes, ninety nines, etc
    when teens_hash.has_key?(number_to_convert)
          output_string.concat(teens_hash.fetch(number_to_convert))

    when number_to_convert%10 != 0 && number_to_convert < 100 && teens_hash.has_key?(number_to_convert) != true
        tens = number_to_convert - (number_to_convert%10)
        if tens > 0
          output_string.concat(ten_hash.fetch(tens))
        end
        number_to_convert -= tens
        ones = number_to_convert
        # this converts individual numbers (one)
        output_string.concat(one_hash.fetch(ones))

    end

  end

print string_array
puts ""
puts output_string


end

number_to_letter(900000)
