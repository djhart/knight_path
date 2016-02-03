#look at dijkstras and A* == goood palces to start

class Node
	attr_accessor :dist, :prev, :xcoord, :ycoord, :Q
	@@Q = []

	def initialize(xcoord, ycoord)
		@xcoord = xcoord
		@ycoord = ycoord
		@prev = "U" #unidentified
		@dist = "I" #infinity
		@@Q << self
	end

	def self.queue
		return @@Q
	end

	def coord
		[@xcoord, @ycoord]
	end

	def self.find (arr)
		x = arr[0]
		y = arr[1]
		ind = x + y *8
		return @@Q[ind]
	end

	def find_neighbors
		arr = []
		x = @xcoord
		y = @ycoord
		moves = [[x+2,y+1], [x+2, y-1], [x-2,y+1], [x-2,y-1], [x+1, y+2], [x+1, y-2], [x-1, y+2], [x-1, y-2]]
		moves.delete_if{|x| !((0..7).include?(x[0])) || !((0..7).include?(x[1])) }
		moves.each {|x| arr << Node.find(x)}
		return arr
	end


end

def build_board 
	j = 0
	8.times do 
		i = 0
		8.times do 
			Node.new(i, j)
			i += 1
		end
		j += 1
	end
end

build_board
q =  Node.queue
s = Node.find([7,4])

arr = s.find_neighbors
puts arr.length