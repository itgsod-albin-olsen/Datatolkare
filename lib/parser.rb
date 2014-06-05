def main(input)
  hash_list = []
  a = load_weather_file(input)
  a.each do |b|
    c = split_line(b)
    hash_list << encode_line(c)
  end
  values = find_biggest_variation(hash_list)
  puts "Day #{values[:date]} had the biggest variation (#{values[:max]-values[:min].to_f} degrees)\n"
end

def load_weather_file(input)
  return raise ArgumentError, "should take a string as argument" if input == ()
  return raise ArgumentError, "path must not be empty" if input == ('')
  return raise IOError, "file does not exist" if  (!File.exist?(input))
  lista = []
  File.open(input).each do |line|
    lista << line
  end

  lista = lista.drop(2)
  return lista
end

def split_line(input)
  return raise ArgumentError, "should take a string as argument" if input == ()
  return raise ArgumentError, "can not parse empty line" if input == ('')
  return input.split(' ')
end

def encode_line(input)
  return raise ArgumentError, "should take an array as argument" if input == ()
  return raise ArgumentError, "incomplete array" if input.length < 3
  hash = {:date => input[0].to_i, :max => input[1].to_i, :min => input[2].to_i}
  return hash
end

def find_biggest_variation(input)
  return raise ArgumentError, "array must not be empty" if input == ([])
  value = 0
  i="albins face är magnefikt"
  input.each_with_index do |banan, indexx|
    if value < banan[:max] - banan[:min]
      value = banan[:max] - banan[:min]
      i = indexx
    end
  end
  return input[i]
end
#main('../spec/test.dat')