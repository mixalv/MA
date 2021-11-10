# Task #4**
# Вам дано умовну реалізацю аналогу методу .map, написаної виключно для масиву, на який зараз посилається змінна arr.
# Задачами є:
# - розібратись з тим чому і як цей кусок коду працює.
# - знайти відмінності між поведінкою звичайного .map
# - при бажанні виписати в якийсь коментар під кодом знайдені відмінності.
# - спробувати запустити цей метод без передачі блоку (ось ця конструкція { || })
# - змінити реалізацію цього методу так, щоб у випадку, коли блок не був переданий в цей метод, замість
# стандартного еррору виводити в консоль - "будьласка додайте блок".
# - змінити цей метод, так, щоб результат кожної ітераці перемножався на 2, якщо цим результатом є інтеджер.
=begin
=======Original method
def arr.my_own_map
  collection_counter = 0
  result = []
  until collection_counter == size
    result << yield(self[collection_counter])
    collection_counter += 1
  end
  result
end    
=end
arr = %w[a b c d] #це "рубішна" скорочена форма запису ось цього - ['a', 'b', 'c', 'd']

def arr.my_own_map
  collection_counter = 0
  result = []
  if block_given?
    until collection_counter == size
        element = yield(self[collection_counter])
        if element.is_a? Integer
            result << element * 2    
        else
            result << element
        end        
        collection_counter += 1
    end
    result
  else
    puts 'Будь ласка додайте блок.'
  end  
end