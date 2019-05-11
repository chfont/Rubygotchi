#class definition of rubygotchib
require "tco"
require_relative "minigames/minigameA"

class Rubygotchi
  def initialize(s)
    @lastInit = Time.now.to_i
    @name = s
    @age = 0;
    @fullness = 10;
    @happiness = 5;
    @lastFedCheck = Time.now.to_i
    @lastPlayed = Time.now.to_i
  end

  def display
    puts("Status: ".fg("#4254b5"))
    print("My name is ")
    puts "#{@name}".fg("#70ffb5")
    print("I am")
    print " #{@age} ".fg("#70ffb5")
    puts "days old"
    print "My happiness is "
    puts "#{@happiness}".fg("#70ffb5")
    print ("My fullness is ")
    puts "#{@fullness}".fg("#70ffb5")
    puts("")
  end

  def play
    res = rythmGame
    if (@happiness < 10)
      @happiness += res
      @happiness = [@happiness, 10].min
    end
    @lastPlayed = Time.now.to_i
    puts("Happiness increased to #{@happiness}")
    puts("")
  end

  def feed
    if (@fullness < 10)
      @fullness += 1
    end
  @lastFedCheck = Time.now.to_i
  puts("Fullness increased to #{@fullness}")
  puts("")
  end

  #Getter and Setter methods

  def lastInit()
    return @lastInit
  end

  def age=(i)
    @age = i
  end

  def happiness=(i)
    @happiness = i
  end

  def fullness=(i)
    @fullness = i
  end

  def age()
    return @age
  end

  def name()
    return @name
  end

  def happiness()
    return @happiness
  end

  def fullness()
    return @fullness
  end

  def lastFedCheck()
    return @lastFedCheck
  end
  def lastPlayed()
    return @lastPlayed
  end
  def lastInit=(i)
    @lastInit = i
  end
  def lastFedCheck=(i)
    @lastFedCheck = i
  end
  def lastPlayed=(i)
    @lastPlayed = i
  end
  def lastAged=(i)
    @lastAged = i
  end
  def lastAged()
    return @lastAged
  end

end
