class Player
  
  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "images/player2_icon.png", true)
    @x = 50
    @y = 150
  end
  
  def draw
    @icon.draw(@x, @y, 1)
  end
  
  def move_left
    if @x < 0
      @x = 0
    else
      @x = @x - 10
    end
  end
  
  def move_right
    if @x > (@game_window.width - 48)
      @x = @game_window.width - 48
    else
      @x = @x + 10
    end
  end
  
  def move_up
    if @y < 0
      @y = 0
    else
      @y = @y - 10
    end
  end
  
  def move_down
    if @y > (@game_window.height - 48)
      @y = @game_window.height - 48
    else
      @y = @y + 10
    end
  end
  
  def hit_by?(balls)
   balls.any? { |ball| Gosu::distance(@x, @y, ball.x, ball.y) < 30 }
  end
  
end