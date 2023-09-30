require 'minitest/autorun'
require_relative '../lib/robot'
require_relative '../lib/table'
require_relative '../lib/commands/command'
require_relative '../lib/commands/place_command'

class IntegrationTest < Minitest::Test
    def setup
        table = Table.new
        @robot = Robot.new(table)
    end

    def test_that_robot_can_execute_series_of_commands
        command = PlaceCommand.new(@robot, 0, 0, 'NORTH')
        command.execute
        command = MoveCommand.new(@robot)
        command.execute
        assert_equal 0, @robot.x
        assert_equal 1, @robot.y
        assert_equal 'NORTH', @robot.direction
    end
  
  
    def test_place_and_report
        @robot.execute("PLACE 1,1,NORTH")
        assert_equal [1, 1, "NORTH"], @robot.report
    end

    def test_move_and_report
        @robot.execute("PLACE 0,0,EAST")
        @robot.execute("MOVE")
        assert_equal [1, 0, "EAST"], @robot.report
    end

   
    def test_turn_and_move
        @robot.execute("PLACE 1,1,EAST")
        @robot.execute("LEFT")  
        @robot.execute("MOVE")
        assert_equal [1, 2, "NORTH"], @robot.report
    end

    
    def test_prevent_fall_from_table
        @robot.execute("PLACE 4,4,NORTH")
        @robot.execute("MOVE") 
        assert_equal [4, 4, "NORTH"], @robot.report
    end

    
    def test_ignore_commands_until_valid_place
        @robot.execute("MOVE")
        @robot.execute("LEFT")
        assert_nil @robot.report  

        @robot.execute("PLACE 2,2,WEST")
        assert_equal [2, 2, "WEST"], @robot.report
    end

end
