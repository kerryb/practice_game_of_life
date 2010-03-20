class GameOfLife
  attr_reader :grid

  def initialize seed
    @grid = seed
  end

  def evolve
    x, y = 1, 1
    neighbours = neighbours_of x, y
    living_neighbours = neighbours.count {|n| n == "x"}
    range_for_life = life_at(1, 1) ? [2, 3] : [3]
    grid[1][1] = range_for_life.include?(living_neighbours) ? "x" : "."
  end

  def life_at x, y
    grid[x][y] == "x"
  end

  private

  def neighbours_of x, y
    [
      grid[x - 1][y - 1],
      grid[x][y - 1],
      grid[x + 1][y - 1],
      grid[x - 1][y],
      grid[x + 1][y],
      grid[x - 1][y + 1],
      grid[x][y + 1],
      grid[x + 1][y + 1],
    ]
  end
end
