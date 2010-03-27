class GameOfLife
  attr_reader :grid

  def initialize seed
    @grid = seed
  end

  def evolve
    new_grid = Array.new(grid.size) {Array.new(grid.first.size, ".")}
    (0...grid.size).each do |x|
      (0...grid.first.size).each do |y|
        neighbours = neighbours_of x, y
        living_neighbours = neighbours.count {|n| n == "x"}
        range_for_life = life_at(x, y) ? [2, 3] : [3]
        new_grid[x][y] = "x" if range_for_life.include?(living_neighbours)
      end
    end
    @grid = new_grid
  end

  def life_at x, y
    grid[x][y] == "x"
  end

  private

  def neighbours_of x, y
    neighbours = []
    neighbours << grid[x - 1][y - 1] unless x == 0 || y == 0
    neighbours << grid[x][y - 1] unless y == 0
    neighbours << grid[x + 1][y - 1] unless x == grid.size - 1 || y == 0
    neighbours << grid[x - 1][y] unless x == 0
    neighbours << grid[x + 1][y] unless x == grid.size - 1
    neighbours << grid[x - 1][y + 1] unless x == 0 || y == grid.first.size - 1
    neighbours << grid[x][y + 1] unless y == grid.first.size - 1
    neighbours << grid[x + 1][y + 1] unless x == grid.size - 1 || y == grid.first.size - 1
    neighbours
  end
end
