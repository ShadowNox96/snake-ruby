module Model 

    # Basics classes
    class Coord < Struct.new(:row, :col)
    end

    class Food < Coord
    end

    # Positions like {postitions: [(1,3), (1,4)]}
    class Snake < Struct.new(:positions)
    end

    class Grid < Struct.new(:rows, :cols)
    end

    class State < Struct.new(:snake, :food, :grid)
    end

    def self.initial_state
        Model::State.new(
            Model::Snake.new([
                Model::Coord.new(1,1),
                Model::Coord.new(0,1)
            ]
            ), 
            Model::Food.new(4,4), 
            Model::Grid.new(10,16)
        )
    end
end
