$: << File.expand_path(File.dirname(__FILE__)) 
require 'rubygems'
require 'gosu'
require 'player'
require 'ball'

class MyGame < Gosu::Window
  def initialize
    super(300, 400, false)
    @player1 = Player.new(self)
    @ball = Ball.new(self)
    @running = true
  end
  
  def update
    if @running
      if button_down? Gosu::Button::KbLeft
        @player1.move_left
      end
    
      if button_down? Gosu::Button::KbUp
        @player1.move_up
      end
    
      if button_down? Gosu::Button::KbDown
        @player1.move_down
      end
    
      if button_down? Gosu::Button::KbRight
        @player1.move_right
      end
    
      @ball.update
    
      if @player1.hit_by? @ball
        stop_game!
      end
    else
      #the game is currently stopped
      if button_down? Gosu::Button::KbEscape
        restart_game
      end
    end
    
  end
  
  def draw
    @player1.draw
    @ball.draw
  end
  
  def stop_game!
    @running = false
  end
  
  def restart_game
    @running = true
    @ball.reset!
  end

end

window = MyGame.new
window.show