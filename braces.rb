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

    if braces_hash['('] == braces_hash[')'] && braces_hash['['] == braces_hash[']'] && braces_hash['{'] == braces_hash['}']
      puts 1
    else
      puts 0
    end

  end
  puts "Done!"
end

test = ")(){}","[]({})","([])","{()[]}","([)]"
braces(test)