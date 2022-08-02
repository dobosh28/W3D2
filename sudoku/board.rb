require "./tile.rb"

class Board

    def self.from_file(file_name)
        content = File.read(file_name).split("\n")
        row = content.length
        grid = Array.new(row) {Array.new(row)}

        content.each_with_index do |sub_arr, idx1|
            sub_arr.each_char.with_index do |char, idx2|
                grid[idx1][idx2] = Tile.new(char.to_i)
            end
        end

        return grid
    end

    def initialize
        @grid = Board.from_file("sudoku1.txt")
    end

    def render
        new_grid = @grid.dup

        @grid.each_with_index do |sub_arr, idx1|
            sub_arr.each_with_index do |ele, idx2|
                new_grid[idx1][idx2] = ele.value
            end
        end
        new_grid.each {|sub_arr| puts sub_arr.join(" ") }
    end

    def change_value(pos, val)
        row, col = pos
        @grid[row][col] = val
    end
end