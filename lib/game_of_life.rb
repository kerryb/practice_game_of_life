class GameOfLife
  attr_reader :grid

  def initialize seed
    @grid = seed
  end

  def evolve
    cell = grid[1][1]
    neighbours = [
      grid[0][0],
      grid[0][1],
      grid[0][2],
      grid[1][0],
      grid[1][2],
      grid[2][0],
      grid[2][1],
      grid[2][2]
    ]
    living_neighbours = neighbours.count {|n| n == "x"}
    range_for_life = life_at(1, 1) ? [2, 3] : [3]
    grid[1][1] = range_for_life.include?(living_neighbours) ? "x" : "."
  end

  def life_at x, y
    grid[x][y] == "x"
  end
end
