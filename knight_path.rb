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

	def self.find (x, y)
		ind = x + y *8
		return @@Q[ind]
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
s = Node.find(7,4)
puts s.xcoord, s.ycoord