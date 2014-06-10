def braces(array_of_braces_strings)
  array_of_braces_strings.each do |str|
    split_str = str.split('')
    braces_hash = { '(' => 0,
                    ')' => 0,
                    '[' => 0,
                    ']' => 0,
                    '{' => 0,
                    '}' => 0 }

    split_str.each do |char|
      braces_hash[char] += 1
    end
    check_for_equal_opening_and_closing_braces(braces_hash)
  end
  puts "Done!"
end

def check_for_equal_opening_and_closing_braces(braces_hash)
  if braces_hash['('] == braces_hash[')'] && braces_hash['['] == braces_hash[']'] && braces_hash['{'] == braces_hash['}']
    puts 1
  else
    puts 0
  end
end

test = ")(){}","[]({})","([])","{()[]}","([)]"
braces(test)