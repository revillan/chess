require_relative 'sliding_piece'

class Queen < Piece
  include Slideable

  def move_dirs
    {:diagonal => true, :horizontal => true}
  end

  def symbol
    "Q" # ♗
  end

end
