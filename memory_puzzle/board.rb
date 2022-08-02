require "./card.rb"

class Board

    CARD_PAIRS = ("A".."Z").to_a

    def initialize
        @grid = Array.new(4) {Array.new(4) { "_" }}
    end

    def populate
        shuffled_pairs = CARD_PAIRS.sample(8) * 2

        @grid.each_with_index do |sub, idx|
            sub.each_with_index do |ele, idx_ele|
                selected = shuffled_pairs.sample
                @grid[idx][idx_ele] = selected
                shuffled_pairs.delete_at(shuffled_pairs.index(selected))
            end
        end

        @grid.each_with_index do |sub, idx1|
            sub.each_with_index do |ele, idx2|
                @grid[idx1][idx2] = Card.new(ele)
            end
        end
    end

    def render
        board_current_state = Array.new(4) {Array.new(4)}
        @grid.each_with_index do |sub, idx1|
            @grid.each_with_index do |ele, idx2|
                if ele.face_up 
                    board_current_state[idx1][idx2] = ele.value
                else
                    board_current_state[idx1][idx2] = " " 
                end
            end
        end
        return board_current_state
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, val)
        row, col = position
        @grid[row][col] = val
    end

    def won?
        @grid.flatten.all? {|card| card.face_up }
    end

    def reveal(guessed_pos)
        row, col = guess_pos
        card = @grid[row][col]
        
        if !card.face_up
            card.reveal
        end

        return card
    end

    def get_num_guessed_pos
        @grid.flatten.count { |card| card.face_up == true }
    end
end 