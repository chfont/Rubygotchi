require_relative "rubygotchi"
require "tco"

#Loading an existent termigotchi/rubygotchi
def initFromFile(file)
  f = File.open(file, "r")
  name = f.gets.chomp
  age = f.gets.chomp.to_i
  happiness = f.gets.chomp.to_i
  fullness = f.gets.chomp.to_i
  lastInitial = f.gets.chomp.to_i
  lastAged = f.gets.chomp.to_i
  lastF = f.gets.chomp.to_i
  lastP = f.gets.chomp.to_i

  t = Rubygotchi.new(name)
  t.age=(age)
  t.happiness=(happiness)
  t.fullness=(fullness)
  t.lastInit = lastInitial
  t.lastFedCheck= lastF
  t.lastPlayed= lastP
  t.lastAged = lastAged
  f.close()

  curTime = Time.now.to_i
  #86400 - Seconds in a day
  if (curTime - t.lastInit >= 86400)
    daysPassed = (curTime - t.lastInit) / 86400
    t.fullness=(t.fullness() -2*daysPassed)
    t.happiness=(t.happiness() -daysPassed)
  end
  if(curTime - lastAged >= 86400)
    daysPassed = (curTime-lastAged) / 86400
    t.age=(t.age() + daysPassed.to_i)
    t.lastAged = (t.lastAged()+(daysPassed.to_i * 86400))
  end
  t.lastInit = curTime

  return t
end

#Save termigotchi/rubygotchi to file
def saveToFile(file, t)
  f = File.open(file, "w")
  f.write("#{t.name}\n")
  f.write("#{t.age}\n")
  f.write("#{t.happiness}\n")
  f.write("#{t.fullness}\n")
  f.write("#{t.lastInit}\n")
  f.write("#{t.lastAged}\n")
  f.write("#{t.lastFedCheck}\n")
  f.write("#{t.lastPlayed}\n")
end

#Function to run on 'h' input
def listCommands()
  puts("q - quit")
  puts("h - help")
  puts("f - feed")
  puts("p - play")
  puts("s - status")
  puts("")
end


#Start of primary execution

if (File.exist?("rubygotchi0.txt"))
  test = initFromFile("rubygotchi0.txt")
  test.display()
else
  f = File.new("rubygotchi0.txt", "w")
  f.close()
  puts("Enter a name for your rubygotchi: ")
  rname = gets.chomp
  test = Rubygotchi.new(rname)
  test.lastAged = Time.now.to_i
  test.display()
  saveToFile("rubygotchi0.txt", test)
end

puts "Enter a command(h to see all commands):".fg("#4254b5")
$stdin.flush
s = gets.chomp
while (s != "q")
  case s
  when "h"
    listCommands()
  when "f"
    test.feed()
  when "p"
    test.play()
  when "s"
    test.display()
  else
    puts("Invalid command. Enter 'h' to see all commands")
  end

  sleep(2)

  #If windows, use cls to clear window. Else, use clear
  if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
    system('cls')
  else
    system('clear')
  end
  puts "Enter a command(h to see all commands):".fg("#4254b5")
  s = gets.chomp

end

#After loop, save data before exiting
saveToFile("rubygotchi0.txt", test)
