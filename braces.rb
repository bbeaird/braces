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



OPENER_AND_CLOSER_PAIRS = {
  '(' => ')',
  '[' => ']',
  '{' => '}'
}.freeze

def braces_recursive(array_of_braces_strings)
  array_of_braces_strings.each do |str|
    recurse_each_string(str.split(''))
  end
end

def recurse_each_string(split_str, deepest_level=[])
  char = split_str.shift
  if end_of_string?(char, deepest_level)
    return puts 1
  elsif open_brace?(char)
    deepest_level << OPENER_AND_CLOSER_PAIRS[char]
  elsif deepest_level.pop != char
    return puts 0
  end
  recurse_each_string(split_str, deepest_level)
end

def end_of_string?(char, deepest_level)
  char.nil? && deepest_level.empty?
end

def open_brace?(char)
  OPENER_AND_CLOSER_PAIRS.keys.include? char
end


test = ")(){}","[]({})","([])","{()[]}","([)]", "(", "((())"
braces(test)
braces_recursive(test)