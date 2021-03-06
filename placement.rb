class Placement
  FACE = { NORTH: 'NORTH', SOUTH: 'SOUTH', EAST: 'EAST', WEST: 'WEST' }.freeze

  TURN_RULES = {
    FACE[:EAST] => FACE[:NORTH],
    FACE[:NORTH] => FACE[:WEST],
    FACE[:WEST] => FACE[:SOUTH],
    FACE[:SOUTH] => FACE[:EAST]
  }.freeze

  DIMENSION = 5

  attr_reader :x, :y, :face

  def initialize(x:, y:, face:)
    raise InvalidPlacement unless correct_face?(face) && correct_xy?(x, y)
    @x, @y, @face = x, y, face
  end

  def ==(other_placement)
    x == other_placement.x && y == other_placement.y && face == other_placement.face
  end

  def print
    "#{x},#{y},#{face}"
  end

  def valid?
    correct_face?(face) && correct_xy?(x, y)
  end

  def self.turn(side:, face:)
    if side == :left
      TURN_RULES[face]
    elsif side == :right
      TURN_RULES.key(face)
    end
  end

  private

  def correct_face?(face)
    FACE.values.include? face
  end

  def correct_xy?(x, y)
    x >= 0 && x < DIMENSION &&
      y >=0 && y < DIMENSION
  end
end

class InvalidPlacement < StandardError
  def message
    'Incorrect input'
  end
end
