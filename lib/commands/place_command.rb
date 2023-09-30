class PlaceCommand < Command
    def initialize(robot, x, y, direction)
      @robot = robot
      @x = x
      @y = y
      @direction = direction
    end
  
    def execute
      @robot.place(@x, @y, @direction)
    end
end