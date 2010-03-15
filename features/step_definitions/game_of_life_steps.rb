Given "the following setup" do |table|
  seed = table.raw
  @centre_x = seed.first.size / 2
  @centre_y = seed.size / 2
  @game = GameOfLife.new seed
end

When "I evolve the board" do
  @game.evolve
end

Then "the centre cell should be dead" do
  @game.life_at(@centre_x, @centre_y).should be_true
end

Then "the centre cell should be alive" do
  @game.life_at(@centre_x, @centre_y).should be_false
end

Then "I should see the following board" do |table|
  @game.grid.should == table.raw
end
