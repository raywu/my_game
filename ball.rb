class Ball
  def initialize(game_window)
    @game_window = game_window
    @x = rand(@game_window.width)
    @y = 0
    @icon = Gosu::Image.new(@game_window, "images/player1_icon.jpg", true)
  end
  
  def update
    if @y > @game_window.height
      @x = rand(@game_window.width)
      @y = 0
    else
      @y = @y + 10
    end
  end
  
  def draw
    @icon.draw(@x, @y, 2)
  end
  
  def x
    @x
  end
  
  def y
    @y
  end
  
  def reset!
    @x = rand(@game_window.width)
    @y = 0
  end
  
end