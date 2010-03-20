require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe GameOfLife do
  describe "centre cell" do
    describe "when alive" do
      describe "with 0 neighbours" do
        it "dies" do
          game = GameOfLife.new [%w(. . .), %w(. x .), %w(. . .)]
          game.evolve
          game.life_at(1, 1).should be_false
        end
      end

      describe "with 1 neighbour" do
        it "dies" do
          game = GameOfLife.new [%w(. . .), %w(x x .), %w(. . .)]
          game.evolve
          game.life_at(1, 1).should be_false
        end
      end

      describe "with 2 neighbours" do
        it "lives" do
          game = GameOfLife.new [%w(. . .), %w(x x x), %w(. . .)]
          game.evolve
          game.life_at(1, 1).should be_true
        end
      end

      describe "with 3 neighbours" do
        it "lives" do
          game = GameOfLife.new [%w(. x .), %w(x x x), %w(. . .)]
          game.evolve
          game.life_at(1, 1).should be_true
        end
      end

      describe "with 4 neighbours" do
        it "dies" do
          game = GameOfLife.new [%w(. x .), %w(x x x), %w(. x .)]
          game.evolve
          game.life_at(1, 1).should be_false
        end
      end
    end

    describe "when dead" do
      describe "with 0 neighbours" do
        it "stays dead" do
          game = GameOfLife.new [%w(. . .), %w(. . .), %w(. . .)]
          game.evolve
          game.life_at(1, 1).should be_false
        end
      end

      describe "with 1 neighbour" do
        it "stays dead" do
          game = GameOfLife.new [%w(. . .), %w(x . .), %w(. . .)]
          game.evolve
          game.life_at(1, 1).should be_false
        end
      end

      describe "with 2 neighbours" do
        it "stays dead" do
          game = GameOfLife.new [%w(. . .), %w(x . x), %w(. . .)]
          game.evolve
          game.life_at(1, 1).should be_false
        end
      end

      describe "with 3 neighbours" do
        it "comes to life" do
          game = GameOfLife.new [%w(. x .), %w(x . x), %w(. . .)]
          game.evolve
          game.life_at(1, 1).should be_true
        end
      end

      describe "with 4 neighbours" do
        it "stays dead" do
          game = GameOfLife.new [%w(. x .), %w(x . x), %w(. x .)]
          game.evolve
          game.life_at(1, 1).should be_false
        end
      end
    end
  end
end
