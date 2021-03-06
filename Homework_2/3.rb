# Task #3*
# Реалізувати програму, яка надасть юзеру можливість ввести перелік своїх улюблених та найненавистніших міст (міста - англійською мовою).
# Ввід улюблених та найненавистніших міст має бути реалізований через два різні вводи.
# Міста вводяться через кому, потрібно обробляти випадки, коли між комами та самими назвами міст наявна певна кількість пробілів.
# На виході програма має повертати відсортований за назвою (алфавітом) перелік цих міст, також записаний через кому.
# Спочатку іде відсортований список улюблених міст, а потім через кому цей список має продовжуватись відсортованим списком найненавистніших міст.
#
# Приклад взаємодії користувача з цією програмою:
# Введіть улюблені міста:
# Cherkassy,  Toronto,    Tokyo, Lviv  , Paris
# Введіть найненавистніші Вами міста:
# Texas, New York,Indiana
# Результат виконання:
# Cherkassy, Lviv, Paris, Tokyo, Toronto, New York, Texas, Indiana

puts 'Введіть улюблені міста:'
fav_towns = gets.chomp.split(',').map { |i| i.strip.gsub(/\S+/, &:capitalize) }.sort
puts 'Введіть найненавистніші Вами міста:'
hate_towns = gets.chomp.split(',').map { |i| i.strip.gsub(/\S+/, &:capitalize) }.sort
puts 'Результат виконання:'
puts fav_towns.concat(hate_towns).join(', ')