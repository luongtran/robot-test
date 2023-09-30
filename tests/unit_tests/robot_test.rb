require 'minitest/autorun'
require_relative '../lib/robot'
require_relative '../lib/table'

class RobotTest < Minitest::Test
    def setup
        table = Table.new
        @robot = Robot.new(table)
    end

    def test_that_robot_can_be_placed_correctly
        @robot.place(1, 2, 'NORTH')
        assert_equal 1, @robot.x
        assert_equal 2, @robot.y
        assert_equal 'NORTH', @robot.direction
    end
    
    def test_place_valid_position
        @robot.execute("PLACE 2,2,EAST")
        assert_equal [2, 2, "EAST"], @robot.report
    end

    def test_place_invalid_position
        @robot.execute("PLACE 6,6,WEST")
        assert_nil @robot.report 
    end
    
    
    def test_move_forward_east
        @robot.execute("PLACE 2,2,EAST")
        @robot.execute("MOVE")
        assert_equal [3, 2, "EAST"], @robot.report
    end

    
    def test_turn_left_from_east_to_north
        @robot.execute("PLACE 2,2,EAST")
        @robot.execute("LEFT")
        assert_equal [2, 2, "NORTH"], @robot.report
    end

    
    def test_move_at_edge
        @robot.execute("PLACE 0,0,WEST")
        @robot.execute("MOVE")
        assert_equal [0, 0, "WEST"], @robot.report  
    end


    def test_report_before_place
        assert_nil @robot.report  
    end

    
    def test_move_before_place
        @robot.execute("MOVE")
        assert_nil @robot.report  
    end

    
    def test_turn_before_place
        @robot.execute("LEFT")
        assert_nil @robot.report
        @robot.execute("RIGHT")
        assert_nil @robot.report
    end

  
    def test_turn_right_from_north_to_east
        @robot.execute("PLACE 2,2,NORTH")
        @robot.execute("RIGHT")
        assert_equal [2, 2, "EAST"], @robot.report
    end

    
    def test_turn_right_from_east_to_south
        @robot.execute("PLACE 2,2,EAST")
        @robot.execute("RIGHT")
        assert_equal [2, 2, "SOUTH"], @robot.report
    end

    
    def test_turn_right_from_south_to_west
        @robot.execute("PLACE 2,2,SOUTH")
        @robot.execute("RIGHT")
        assert_equal [2, 2, "WEST"], @robot.report
    end

    def test_turn_right_from_west_to_north
        @robot.execute("PLACE 2,2,WEST")
        @robot.execute("RIGHT")
        assert_equal [2, 2, "NORTH"], @robot.report
    end

   
    def test_turn_right_multiple_times
        @robot.execute("PLACE 2,2,NORTH")
        @robot.execute("RIGHT")  
        @robot.execute("RIGHT")  
        @robot.execute("RIGHT")  
        @robot.execute("RIGHT")  
        assert_equal [2, 2, "NORTH"], @robot.report
    end

end
