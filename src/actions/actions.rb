# modify status of the application 

module Actions 
    def self.move_snake(state)
        next_direction = state.next_direction
        next_position = self.calc_next_position(state) 
        # verificar que la siguiente casilla sea valida, de no serlo termina el juego, si es valida mueve la serpiente 
        if position_is_valid?(state, next_position)
            move_snake_to(state, next_position)
        else 
            end_game(state)
        end
    end

    private 
    def self.calc_next_position(state)
        current_position = state.snake.positions.first()
        case state.next_direction
        when Model::Direction::UP
            # decrementar la fila en la que la serpiente se encuentra y mantener la columna
            return Model::Coord.new(current_position.row - 1, current_position.col)
        when Model::Direction::DOWN
            # incrementar la fila y mantener la columna
            return Model::Coord.new(current_position.row + 1, current_position.col)
        when Model::Direction::LEFT
            # decrementar la columna y mantener la fila
            return Model::Coord.new(current_position.row , current_position.col - 1)
        when Model::Direction::RIGHT
            # incrementar la columna y mantener la fila
            return Model::Coord.new(current_position.row , current_position.col + 1)
        end
    end

    # Validar si la siguiente direccion es valida 
    def self.position_is_valid?(state, position)
        # Verificar que la posicion sea invalida 
        is_invalid = ((position.row >= state.grid.rows || position.row < 0) || (position.col >= state.grid.cols || position.col < 0))

        return false if is_invalid
        # verificar si la serpiente no topa con ella misma 
        return !(state.snake.positions.include? position)
    end

    # Mover la serpiente 
    def self.move_snake_to(state, next_position)
        new_positions = [next_position] + state.snake.positions[0..1]
        state.snake.positions = new_positions
        state
    end

    def self.end_game(state)
        state.game_finished = true
        state
    end
end