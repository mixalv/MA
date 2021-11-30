#Task 2
#
# In addition to the previous assignment,
# create a module that describes a method with the ability to sort the array by any requested field.
# If the iterated element of the array does not contain the requested field, then:
# - display an appropriate message on the console.
# - place this element in a special array of failed elements.
# - remove this element from the array that we are currently sorting.
# The method should output an array of failed elements to the console and return only the sorted array.
#
# Name of this method should be different from the sort method of the BricksFactory class.
# Override the sort method that was written for BricksFactory. (You can use the keyword "alias" in this task.)

module Sorting
  def sort_by_field(array, field)
    failed_elements = array.map do |element|
      if !element.respond_to?(field)
        puts 'The element doesn\'t have the requested field' 
        element 
      end     
    end
    array -= failed_elements
    p failed_elements.compact!
    array.sort_by { |element| element.send(field) } unless array.empty?
  end
  alias sort_bricks_by_field sort_by_field
end

class BricksFactory

  prepend Sorting
  def initialize
    @unbroken_bricks = []
  end

  # creates a given number of bricks
  def create_bricks(number)
    number.times do 
      created_brick = Brick.new(choose_color, generate_serial_number, choose_state)
      unbroken_bricks << created_brick if created_brick.state == :unbroken
    end
  end

  # returns the total number of unbroken bricks for all time
  def total_number_of_unbroken_bricks
    unbroken_bricks.count
  end

  # returns a sorted array of unbroken bricks (sorting by color)
  def bricks_sorted_by_color
    sort_bricks_by_field(unbroken_bricks, :color)
  end

  # returns the last 10 created unbroken bricks of the requested color.
  def last_ten_bricks_with_color(number = 10, color)
    result = bricks_sorted_by_color.find_all { |elem| elem.color == color}
    result.count >= number ? result.last(number) : "There is no #{number} blocks of such color"
  end

  private

  attr_accessor :unbroken_bricks

  def sort_bricks_by_field(array, field)
    array.sort_by { |element| element.send(field) }
  end
  
  def generate_serial_number
    total_number_of_unbroken_bricks + 1
  end

  def choose_state(weight = 80)
    rand <= weight/100.0 ? :unbroken : :broken
  end

  def choose_color
    colors = [:red, :green, :blue, :white, :brown]
    colors.sample
  end

end

class Brick

  include Comparable
  attr_accessor :color, :serial_number, :state

  def initialize(color, serial_number, state)
    @color = color
    @serial_number = serial_number
    @state = state
  end

end


