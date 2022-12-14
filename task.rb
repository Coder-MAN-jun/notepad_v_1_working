# encoding: utf-8
# 
# Подключим встроенный в руби класс Date для работы с датами
require 'date'

# Класс <<Задача>>, Разновидность базового класса <<Запись>>
class Task < Post
  # Конструктор у класса <<Задача>> свой, но использует конструктор родителя.
  def inititlize
    # Вызываем конструктор родителя
  	super
  	
    # Создаём специфичную для ссылки переменную экземпляра @due_date - время,
    # которому задачу нужно выполнить
    @due_date = Time.now
  end

  # Напишем реализацию метода read_frome_console для экземпляра задачи. Он
  # спрашивает у поьзователя текст задачи (что нужно сделать) и дату, до
  # которой нужно успеть это сделать.
  def  read_from_console
    # Спросим у пользователя, что нужно сделать и запишем его ответ (строку)
    # в переменную экземпляра класса <<Задача>> @text.
  	puts "Что надо сделать?"
  	@text = STDIN.gets.chomp
    
    # Спросим у пользователя, до какаго числа ему нужно выполнить задачу и 
    # подскажем формат, в котором нужно вводить дату. А потом запишем его ответ
    # локальную переменную input.
  	puts 'К какому числу? укажите дату в формате дд.мм.гггг,например 12.03.2003'
  	input = STDIN.gets.chomp
    
    # Для того, чтобы из строки получить объект класса Date, с которым очень
    # удобно работать (например, можно вычислить, сколько осталось дней до 
    # нужной даты), мы получим этот объект из строки с помощью метода класса
    # Date (статического метода)
  	@due_date = Date.parse(input)
  end
  
  # Метод to_stirng должен вернуть все строки, которые мы хотим записать в
  # файл при записи нашей задачи: строку с дедлайном, описание задачи и дату
  # создания задачи.
  def to_strings
    deadline = "Крайний срок: #{@due_date.strftime('%Y.%m.%d')}"
  	time_string = "#{@created_at.strftime("%Y.%m.%d, %H-%M-%S")} \n"

    [deadline, @text, time_string]
  end
end
