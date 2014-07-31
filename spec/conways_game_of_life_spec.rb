require 'rspec'
require 'cell'
require 'grid'

describe "Cell" do
  describe "initialize" do
    it "initializes a cell with 2 coordinates and a default state of dead" do
      test_cell = Cell.new(30,59)
      expect(test_cell).to be_a Cell
      expect(test_cell.state).to eq " "
    end
  end
  describe 'toggle' do
    it 'toggles the state of the cell' do
      test_cell = Cell.new(30,59)
      test_cell.toggle
      expect(test_cell.state).to eq '/u2588'
    end
  end
end

describe "Grid" do
  describe "initialize" do
    it "initializes the grid with specified dimensions" do
      test_grid = Grid.new(44,88)
      expect(test_grid).to be_a Grid
      expect(test_grid.all_cells[0]).to eq test_grid.find(0,0)
    end
  end

  describe "find" do
    it 'finds cell by coordinates' do
      test_grid = Grid.new(44,88)
      test_cell = Cell.new(45,89)
      test_grid.all_cells << test_cell
      expect(test_grid.find(45,89)).to eq test_cell
    end
  end

  describe "neighbors" do
    it "finds neighbors to the left, right, bottom, top, and diagonal of a specified cell" do
      test_grid = Grid.new(88,44)
      test_cell = test_grid.find(44,22)
      expect(test_grid.neighbors(test_cell)).to eq [test_grid.find(43,21), test_grid.find(43,22), test_grid.find(43,23), test_grid.find(44,21), test_grid.find(44,23), test_grid.find(45,21), test_grid.find(45,22), test_grid.find(45,23)]
    end
    it "finds neighbors to the left, right, bottom, top and diagonal of a border cell" do
      test_grid = Grid.new(88,44)
      test_cell = test_grid.find(87,43)
      expect(test_grid.neighbors(test_cell)).to eq [test_grid.find(86,42), test_grid.find(86,43), test_grid.find(86,0), test_grid.find(87,42), test_grid.find(87,0), test_grid.find(0,42), test_grid.find(0,43), test_grid.find(0,0)]
    end
  end
end
