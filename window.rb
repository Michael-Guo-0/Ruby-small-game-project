class MyWindow < Gosu::Window
  def initialize
    super(1500,1000,false) # width, length, option(fullscreen, resizable, update_interval)
    self.caption = 'Hello World!'
    @boy_1 = Player.new(self)
    #@bullet = [Bullet.new(self), Bullet.new(self)]
    @bullet = (1+ Random.rand(4)).times.map{Bullet.new(self)}#[Bullet.new(self), Bullet.new(self)]
    @running = true
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    @background = Gosu::Image.new(self, "H:/Ruby file/picture/back.jpg",true)
    @timer = Timer.new(self, @bullet)
    #@laser = Laser.new(@boy_1,self)
=begin
for line 6 : 5.time it means loop 4 times about {....} and add .map it means do {function} "function" 4 times,whcih
create 5  same Bullet objects.
=end
  end
  def update
  if @running
    if @boy_1.get_hits?(@bullet)
       @running = false
    else
      run_game
   end
 end
  if @running == false and button_down? Gosu::Button::KbQ and @boy_1.lives > 0
      @running = true
      @boy_1.reset
  end
end
def run_game
=begin
    if button_down? Gosu::Button::KbLeft
      @boy_1.move_left
    end

    if button_down? Gosu::Button::KbRight
       @boy_1.move_right
    end
     if button_down? Gosu::Button::KbSpace
      @laser.shoot
    end
    @laser.update
=end
    live_bullet.each {|bullet|bullet.update (@boy_1.laser)}
    @boy_1.update
    @timer.update
end

def live_bullet
  @bullet.select{|bullets| bullets.alive == true}
end


  def draw
    @background.draw(0,0,1)
    @boy_1.draw
    live_bullet.each {|bullet| bullet.draw}
    #@laser.draw
    @font.draw("Lives: #{@boy_1.lives}", 10, 10, 3.0, 1.0, 1.0, 0xffcfffff)
  end
end
