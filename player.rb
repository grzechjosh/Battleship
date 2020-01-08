class Player
    def get_move
        puts "enter a position with coordinates seperated with a space like `4 7`"
        position = gets.chomp
        posArray = position.split(" ")
        return posArray.map {|ele| ele.to_i}
    end
end
