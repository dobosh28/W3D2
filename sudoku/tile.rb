
class Tile
    attr_reader :value
    def initialize(value) 
        @value = value
    end

    def set_value(new_value)
        if @value == 0
            @value = new_value
            return false
        end
    end
end