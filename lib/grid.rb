class Grid
  attr_accessor(:all_cells)
  attr_reader(:x_dim, :y_dim)

  def initialize(x_dim, y_dim)
    @x_dim = x_dim
    @y_dim = y_dim
    @all_cells = []
    (0..@x_dim-1).each do |x|
      (0..@y_dim-1).each do |y|
        @all_cells << Cell.new(x, y)
      end
    end
  end

  def find(x, y)
    @all_cells.select{|cell| cell.x == x && cell.y == y}[0]
  end

  def randomize(percent)
    @all_cells.map do |cell|
      if rand(100) <= percent
        cell.state = "\u2588"
        cell.state_new = "\u2588"
      end
    end
  end

  def neighbors(cell)
    neighbors = []
    (-1..1).each do |x|
      (-1..1).each do |y|
        if !(x == 0 && y == 0)
          neighbors << self.find((cell.x + x)% @x_dim, (cell.y + y)% @y_dim)
        end
      end
    end
    neighbors
  end

  def alive_neighbors(cell)
    self.neighbors(cell).count{|neighbor| neighbor.state == "\u2588"}
  end

  def tick
    @all_cells.each do |cell|
      value = self.alive_neighbors(cell)
      cell.state_new = ' ' if !(value.between?(2,3))
      cell.state_new = "\u2588" if value == 3
    end
    @all_cells.each {|cell| cell.state = cell.state_new}
  end

end
