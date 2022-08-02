require "./board.rb"
require "./card.rb"

class Game
    def initialize
        @board = Board.new
        @num_guessed_pos = 0
    end

    def print_board(grid)
        grid.each {|sub| puts sub.join(" ") }
    end

    def play
        @board.populate

        while @board.get_num_guessed_pos < 16
            self.print_board(@board.render)

            puts "please enter the position"
            user_input = gets.chomp.split("")
            user_input.map! { |ele| ele.to_i }
            first_guessed = @board.reveal(user_input)

            self.print_board(@board.render)

            puts "please enter second position"
            user_input_2 = gets.chomp.split("")
            user_input_2.map! { |ele| ele.to_i }
            second_guessed = @board.reveal(user_input_2)

            self.print_board(@board.render)

            if first_guessed != second_guessed
                first_guessed.hide 
                second_guessed.hide
                puts "no match! please try again"
            else
                puts "good. you matched two position."
            end
        end
        puts "you win!"
    end
end 