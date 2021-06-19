class Laser
  attr_accessor :x, :y
  def initialize(player, window)
    @player = player
    @window = window
    @shooting = false
    @x = @player.x
    @y = @player.y
    @icon_2 = Gosu::Image.new(@window, "H:/Ruby file/picture/nangua.jpg",true)#if change file place here must change either.
end
def shoot
     @shooting = true
end

def update
    if @shooting
      @y = @y - 160
      if @y < 0
         @shooting = false
      end
    else
        @x = @player.x
        @y = @player.y
    end
  end

  def draw
    if @shooting
      @icon_2.draw(@x,@y,3)
    else
      @icon_2.draw(@player.x,@player.y,3)
    end
  end
end
