require "ruby2d"
module View

    class Ruby2dView 

        def initialize 
            @pixel_size = 40    
        end

        # Principal logistic
        # state, contain all data to render the game 
        def render(state)
            # DSL - domain specific language, specialiced in graphic apps.
            extend Ruby2D::DSL
            set(
                title: "Snake", 
                width: @pixel_size * state.grid.cols, 
                height: @pixel_size * state.grid.rows
            )

            render_snake(state)
            render_food(state)
            show
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
            food = state.food
            render_square(food.row, food.col, 'yellow')
        end

        def render_snake(state)
            positions = state.snake.positions

            positions.each do | item |
                render_square(item.row, item.col, 'green')
            end
        end
    end
end