require "ruby2d"
module View

    class Ruby2dView 

        def initialize 
            @pixel_size = 40    
        end

        def start(state)
            # DSL - domain specific language, specialiced in graphic apps.
            extend Ruby2D::DSL
            set(
                title: "Snake", 
                width: @pixel_size * state.grid.cols, 
                height: @pixel_size * state.grid.rows
            )
            show
        end

        # Principal logistic
        # state, contain all data to render the game 
        def render_elements(state)
            render_snake(state)
            render_food(state)
        end

        # Render figures
        def render_square(row, col, color)
            extend Ruby2D::DSL
            Square.new(
                x: col * @pixel_size, 
                y: row * @pixel_size, 
                size: @pixel_size, 
                color: color
            )
        end

        #Methods to render an element 
        private

        def render_food(state)
            @food.remove if @food
            food = state.food
            @food = render_square(food.row, food.col, 'yellow')
        end

        def render_snake(state)
            # Delete last renders 
            @snake_positions.each(&:remove) if @snake_positions
            
            positions = state.snake.positions
            @snake_positions = positions.map do | item |
                render_square(item.row, item.col, 'green')
            end
        end
    end
end