#!/usr/bin/ruby
# puts ARGV[0]

def howmuchwin(teamone,teamtwo,count)
    teamone.sort!
    print teamone
    puts
    teamtwo.sort!
    print teamtwo
    winmargin=[]
    wins=0
    for i in 0...count
      winmargin.push(teamone[i].to_i-teamtwo[i].to_i)
    end
    print winmargin
    for i in 0...count-1
      if(winmargin[i]>0)
        wins+=1
        elsif(winmargin[i]<0)
          winmargin.slice(i+1,count-i-1).each_with_index do |num, idx|
            if(num==0 && (teamone[idx+i+1].to_i-teamtwo[i].to_i)>0)
              teamone[i],teamone[idx+i+1]=teamone[idx+i+1],teamone[i]
              winmargin[i]=teamone[i].to_i-teamtwo[i].to_i
              winmargin[idx+i+1]=teamone[idx+i+1].to_i-teamtwo[idx+i+1].to_i
              wins+=1
              break
            end
        end
      end
    end

    puts wins
    return wins
end


inputs=File.readlines(ARGV[0], chomp: true)
passes=inputs[0]
puts passes.strip()
all_data=inputs.drop(1) # removes the first element
puts all_data
(0..all_data.length - 1).step(3) do |n|
  players=all_data[n].to_i
  puts players
  team_g=all_data[n+1].split
  team_x=all_data[n+2].split
  if (true)
    optimal_win=howmuchwin(team_g,team_x,players)
    puts optimal_win
    puts "\n"
  end
end
