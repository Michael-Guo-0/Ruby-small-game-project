class Bullet
  attr_accessor :x, :y, :alive
  def initialize(window)
    @window = window
    @icon = Gosu::Image.new(@window,"H:/Ruby file/picture/bce.jpg",true)#if change file place here must change either.
    @y = 0
    @x = rand(@window.width)
    @alive = true
  end
  def update(laser)
    @y = @y + 10
    if @y > @window.height
      @y = 0
      @x = rand(@window.width)
    end
    if @x > @window.width - 160
       @x = @window.width - 160
    elsif @x < 0
       @x = 0
    end
    get_hit?(laser)
  end
  def get_hit?(laser)
    if Gosu.distance(laser.x, laser.y,@x, @y) < 160
      @alive = false
    end
  end
  def draw
    @icon.draw(@x, @y, 2)
  end
end
