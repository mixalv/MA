#Task 3**
#
# You need to create a module with your own implementation of attr_accessor (without using "super" keyword).
# Your own accessor should output "this field is empty" if the requested field has no value.
# Create any class that will have multiple fields (4-6),
# and make that class use the overridden attr_accessor method that was previously described in your module.

module CustomAccessor
  
  def attr_accessor(*args)
    args.each do |arg|
      self.class_eval %{      
        def #{arg}
          if @#{arg}.nil?
            raise 'this field is empty'
          else 
            @#{arg}
          end
        end

        def #{arg}=(value)
          if value.nil? | value.empty?
            puts 'this field is empty'
          else
            @#{arg} = value
          end
        end
      }
    end
  end
end

class AnyClass
  extend CustomAccessor
  attr_accessor :field1, :field2, :field3, :field4
  def initialize(field1, field2, field3, field4)
    @field1 = field1
    @field2 = field2
    @field3 = field3
    @field4 = field4
  end
end