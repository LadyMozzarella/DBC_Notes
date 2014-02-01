# Release ZERO
# Brittany & Jamie January 27th, 2014
# Our fav solution of the style hash/enumerable.

#############################################################################

# The hash allows the code to be organized.
# This code does have an issue that hashes don't necessarily maintain their order. If this hash were
# reordered, this code would break. An alternative would be to replace the hash with nested arrays.
# The addition of the letters to a string, as opposed to crafting the string in the puts statement,
# makes for a simple string construction that is easy to read and understand.
# Plus, that testing script is super sweet.

# def to_modern_roman(num)
#   romans = ''
#   to_romans = { 'M'  => 1000,
#                 'DM' => 900,
#                 'D'  => 500,
#                 'CD' => 400,
#                 'C'  => 100,
#                 'CL' => 90,
#                 'L'  => 50,
#                 'XL' => 40,
#                 'X'  => 10,
#                 'IX' => 9,
#                 'V'  => 5,
#                 'IV' => 4,
#                 'I'  => 1
#               }

#   to_romans.each do |roman, arabic|
#     romans += roman * (num / arabic)
#     num = num % arabic
#   end
#   return romans
# end


# puts "My totally sweet testing script"
# puts ""
# puts "input | expected | actual"
# puts "------|----------|-------"
# puts "4     | IV       | #{to_modern_roman(4)}"
# puts "9     | IX       | #{to_modern_roman(9)}"
# puts "13    | XIII     | #{to_modern_roman(13)}"
# puts "1453  | MCDLIII  | #{to_modern_roman(1453)}"
# puts "1646  | MDCXLVI  | #{to_modern_roman(1646)}"

#############################################################################

# Our favorite solution of the style modulo/division method. However, this method only is really effective with the old
# school roman numerals.

# def to_roman(num)
#   result = ""
#   result += 'M' * (num / 1000)
#   result += 'D' * (num % 1000 / 500)
#   result += 'C' * (num % 500 / 100)
#   result += 'L' * (num % 100 / 50)
#   result += 'X' * (num % 50 / 10)
#   result += 'V' * (num % 10 / 5)
#   result += 'I' * (num % 5 / 1)
# end

# puts to_roman(1) == "I"
# puts to_roman(3) == "III"
# puts to_roman(6) == "VI"
# puts to_roman(1654) == "MDCLIIII"

#############################################################################

# There are two arrays and the indecies line up with each other in order to make them alike and relatable
# So, "M" in the roman sybol array will like up with the value 1000 on the roman_val array.
# roman is the string that each character is getting stored onto the end of. This one is also sorting through
# the roman_sym array, which means that each case in the roman sybol array is getting at least looked at.
# This causes somewhat of a problem because it isn't necessary for us to look at all of the elements when we
# can just reference them individually.

#Assumed rules for subtratcive case:
#I is allowed before V or X
#X before L or C
# #C before D or M
# def to_roman(num)
#   roman_sym=["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]
#   roman_val=[1000,900,500,400,100,90,50,40,10,9,5,4,1]
#   roman = ""
#   roman_sym.each_index do |i|
#     roman += roman_sym[i] * (num/roman_val[i])
#     num = num%roman_val[i]
#   end
#   return roman
# end

# puts to_roman(1) == "I"
# puts to_roman(3) == "III"
# puts to_roman(6) == "VI"
# puts to_roman(4) == "IV"
# puts to_roman(9) == "IX"
# puts to_roman(13) == "XIII"
# puts to_roman(1453) == "MCDLIII"
# puts to_roman(1646) == "MDCXLVI"

#############################################################################

# def to_roman(latin_number)

#   thousand = latin_number.divmod(1000)

#   ninehundreds = thousand[1].divmod(900)

#   fivehundreds = ninehundreds[1].divmod(500)

#   fourhundreds = fivehundreds[1].divmod(400)

#   hundreds = fourhundreds[1].divmod(100)

#   ninties = hundreds[1].divmod(90)

#   fifties = ninties[1].divmod(50)

#   fourties = fifties[1].divmod(40)

#   tenth = fourties[1].divmod(10)

#   nines = tenth[1].divmod(9)

#   fives = nines[1].divmod(5)

#   fours = fives[1].divmod(4)

#   arabic_numbers = 'M'*thousand[0] + 'CM'*ninehundreds[0] + 'D'*fivehundreds[0] + 'CD'*fourhundreds[0] + 'C'*hundreds[0] + 'XC'*ninties[0] + 'L'*fifties[0] + 'XL'*fourties[0] + 'X'*tenth[0] + 'IX'*nines[0] + 'V'*fives[0] + 'IV'*fours[0] + 'I'*fours[1]

#   puts arabic_numbers

# end

#############################################################################

# OBJECTIVE TWO:

# Performance and optimization: We discussed for a long time the pros and cons about optimizing performance, especially for a simple, small method, suchas this.
# A great point by Tyler was that there are always things that get taken away when you focus on optimization. There are always sacrifices.
# So, writing good code is less about making the fastest program, and more about weighing your options for optimizing performance, readability, usability, etc.

# OBJECTIVE THREE - REDO!

# Input: INTEGER in arabic
# Output: A string with the integer in roman numerals (modern)

# Pseudocode:
# Use a hash of key/values with arabic/roman partner values.
# Iterate through the hash

TO_ROMAN = { 'M'  => 1000,
              'DM' => 900,
              'D'  => 500,
              'CD' => 400,
              'C'  => 100,
              'CL' => 90,
              'L'  => 50,
              'XL' => 40,
              'X'  => 10,
              'IX' => 9,
              'V'  => 5,
              'IV' => 4,
              'I'  => 1
            }

def to_modern_roman(num)
  string = ""
  TO_ROMAN.each { |key, value|
    string += key*(num/value)
    num %= value
  }
  string

end


puts "input | expected | actual"
puts "------|----------|-------"
puts "4     | IV       | #{to_modern_roman(4)}"
puts "9     | IX       | #{to_modern_roman(9)}"
puts "13    | XIII     | #{to_modern_roman(13)}"
puts "1453  | MCDLIII  | #{to_modern_roman(1453)}"
puts "1646  | MDCXLVI  | #{to_modern_roman(1646)}"