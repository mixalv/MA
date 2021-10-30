# 1
# Написати скрипт в який, використовуючи метод gets, потрібно передати з консолі назву тварини.
# Після цього, вивести в консоль наступний текст I like _animal_, де замість _animal_ повинно бути значення отримане з консолі
print 'Enter the animal: '
animal = gets.chomp 
puts "I like #{animal}"

# 2
# Написати скрипт в який, використовуючи метод gets, потрібно передати з консолі ваш вік.
# Після цього, вивести в консоль, через скількі років вам буде 100 (Текст можете придумати самі)
print 'Enter your age: '
age = gets.chomp.to_i
puts "You'll be 100 in #{100 - age} years"

# 3
# Написати скрипт в який, використовуючи метод gets, потрібно передати з консолі список з трьох хоббі та записати їх в змінну
# Приклад вводу: 
# 'football, programming, hiking'
# Після цього, потрібно обрати випадкове хоббі та вивести в консоль наступний текст Tell me something about _random_hobby_
# де замість _random_hobby_ повинно бути випадкове хоббі
print 'Enter your hobbies: '
random_hobby = gets.chomp.split(',').sample
puts "Tell me something about #{random_hobby}"




# 4*
# Дано дві змінні:
# variable_1 = 1
# variable_2 = 2
# Потрібно щоб змінні variable_1 та variable_2 обмінялися своїми значеннями без використання третьої змінної
variable_1 = 1
variable_2 = 2
variable_1, variable_2 = variable_2, variable_1
# 5**
# Написати скрипт який порахує кількість ключив хеша з назвою key без урахування його типу та реєстру, та виведе цю інформацію в консоль
hash = {
  1    => 2,
  nil  => 3,
 'kEy' => :value_1,
 :key  => :value_2,
  Key:    :value_3
}
counter = 0
hash.each do |k, v|
    counter += 1 if k.to_s.downcase == 'key'        
end
p counter

