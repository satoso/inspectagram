require 'instagram'
CLIENT_ID = 'dummydummydummy'

Instagram.configure do |config|
  config.client_id = CLIENT_ID
end

def into_string(hash, depth = 0)
  str = ''
  hash.each do |key, value|
    str << '  ' * depth
    str << key.to_s + "\n"
    str << (
      if value.is_a?(Hash) 
        into_string(value, depth + 1)
      else
        '  ' * depth +
        '->  ' + value.to_s + "\n"
      end
    )
  end
  str
end

data = Instagram.media_item("520029180990634586_1934653")

puts data.to_s
puts
puts into_string(data)




__END__
def into_str(h)
  h.each do |key,value|
    puts 'key: ' + key.to_s
    if value.is_a?(Hash)
      into_str(value)
    else
      puts 'value: ' + value.to_s
    end
  end
end

a = {:test => 1, :test2 => {:test3 => 3, :test4 => {:test5 => 5, :test6 => 6}}, :test7 => 'a'}
into_str(a)

def into_string(obj)
  str = ''
  obj.each do |key, value|
    str << key.to_s + "\n"
    str << (
      if value.is_a?(Hash)
        h_to_s(value)
      elsif value.is_a?(Array)
        a_to_s(value)
      else
        value.to_s + "\n"
      end
    )
  end
  str
end

def a_to_s(hash)
  str = ''
  hash.each do |key, value|
    str << key.to_s + "\n"
    str << (
      if value.is_a?(Hash)
        into_string(value)
      else
        value.to_s + "\n"
      end
    )
  end
  str
end
