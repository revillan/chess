require_relative 'piece'

module Slideable

  def moves
     moves = []
     moves += horizontal_dirs if move_dirs[:horizontal]
     moves += diagonal_dirs if move_dirs[:diagonal]
     possible_moves = []
     moves.each do |move|
       possible_moves.concat(grow_unblocked_moves_dir(move[0], move[1]))
     end
     possible_moves
  end

  private

  def horizontal_dirs
    [ [0,1], [0,-1], [-1,0], [1,0] ]
  end

  def diagonal_dirs
    [[1,1], [1,-1], [-1,-1], [-1,1]]
  end

  def grow_unblocked_moves_dir(dx, dy)
    moves_dir =[]
    i, j = dx, dy
    k = 2
    next_pos = [@pos[0]+dx, @pos[1]+dy]
    while @board.in_bounds?(next_pos) && @board[next_pos].color != self.color

      moves_dir << next_pos
      break if @board[next_pos].color != nil
      dx = i * k
      dy = j * k
      k += 1
      next_pos = [@pos[0]+dx, @pos[1]+dy]
    end
    moves_dir
  end

  def valid_pos(pos)
    return false unless @board.in_bounds?(pos)
    true
  end


  def move_dirs
  end



end
