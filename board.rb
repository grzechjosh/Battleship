require "byebug"
class Board
    attr_reader :grid
    def initialize(n)
        @grid = Array.new(n) {Array.new(n)}
        @grid.each do |row|
            row.each_with_index do |ele, idx|
                row[idx] = :N
            end
        end
        @size = n * n
    end
    def size
        @size
    end
    def [](pos)
        row, col = pos
        grid[row][col]
    end
    def []=(pos, val)
        row, col = pos
        grid[row][col] = val
    end
    def num_ships
        count = 0
        @grid.each do |row|
            row.each do |ele|
               if ele == :S
                count += 1
               end
            end 
        end
        return count
    end
    def attack(attackPos)
        if self[attackPos] == :S
            self[attackPos] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[attackPos] = :X
            return false
        end
    end
    def place_random_ships
        quarter = @size / 4
        while self.num_ships < quarter
            rand_row = rand(0...@grid.length)
            rand_col = rand(0...@grid.length)
            self[[rand_row, rand_col]] = :S
         end
    end
    def hidden_ships_grid
        @grid.map do |row|
            row.map.with_index do |ele, idx|
                if ele == :S 
                    :N
                else
                    ele
                end
            end
        end     
    end 
    def self.print_grid(grid)
        grid.each do |sub|
            puts sub.join(" ")
        end
    end
    def cheat
        Board.print_grid(@grid)
    end    
    def print
        newGrid = self.hidden_ships_grid
        Board.print_grid(newGrid)  
    end
          
end



