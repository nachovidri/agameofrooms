class Maze

	attr_accessor :list_of_rooms

	def initialize rooms
		@list_of_rooms = rooms
	end

	def print_maze
		@list_of_rooms.each do |room|
			puts "#{room.room_description} which exit is #{room.room_exit}"
		end
	end
end


class Room
	
	attr_accessor :room_description, :room_exit

	def initialize des, exit
		@room_description = des
		@room_exit = exit
	end
end

class Game

	def initialize maze, player
		@maze = maze
		@position = 0
		@end_game = true
		@player = player
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
		puts @maze.list_of_rooms[@position].room_description
		puts "Please enter where would you like to head"
		@user_input = gets.chomp
	end

	def evaluate_turn
		if (@user_input == @maze.list_of_rooms[@position].room_exit)
			@position = @position + 1
			puts "Congrats, you have advanced to room #{@position}"
		else
			puts "Try again. You still in room #{@position}"
			@player.substract_life
		end
	end

	def end_game
		if @position == 4
			@end_game = false
		else
			@end_game
		end
	end
end

class Player

	def initialize 
		@lifes = 2
		@player_alive = true
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

room1 = Room.new("You are in a forest","S")
room2 = Room.new("You are in a castle","E")
room3 = Room.new("You are in a cave","E")
room4 = Room.new("You are in a mountain","S")
room5 = Room.new("You are in Mars","S")

rooms = [room1, room2, room3, room4, room5]
maze1 = Maze.new rooms

# maze1.print_maze

player1 = Player.new
game1 = Game.new maze1, player1
game1.start_game






