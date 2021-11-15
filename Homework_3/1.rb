class User
  
  attr_accessor :first_name, :last_name, :email
  
  def initialize(**kwargs)
    @first_name = kwargs[:first_name]
    @last_name = kwargs[:last_name]
    @email = kwargs[:email]
  end
  
  def full_name
    "#{@first_name} #{@last_name}"
  end
  
  def is_valid_email?
    @email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i ? true : false
  end
  
  def errors
    errors_array = []
    errors_array.push('email is invalid') if !is_valid_email?
    errors_array.push('email must be a string') if !@email.is_a? String
    errors_array.push('email can not be empty') if @email.nil? || @email.to_s.empty?
    errors_array.push('first name can not be empty') if @first_name.nil? || @first_name.to_s.empty?
    errors_array.push('fist name must be a string') if !@first_name.is_a? String
    errors_array.push('first_name must be at least three characters') if first_name.to_s.length < 3
    errors_array.push('last name can not be empty') if @last_name.nil? || @first_name.to_s.empty?
    errors_array.push('last name must be a string') if !@last_name.is_a? String
    errors_array.push('last name must be at least three characters') if @last_name.to_s.length < 3
    errors_array
  end
  
  def valid?
    errors.count > 0 ? false : true
  end

end
