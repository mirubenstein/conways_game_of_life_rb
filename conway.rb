require './lib/cell'
require './lib/grid'


puts "Conway's Game of Life"
puts "What dimensions would you like for the grid?"
puts "Horizontal length: "
@x_coord = gets.chomp.to_i
puts "Vertical height: "
@y_coord = gets.chomp.to_i
puts "What percent of cells do you want to start alive?"
percent = gets.chomp.to_i
@grid = Grid.new(@x_coord, @y_coord)
@grid.randomize(percent)

def run
  puts "\e[H\e[2J"
  @grid.all_cells.each do |cell|
    print cell.state
    if cell.y % @x_coord == 0
      puts "\n"
    end
  end
  @grid.tick
  run
end
run
