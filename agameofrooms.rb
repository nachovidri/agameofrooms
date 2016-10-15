require "pry"

class Maze

	attr_accessor :list_of_rooms

	def initialize rooms
		@list_of_rooms = rooms
	end

	def print_maze
		@list_of_rooms.each do |room|
			puts "#{room.room_description}"
		end
	end
end


class Room
	
	attr_accessor :room_description, :room_exits

	def initialize des, north_exit, east_exit, south_exit, west_exit
		@room_description = des
		@room_exits = {"N" => north_exit, "E" => east_exit, "S" => south_exit, "W" => west_exit}
	end
end

class Game

	def initialize maze, player
		@maze = maze
		@player = player
		@end_game = true
	end

	def start_game
		while (end_game && @player.evaluate_player_life)
			ask_user
			evaluate_turn
		end
		end_of_game
	end

	def end_of_game
		if @end_game == false
			puts "CONGRATS, YOU ARE OUT OF THE MAZE"
		else
			puts "GAME OVER"
		end
	end

	def ask_user
		puts @maze.list_of_rooms[@player.position].room_description
		puts "Please enter where would you like to head"
		@user_input = gets.chomp
	end

	def evaluate_turn
		# binding.pry

		if @maze.list_of_rooms[@player.position].room_exits[@user_input] == false
			puts "Try again. You still in room #{@player.position}"
			@player.substract_life
		else
			@player.position = @maze.list_of_rooms[@player.position].room_exits[@user_input]
			puts "Congrats, you have advanced to room #{@player.position}"
		end
	
	# 	if @user_input == @maze.list_of_rooms[@player.position].room_exit
	# 		@player.position = @player.position + 1
	# 	else
	# 		
	# 	end
	end

	def end_game
		if @player.position == 10
			@end_game = false
		else
			@end_game
		end
	end
end

class Player

	attr_accessor :position

	def initialize 
		@lifes = 3
		@player_alive = true
		@position = 0
	end

	def substract_life
		@lifes = @lifes - 1
	end

	def evaluate_player_life
		if @lifes > 0
			@player_alive = true
		else
			@player_alive = false
		end
	end
end

room0 = Room.new("You are in a forest, room number 0", false, false, 1, false)
room1 = Room.new("You are in a castle, room number 1", false, 2, 7, false)
room2 = Room.new("You are in a cave, room number 2", false, 3, false, false)
room3 = Room.new("You are in a mountain, room number 3",false, false, 4, false)
room4 = Room.new("You are in Mars, room number 4", false, false, 5, false)
room5 = Room.new("You are in Saturn, room number 5", false, 6, false, false)
room6 = Room.new("You are in the last room!, room number 6", false, 10, false, false)
room7 = Room.new("You are in Philadelphia, room number 7", false, false, 8, false)
room8 = Room.new("You are in Madrid, room number 8", false, 9, false, false)
room9 = Room.new("You are in Barcelona, room number 9", false, 5, false, false)

rooms = [room0, room1, room2, room3, room4, room5, room6, room7,  room8, room9]
maze1 = Maze.new rooms

# maze1.print_maze

player1 = Player.new
game1 = Game.new maze1, player1
game1.start_game






