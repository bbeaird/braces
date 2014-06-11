def braces(array_of_braces_strings)
  array_of_braces_strings.each do |str|
    split_str = str.split('')
    deepest_level = []
    $opener_and_closer_pairs = { '(' => ')', '[' => ']', '{' => '}' }
    $passing_flag = 1
    braces_hash = {
      '(' => 0,
      ')' => 0,
      '[' => 0,
      ']' => 0,
      '{' => 0,
      '}' => 0
    }

    split_str.each do |char|
      deal_with_level(char, deepest_level)
      increment_braces_hash(char, braces_hash)
    end
    check_braces_hash_for_equal_opening_and_closing_braces(braces_hash)
  puts "#{$passing_flag}"
  end
end

def deal_with_level(char, deepest_level)
  if $opener_and_closer_pairs.has_key?(char)
    deepest_level << $opener_and_closer_pairs[char]
  elsif deepest_level.pop != char
    $passing_flag = 0
  end
end

def increment_braces_hash(char, braces_hash)
  braces_hash[char] += 1
end

def check_braces_hash_for_equal_opening_and_closing_braces(braces_hash)
  unless braces_hash['('] == braces_hash[')'] && braces_hash['['] == braces_hash[']'] && braces_hash['{'] == braces_hash['}']
    $passing_flag = 0
  end
end



def braces_recursive(array_of_braces_strings)
  array_of_braces_strings.each do |str|
    split_str = str.split('')
    deepest_level = []
    recursive_it(split_str, deepest_level)
  end
end

def recursive_it(split_str, deepest_level)
  opener_and_closer_pairs = {
    '(' => ')',
    '[' => ']',
    '{' => '}'
  }
  char = split_str.shift
  if char.nil? && deepest_level.empty?
    puts 1
  elsif char == '(' || char == '[' || char == '{'
    deepest_level << opener_and_closer_pairs[char]
    recursive_it(split_str, deepest_level)
  elsif deepest_level.pop == char
    recursive_it(split_str, deepest_level)
  else
    puts 0
  end
end


test = ")(){}","[]({})","([])","{()[]}","([)]", "(", "((())"
braces(test)
braces_recursive(test)