class Robot
    attr_accessor :x, :y, :direction
  
    def initialize(table)
      @table = table
      @x, @y = nil, nil
      @direction = nil
    end
  
    def place(x, y, f)
      return unless x.between?(0,4) && y.between?(0,4) && Direction::DIRECTIONS.include?(f)
  
      @x, @y = x, y
      @direction = Direction.new(f)
      @placed = true
    end
  
    def move
      return unless @placed

      new_x, new_y = @x, @y
  
      case @direction.current
      when 'NORTH'
        new_y += 1
      when 'SOUTH'
        new_y -= 1
      when 'EAST'
        new_x += 1
      when 'WEST'
        new_x -= 1
      end
      if @table.valid_position?(new_x, new_y)
        @x, @y = new_x, new_y
      end
    end
  
    def left
      @direction.turn_left if @placed
    end
  
    def right
      @direction.turn_right if @placed
    end
  
    def report
      return "Robot not placed" unless @placed
      "#{@x},#{@y},#{@direction.current}"
    end
end
  