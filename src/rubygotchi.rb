#class definition of rubygotchi

class Rubygotchi
  def initialize(s)
    @name = s
    @age = 0;
    @fullness = 10;
    @happiness = 5;
  end

  def display
    puts("My name is #{@name}")
    puts("I am #{@age} days old")
    puts("My happiness is #{@happiness}")
    puts("My fullness is #{@fullness}")
    puts("")
  end

  def play
    if (@happiness < 10)
      @happiness += 1
    end
    puts("Happiness increased to #{@happiness}")
    puts("")
  end

  def feed
    if (@fullness < 10)
      @fullness += 1
    end
  puts("Fullness increased to #{@fullness}")
  puts("")
  end

  def setAge(i)
    @age = i
  end

  def setHappiness(i)
    @happiness = i
  end

  def setFullness(i)
    @fullness = i
  end

  def getAge()
    return @age
  end

  def getName()
    return @name
  end

  def getHappiness()
    return @happiness
  end

  def getFullness()
    return @fullness
  end

end

def initFromFile(file)
  f = File.open(file, "r")
  name = f.gets.chomp
  age = f.gets.chomp.to_i
  happiness = f.gets.chomp.to_i
  fullness = f.gets.chomp.to_i
  t = Rubygotchi.new(name)
  t.setAge(age)
  t.setHappiness(happiness)
  t.setFullness(fullness)
  f.close()
  return t
end

def saveToFile(file, t)
  f = File.open(file, "w")
  f.write(t.getName())
  f.write("\n")
  f.write(t.getAge())
  f.write("\n")
  f.write(t.getHappiness())
  f.write("\n")
  f.write(t.getFullness())
  f.write("\n")
end

def listCommands()
  puts("q - quit")
  puts("h - help")
  puts("f - feed")
  puts("p - play")
  puts("s - status")
  puts("")
end

if (File.exist?("rubygotchi0.txt"))
  test = initFromFile("rubygotchi0.txt")
  test.display()
else
  f = File.new("rubygotchi0.txt", "w")
  f.close()
  puts("Enter a name for your rubygotchi: ")
  rname = gets.chomp
  test = Rubygotchi.new(rname)
  test.display()
  test.play()
  test.display()
  saveToFile("rubygotchi0.txt", test)
end


puts("Enter a command(h to see all commands):")
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
  puts("Enter a command(h to see all commands):")
  s = gets.chomp
end
