# Task #2
# Написати програму, яка буде пропонувати користувачу ввести певне число.
# У відповідь на введене число, програма має виводити в консоль задане число помножене на 256 та пропонувати ввести ще одне число.
# Наведена вище логіка має повторюватись безліч кількість разів.
# У випадку, якщо програма отримала число, яке містить у своєму записі більше ніж одну одиницю (1),
# потрібно вивести користувачу якесь довільне повідомлення про завершення виконання цієї програми та зупинити програму.
#
# Приклад взаємодії користувача з цією програмою:
# Введіть число:
# 1
# Результат виконання: 256
# Введіть число:
# 171
# Умови недотримані, зупиняю виконання програми.

loop do
    puts 'Введіть число:'
    num = gets.chomp.to_i
    unless num.abs.digits.count(1) > 1
        p num * 256
    else
        puts 'Умови недотримані, зупиняю виконання програми.'
        break        
    end
end