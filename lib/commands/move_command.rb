class MoveCommand < Command
    def initialize(robot)
      @robot = robot
    end
  
    def execute
      @robot.move
    end
end