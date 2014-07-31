class Cell
  attr_accessor(:state)
  attr_reader(:x, :y)

  def initialize(x_coord, y_coord)
    @x = x_coord
    @y = y_coord
    @state = " "
  end

  def toggle
    @state == " " ? @state = "/u2588" : @state = " "
  end
end
