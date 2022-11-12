> [Слайды](https://github.com/lerarybak/ruby-makes-you-happy)

# Ruby

* динамический
* строготипизированный
* мультипарадигменный
* кроссплатформенный


# [Семантика](src/01_semantic.rb)

* все данные - объекты (нет примитивных типов)
* каждая функция/оператор - метод

```ruby
1 + 1 #=> 2
1.class #=> Fixnum
```

``` ruby
3.times do
  puts 'Hello!'
end
```

```ruby
puts 1.+(1) #=> 2
puts 3.div(2) #=> 2
```


# [Открытые классы (open classes)](src/02_open_classes.rb)

```ruby
class Fixnum
  def +(value)
    self - value
  end
end
puts 10 + 1 #=> 9
```

```ruby
class Student
  def initialize(name)
    @name = name
  end
end

student_1 = Student.new('John')
student_2 = Student.new('Alex')


student_2.group #=> NoMethodError: undefined method `group' for #<Student @name="Alex">`
def student_2.group
  '0001'
end
student_2.group #=> '0001'


Student.class_eval do
  def university
    'BSUIR'
  end
end
student_1.university #=> 'BSUIR'
student_2.university #=> 'BSUIR'
```


# [Миксины (mixins)](src/03_mixins.rb)

```ruby
class SportCar
end

car = SportCar.new
car.speed #=> NoMethodError: undefined method `speed' for #<SportCar>`


module SportEngine
  def speed
    320
  end
end

class SportCar
  include SportEngine
end

car.speed #=> 320


module Engine
  def speed
    140
  end
end

class Car
  extend Engine
end

Car.speed #=> 140
car.speed #=> 320
```


# [Интроспекция (type introspection)](src/04_introspection.rb)

**Интроспекция** - возможность определить тип и структуру объекта во время исполнения.

```ruby
module A
  def test
  end
end
A.instance_methods #=> [:test]
```

```ruby
module C
end

module A
  class B
    include C
  end
end

A::B.ancestors #=> [A::B, C, Object, Kernel, BasicObject]
A::B.included_modules #=> [C, Kernel]
```

```ruby
class B
  def public_method
  end

  protected

  def protected_method
  end

  private

  def private_method
  end
end

B.instance_methods #=> [:public_method, :protected_method, :private_method, ...]
B.public_instance_methods #=> [:public_method, ...]
B.protected_instance_methods #=> [:protected_method]
B.private_instance_methods #=> [:private_method, ...]

object = B.new
object.class #=> B
object.instance_of?(B) #=> true

object.methods #=> [:public_method, :protected_method, :private_method, ...]
object.public_methods #=> [:public_method, ...]
object.protected_methods #=> [:protected_method]
object.private_methods #=> [:private_method, ...]
```

```ruby
class X
end

class Z < X
end

Z.superclass #=> X
```


# [Рефлексия (reflection)](src/05_reflection.rb)

**Рефлексия** - процесс, во время которого программа может отслеживать и модифицировать собственную структуру и
поведение во время исполнения.

```ruby
class A
  def test
    puts 'test'
  end
end

A.new.test #=> 'test'
Object.const_get('A').send('new').send('test') #=> 'test'
```


# [Meтапрограммирование](src/06_metaprogramming.rb)

**Meтапрограммирование** - программы, которые изменяют себя во время исполнения или пораждают другие программы как
результат своей работы.

```ruby
class Payment
  STATUSES = ['pending', 'processed', 'cancelled']

  attr_reader :status

  def initialize(status)
    @status = status
  end

  STATUSES.each do |payment_status|
    define_method "#{payment_status}?" do
      payment_status == status
    end
  end
end

payment = Payment.new('pending')
payment.processed? #=> false
payment.pending? #=> true
```


# [Функциональное программирование](src/07_functional_programming.rb)

* Функции высших порядков (higher-order functions)
* Замыкания (closures)
* Каррирование (carrying)
* Ленивые вычисления (lazy-evaluation)
* Неизменяемые объекты

```ruby
increment = ->(x) { x + 1 }
increment.call(1) #=> 2
[1, 2, 3].map(&increment) #=> [2, 3, 4]
```
