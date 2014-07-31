require './lib/cell'
require './lib/grid'


puts "Conway's Game of Life"
puts "What dimensions would you like for the grid?"
puts "Horizontal length: "
x_coord = gets.chomp.to_i
puts "Vertical height: "
y_coord = gets.chomp.to_i
puts "What percent of cells do you want to start alive?"
percent = gets.chomp.to_i
grid = Grid.new(x_coord, y_coord)
grid.randomize(percent)
grid.all_cells.each do |cell|
  puts cell.state
  if cell.x % x_coord == 0
    puts "\n"
  end
end

