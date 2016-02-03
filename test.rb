x = 1
y = 0
moves = [[x+2, y+1], [x+2, y-1], [x-2, y+1], [x-2, y-1], [x+1, y+2], [x+1, y-2], [x-1, y+2], [x-1, y-2]]
#moves.each {|x| puts x}
moves.delete_if {|x| x[0] == 0 || x[1] == 1}
moves.each {|x| print x
puts ""
}