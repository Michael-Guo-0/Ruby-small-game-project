class Player
  attr_accessor :lives, :x, :y, :laser
  def initialize(window)
    @window = window
    @icon_1 = Gosu::Image.new(@window,"H:/Ruby file/picture/images.jpg",true)#if change file place here must change either.
    @x = 700
    @y = window.height - 160
    @explosion = Gosu::Image.new(@window,"H:/Ruby file/picture/exp.jpg",true)#if change file place here must change either.
    @exploded = false
    @lives = 100
    @laser = Laser.new(self,@window)
  end

  def update
    if @window.button_down? Gosu::Button::KbLeft
       move_left
    end
    if @window.button_down? Gosu::Button::KbRight
       move_right
    end
    if @window.button_down? Gosu::Button::KbSpace
       @laser.shoot
    end
      @laser.update
  end

  def move_left
    @x = @x-10
    if @x < 0
       @x = 0
    end
  end
  def move_right
    @x = @x+10
    if @x > @window.width-160
      @x = @window.width-160
    end
  end
  def draw
    if @exploded
      @explosion.draw(@x,@y,3)
    else
      @icon_1.draw(@x,@y,1)
      @laser.draw
    end
  end
  def get_hits?(bullets)
    #if Gosu.distance(bullet.x, bullet.y, @x, @y) < 160
      #@exploded = true
      @exploded = bullets.any? {|bullet| Gosu.distance(bullet.x, bullet.y, @x, @y) < 160}
      if @exploded
         @lives = @lives - 1
      end

  end

  def reset
    @x = rand(@window.width)
 end
end
