#Minigame A
require "curses"
include Curses

Keys =["<","^", ">", "v"]
BOTTOM = 7
srand Time.now.to_i #seed random generator

#Class to represent inputs
class RythmInput
  def initialize()
    key = rand(4)
    @key = Keys[key]
    @keypos = key
    @height = BOTTOM
  end
  def key=(i)
    @key=i
  end
  def key
    return @key
  end
  def moveUp
    @height = @height - 1
  end
  def render
    setpos(@height, 2*@keypos)
    addstr("#{key}")
  end
  def height
    return @height
  end
end

#DRAW the top bar, with colors
def drawTop
  attron(color_pair(1))
  addstr("< ")
  attroff(color_pair(1))
  attron(color_pair(2))
  addstr("^ ")
  attroff(color_pair(2))
  attron(color_pair(3))
  addstr("> ")
  attroff(color_pair(3))
  attron(color_pair(4))
  addstr("v ")
  attroff(color_pair(4))
end

#Draw line for score
def drawScore(s)
  attron(color_pair(6))
  setpos(12,0)
  addstr("Score: #{s}")
  setpos(0,0)
end

#Draw line for mistakes
def drawMistakes(m)
  attron(color_pair(6))
  setpos(13,0)
  addstr("Mistakes: #{m}")
  setpos(0,0)
end

#Game itself
def rythmGame

  score  = 0
  maxMistakes = 5
  mistakes = 0

  stdscr = init_screen
  stdscr.keypad=true

  #initialize colors from curses
  start_color
  init_pair(1, COLOR_RED,COLOR_BLACK)
  init_pair(2, COLOR_GREEN, COLOR_BLACK)
  init_pair(3, COLOR_CYAN, COLOR_BLACK)
  init_pair(4, COLOR_YELLOW, COLOR_BLACK)
  init_pair(5, COLOR_MAGENTA, COLOR_BLACK)
  init_pair(6, COLOR_BLUE, COLOR_BLACK)

  arr = []

  checkFor = "" #Initially no input is at top
  stdscr.nodelay = true

  while mistakes < maxMistakes
    if(inp = getch)
      case inp
      when 259
        inp = "^"
      when 258
        inp = "v"
      when 260
        inp = "<"
      when 261
        inp = ">"
      end
      setpos(9,0)
      if inp == checkFor
        score += 1
      else
        mistakes += 1
      end
    elsif checkFor != ""
      mistakes += 1
    end
    setpos(0,0)
    drawTop()
    drawScore(score)
    drawMistakes(mistakes)
    attron(color_pair(5))
    r = RythmInput.new
    arr.insert(-1,r)
    for i in arr
      i.moveUp
      if i.height == 0
        checkFor = i.key
      end
      if i.height != -1
        i.render
      else
        arr.delete(i)
      end
    end
    refresh
    sleep(0.75)
    attroff(color_pair(5))
    clear
  end
  close_screen
  return [score/10, 1].max
end
