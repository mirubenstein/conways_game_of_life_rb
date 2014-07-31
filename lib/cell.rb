class Cell
  attr_accessor(:state, :state_new)
  attr_reader(:x, :y)

  def initialize(x_coord, y_coord)
    @x = x_coord
    @y = y_coord
    @state = " "
    @state_new = " "
  end

  def toggle
    @state == " " ? @state = "/u2588" : @state = " "
    @state_new == " " ? @state_new = "/u2588" : @state_new = " "
  end
end
