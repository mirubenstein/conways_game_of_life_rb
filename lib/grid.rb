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

  def neighbors(cell)
    # [self.find((cell.x - 1) % 88, cell.y), self.find((cell.x + 1) % 88, cell.y), self.find(cell.x, (cell.y - 1) % 44), self.find(cell.x, (cell.y + 1) % 44)]
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
end
