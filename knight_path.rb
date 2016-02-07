class Node
	attr_accessor :dist, :prev, :xcoord, :ycoord, :Q, :V
	@@Q = [] # unvisited
	@@V = [] # next queue
	def initialize(xcoord, ycoord)
		@xcoord = xcoord
		@ycoord = ycoord
		@prev = 0 #unidentified
		@dist = 1000000 #infinity
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

	def show_path
		if self.prev == 0
			print self.coord
			puts ""
		else
			self.prev.show_path
			print self.coord
			puts ""
		end
	end

	def find_neighbors
		arr = []
		x = @xcoord
		y = @ycoord
		moves = [[x+2,y+1], [x+2, y-1], [x-2,y+1], [x-2,y-1], [x+1, y+2], [x+1, y-2], [x-1, y+2], [x-1, y-2]]
		moves.delete_if{|x| !((0..7).include?(x[0])) || !((0..7).include?(x[1])) }
		moves.each {|x| (arr << Node.find(x)) if @@Q.include?(Node.find(x))}
		return arr
	end

	def check(arr)
		@@Q.delete(self)
		@@V.delete(self)
		arr.each {|x|
			if x.dist > self.dist + 1
				x.dist = self.dist + 1
				x.prev = self
				@@V << x
			end
		}
	end

	def shortest_path(target)
		self.dist = 0
		@@V[0] = self
		while @@Q.include?(target)
			arr = @@V[0].find_neighbors
			@@V[0].check(arr)
		end
	
		puts "made it in #{target.dist} moves"
		target.show_path
		
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
t = Node.find([0,2])

s.shortest_path(t)