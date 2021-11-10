# Task #1
# Створити програму, яка буде отримувати від користувача назву тварини.
# В залежності від введеної тварини, виводити в консоль звук, який ця тварина видає.
# Вивід має бути у такому форматі - "Назва_тварини говорить - звук_тварини". Назва тварини має починатись з великої літери.
# Якщо була введена назва тварини, яка не покривається програмою (або щось ліве), то вивести в консоль відповідне повідомлення.
# Програма має покривати 4-5 назв тварин, в незалежності від регістру введених назв.
#
# Приклад взаємодії користувача з цією програмою:    |   Приклад взаємодії користувача з цією програмою:
# Введіть назву тварини:                             |   Введіть назву тварини:
# супер_вЕдміДь                                      |   сУпер_веДмідь
# Супер_ведмідь говорить - ведмежачий звук           |   Супер_ведмідь говорить - ведмежачий звук

sound = {
    cat: 'meow',
    dog: 'woof',
    cow: 'moo',
    duck: 'quack'
}
puts 'Enter animal name:'
animal_name = gets.chomp.downcase.to_sym
puts sound[animal_name].nil? ? "Sorry, the animal doesn't exist" : "#{animal_name.capitalize} says - #{sound[animal_name]}"
