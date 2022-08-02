# Hello

class Card

    attr_reader :value
    attr_accessor :face_up

    def initialize(value)
        @value = value
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def hide
        @face_up = false
    end

    def == (other_card)
        if @value == other_card.value
            return true
        else
            return false
        end
    end

end