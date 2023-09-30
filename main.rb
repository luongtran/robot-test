require_relative 'lib/robot'
require_relative 'lib/table'
require_relative 'lib/commands/command'
require_relative 'lib/commands/place_command'
require_relative 'lib/commands/move_command'

table = Table.new
robot = Robot.new(table)

def execute_command(robot, command_line)
  parts = command_line.split
  command_name = parts[0]
  
  case command_name
  when 'PLACE'
    x, y, direction = parts[1].split(',')
    cmd = PlaceCommand.new(robot, x.to_i, y.to_i, direction)
  when 'MOVE'
    cmd = MoveCommand.new(robot)
  when 'LEFT'
    cmd = LeftCommand.new(robot)
  when 'RIGHT'
    cmd = RightCommand.new(robot)
  when 'REPORT'
    puts "Output: #{robot.x},#{robot.y},#{robot.direction}"
    return
  else
    puts "Unknown command: #{command_name}"
    return
  end
  
  cmd.execute
end

puts "Robot Simulator"
puts "Enter your commands (PLACE, MOVE, LEFT, RIGHT, REPORT). Type 'EXIT' to stop."

loop do
  print "> "
  input = gets.chomp
  break if input == 'EXIT'
  execute_command(robot, input)
end
