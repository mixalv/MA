class BricksFactory
  NUMBER_OF_BRICKS = 10
  COLORS = %i[:red :green :blue :white :brown]
  def initialize
    @unbroken_bricks = []
  end

  # creates a given number of bricks
  def create_bricks(number)
    number.times do 
      created_brick = Brick.new(choose_color, generate_serial_number, choose_state)
      unbroken_bricks << created_brick if created_brick.unbroken?
    end
    unbroken_bricks
  end

  # returns the total number of unbroken bricks for all time
  def total_number_of_unbroken_bricks
    unbroken_bricks.size
  end

  # returns a sorted array of unbroken bricks (sorting by color)
  def bricks_sorted_by_color
    unbroken_bricks.sort
  end

  # returns the last 10 created unbroken bricks of the requested color.
  def last_ten_bricks_with_color(color)
    result = bricks_sorted_by_color.select { |elem| elem.color == color}
    result.last(NUMBER_OF_BRICKS)
  end

  private

  attr_accessor :unbroken_bricks

  def generate_serial_number
    total_number_of_unbroken_bricks + 1
  end

  def choose_state(weight = 80)
    rand <= weight/100.0 ? :unbroken : :broken
  end

  def choose_color
    COLORS.sample
  end

end

class Brick
  include Comparable
  attr_reader :color, :serial_number, :state

  def initialize(color, serial_number, state)
    @color = color
    @serial_number = serial_number
    @state = state
  end

  def unbroken?
    state == :unbroken
  end

  # logic where each brick will know which field it should be sorted by
  def <=>(other)
    color <=> other.color
  end

end
