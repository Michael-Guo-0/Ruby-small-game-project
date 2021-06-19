class Timer
  def initialize(window, bullets)
    @bullets = bullets
    @window = window
    @start_time = Time.now
    @every_n_second = 5
    @last_reconded_seconds = 0
  end
  def update
    @bullets<< Bullet.new(@window) if add_bullets? #<< add Bullet.new(@window) after bullet
  end
  def seconds
    (Time.now-@start_time).to_i
  end

  def add_bullets?
     if seconds !=@last_reconded_seconds and seconds%@every_n_second == 0
       @last_reconded_seconds = seconds
       true
     else
       false
     end
  end
end
