#look at dijkstras and A* == goood palces to start

class Node
	attr_accessor :dist, :prev, :xcoord, :ycoord, :Q, :V
	@@Q = [] # unvisited
	@@V = [] # next queue
	def initialize(xcoord, ycoord)
		@xcoord = xcoord
		@ycoord = ycoord
		@prev = [] #unidentified
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
		#print self.coord
		#puts arr
		self.prev << self.coord
		@@Q.delete(self)
		@@V.delete(self)
		arr.each {|x|
			if x.dist > self.dist + 1
				x.dist = self.dist + 1
				x.prev = self.prev
				@@V << x
			end
		}
	end

	def shortest_path(target)
		self.dist = 0
		@@V[0] = self
		while @@Q.include?(target)
			#print @@V[0].coord
			arr = @@V[0].find_neighbors
			@@V[0].check(arr)
		end
	
		puts "made it in #{target.dist} moves"
		target.prev << target.coord
		#target.prev.each {|x|
			#print x 
			#puts ""
		#}
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
t = Node.find([6,6])

s.shortest_path(t)