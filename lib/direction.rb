class Direction
    DIRECTIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']
  
    def initialize(current_direction)
      @index = DIRECTIONS.index(current_direction)
    end
  
    def current
      DIRECTIONS[@index]
    end
  
    def turn_left
      @index = (@index - 1) % 4
    end
  
    def turn_right
      @index = (@index + 1) % 4
    end
end
  