#!/usr/bin/ruby

inputs=File.readlines(ARGV[0], chomp: true)

ingredients=inputs[0].to_i
ing_needed=inputs[1].split
ing_total=inputs[2].split
canmake=[]

if(ing_needed.length!=ingredients && ing_total.length!=ingredients)
    puts "Input file has missing data"
    exit
end
for i in 0...ingredients
    canmake.push(ing_total[i].to_i/ing_needed[i].to_i)
end
canmake.sort!
puts canmake[0]
