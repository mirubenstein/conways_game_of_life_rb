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
end

describe "Grid" do
  describe "initialize" do
    it "initializes the grid with specified dimensions" do
      test_grid = Grid.new(10,10)
      expect(test_grid).to be_a Grid
      expect(test_grid.all_cells[0]).to eq test_grid.find(0,0)
    end
  end

  describe "randomize" do
    it "randomly assigns cells to start as alive or dead" do
      test_grid = Grid.new(5,5)
      test_grid.stub(:rand).and_return(50)
      test_grid.randomize(50)
      expect(test_grid.find(2,2).state).to eq "\u2588"
      expect(test_grid.find(2,2).state_new).to eq "\u2588"
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

  describe "alive_neighbors" do
    it "returns count of alive neighbors" do
      test_grid = Grid.new(88,44)
      test_cell = test_grid.find(87,43)
      test_cell2 = test_grid.find(86,43)
      test_cell2.state = "\u2588"
      expect(test_grid.alive_neighbors(test_cell)).to eq 1
    end
  end

  describe "tick" do
    it "any cell with exactly 0 or 1 live neighbors dies" do
      test_grid = Grid.new(88,44)
      test_cell = test_grid.find(87,43)
      test_cell2 = test_grid.find(86,43)
      test_cell3 = test_grid.find(85,43)
      test_cell.state = "\u2588"
      test_cell2.state = "\u2588"
      test_cell3.state = "\u2588"
      test_cell.state_new = "\u2588"
      test_cell2.state_new = "\u2588"
      test_cell3.state_new = "\u2588"
      test_grid.tick
      expect(test_cell2.state).to eq "\u2588"
      expect(test_cell3.state).to eq " "
    end

    it "any cell with 4 or more live neighbors dies" do
      test_grid = Grid.new(88,44)
      test_cell = test_grid.find(44,22)
      test_cell2 = test_grid.find(44,21)
      test_cell3 = test_grid.find(44,23)
      test_cell4 = test_grid.find(43,22)
      test_cell5 = test_grid.find(45,22)
      test_cell.state = "\u2588"
      test_cell2.state = "\u2588"
      test_cell3.state = "\u2588"
      test_cell4.state = "\u2588"
      test_cell5.state = "\u2588"
      test_cell.state_new = "\u2588"
      test_cell2.state_new = "\u2588"
      test_cell3.state_new = "\u2588"
      test_cell4.state_new = "\u2588"
      test_cell5.state_new = "\u2588"
      test_grid.tick
      expect(test_cell.state).to eq " "
      expect(test_cell3.state).to eq "\u2588"
    end

    it "any cell with exactly 3 live neighbors lives" do
      test_grid = Grid.new(88,44)
      test_cell = test_grid.find(44,22)
      test_cell2 = test_grid.find(44,21)
      test_cell3 = test_grid.find(44,23)
      test_cell4 = test_grid.find(43,22)
      test_cell2.state = "\u2588"
      test_cell3.state = "\u2588"
      test_cell4.state = "\u2588"
      test_cell2.state_new = "\u2588"
      test_cell3.state_new = "\u2588"
      test_cell4.state_new = "\u2588"
      test_grid.tick
      expect(test_cell.state).to eq "\u2588"
      expect(test_cell3.state).to eq " "
    end
  end
end
