class User
  
  attr_accessor :first_name, :last_name, :email
  
  def initialize(**kwargs)
    @first_name = kwargs[:first_name]
    @last_name = kwargs[:last_name]
    @email = kwargs[:email]
    @errors = []
  end
  
  def full_name
    "#{@first_name} #{@last_name}"
  end
  
  def is_valid_email?
    @email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i ? true : false
  end
  
  def errors
    @errors.clear
    add_first_name_errors
    add_last_name_errors
    add_email_errors
    @errors
  end
  
  def valid?
    errors.empty? ? true : false
  end

  private

  def empty_field?(field)
    field.nil? || field.to_s.empty? ? true : false 
  end

  def not_string?(field)
    field.is_a?(String) ? false : true
  end

  def less_than_3_char?(field)
    field.to_s.length < 3 ? true : false
  end 

  def add_first_name_errors
    @errors.push('first name can not be empty') if empty_field?(@first_name)
    @errors.push('fist name must be a string') if not_string?(@first_name)
    @errors.push('first_name must be at least three characters') if less_than_3_char?(@first_name)
  end

  def add_last_name_errors
    @errors.push('last name can not be empty') if empty_field?(@last_name)
    @errors.push('last name must be a string') if not_string?(@last_name)
    @errors.push('last name must be at least three characters') if less_than_3_char?(@last_name)
  end

  def add_email_errors
    @errors.push('email is invalid') if !is_valid_email?
    @errors.push('email must be a string') if not_string?(@email)
    @errors.push('email can not be empty') if less_than_3_char?(@email)
  end

end
