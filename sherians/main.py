#a="SHER CODER"
#print(a[6:8:1])
#a=5
#b=2
#print(a+b)
#print(a-b)
#print(a*b)
#print(a/b)
#print(a//b)
#print(a%b)
#print(a**b)
 
#a = str(input("Enter the mam name:"))
#print(f"Good morning {a}")

"""a = input("Enter ur name:")
b = int(input("Enter ur age:"))

if b >=18:
    print(f"{a} valid for vote")
else:
    print("you are eligible to  vote  only if youu are 18 or +18")"""

"""year = int(input("Enter a year:"))

if year %100 == 0 and year %400 == 0:
    print("its a leap year")
elif year %100 != 0 and year %4 == 0:
    print("its a leap year")
else:
    print("its a normal year")"""


"""n = int(input("which table u want:"))

for i in range(n,n*10+1,n):
    print(i)"""

"""fruits = ["apple,banana,mango"]

for i in range(len(fruits)):
    print(fruits[i])"""

"""num = 5
for i in range(1,11):
    print(num,"x",i,"=",num*i)"""

"""a = "Sherian coders"

for i in range(len(a)):
    print(a[i])"""

"""a = "Nature"
for char in a:
    print(char)"""

"""for i in range(1,11):
    if i == 8:
        break
    else:
        print(i)"""

"""a = int(input("enter your number:"))

for i in range(a):
    print("helloworld")"""


"""for i in range(10,0,-1):
    print(i)"""

"""n = int(input("enter number:"))

for i in range(n,n*10+1,n):
    print(i)"""

"""n = int(input("Enter number:"))
sum = 0
for i in range(1,n+1):
    sum = sum + i
print(f"your sum is {sum}")"""

"""n = int(input("Enter number:"))
fact = 1
for i in range(1,n+1):
    fact = fact * i
    print(f"your factorial is {fact}")"""

"""n = int(input("Enter number:"))
even = 0 
odd = 0
for i in range(1,n+1):
    if i % 2 == 0:
        even = even + i
    else:
        odd = odd + i
print(f"your sum of even and odd are {even},{odd}")"""

"""n = int(input("Enter number:"))
count = 0
for i in range(1,n+1):
    if n%i == 0:
        count = count + 1
if count == 2:
    print("prime number")
else:
    print("not a prime number")"""

"""a = "Sher"
b = ""
for i in range(len(a)-1,-1,-1):
    b = b + a[i]
print(b)
if a == b:
    print("palindrome")
else:
    print("not")"""

"""a = "s786z@&*^55%"

char = 0
dig = 0
splchr  = 0

for i in a:
    if i.isdigit():
        dig+=1
    elif i.isalpha():
        char+=1
    else:
        splchr+=1
print(f"your digits are {dig}\nyour alphabets are  {char}\nyour special characers are {splchr}")"""

"""a = int(input("Enter number:"))
rev = 0
while a > 0:
    rev = rev * 10 + a % 10
    a = a // 10
print(rev)"""

"""import random
num  = random.randint(1,25)
tries = 0
while True:
    guess = int(input("Enter number u have guessed:"))

    if guess == num:
        print(f"you are right u have guessed in {tries} tries")
        tries +=1
        break
    
    elif num < guess:
        print("go a little lower")
        tries +=1

    elif num > guess:
        print("go a little higher")
        tries +=1

    else:
        tries +=1
        print("sorry you are wrong")"""

"""import random
import string

letter = random.choice(string.ascii_lowercase)
tries = 0

while True:
    guess = input("Guess the alphabet (a-z): ").lower()
    tries += 1

    if guess == letter:
        print(f"You guessed correctly in {tries} tries")
        break

    elif guess < letter:
        print("Go to a higher alphabet")

    else:
        print("Go to a lower alphabet")"""

"""def pallindrome(st):
        rev = ""
    for i in range(len(st)-1,-1,-1):
        rev = rev + st[i]
    if rev == st:
        print(f"{st} is pallindrome")
    else:
        print(f"{st} is not a pallindrome")

pallindrome("naman")
pallindrome("zero")"""

"""def add(a, b):
    return(a + b)

result = add(5, 3)
print(result)"""

"""l = [10,-20,49,-65,45]
print("positive elements are:")
for i in l:
    if i >= 0:
        print(i)
print("negative elements are:")
for i in l:
    if i < 0:
        print(i)"""

"""l = [23,45,68,90,54,21]
sum = 0
for i in l:
    sum = sum + i
print(sum/len(l))"""

"""l = [13,45,69,98,55,456,786]
largest = l[0]
index = 0
for i in range(len(l)):
    if l[i] > largest:
        largest = l[i]
        index = i
print(largest,index)"""

"""l = [10,34,67,55]
largest = l[0]
sec_largest = l[0]
index = 0
sec_index = 0
for  i in range(len(l)):
    if l[i] > largest:
        sec_largest = largest
        largest = l[i]
        index = i
    elif l[i] > sec_largest:
        sec_largest = l[i]
        sec_index = i
print(f"second largest number is {sec_largest} at index {sec_index}")"""

"""l =  [44,45,54,55]
for i in range(len(l)-1):
    if l[i]  < l[i+1]:
        continue
    else:
        print("not sorted")
        break
else:
    print("sorted list")"""

"""d1 = {10:100,20:200}
d2 = {30:300,40:400}
print (d1 | d2)"""

"""d1 = {10:100,20:200,30:300}
d2 = {40:400,50:500,60:600}

for i in d2:
    d1[i] = d2[i]
print(d1)"""

"""a = int(input("enter number:"))
try:
   print(10/a)

except Exception as err:
    print(f"sorry there is an err as {err}")
print("i have done the diviision")"""

"""a = int(input("enter ur age:"))
try:
    if a < 10 or a > 18:
        raise ValueError("your age must be between 10 and 18")
    else:
        print("welcome to the club")
except Exception as err:
    print(f"sorry exception occured as err {err}")

print("The club will start soon")"""

"""p = open(r'main.py')

print(p.read())"""

"""r = open("superman.txt",'w')
r.write("how are you, i am fine ")
r.close()"""

"""class Factory:
    a= 12
    def hello(self):
        print("hello how are you?")
    print("hello i am getting initialized")

print(Factory().a) #accessing attribute
Factory().hello()  #calling method"""

"""class Factory:
    def __init__(self,material,zips,pockets):
        self.material= material
        self.zips = zips
        self.pockets = pockets

    def show(self):
        print(f"object details are {self.material} , {self.zips} , {self.pockets}")

reebok = Factory("leather",3,2)

campus = Factory("nylon",2,3)

reebok.show()
campus.show()"""

"""class Animal:
    def __init__(self,name):
        self.name = name
    def show(self):
        print(f"hello your name is {self.name}")
class Human(Animal):
    def __init__(self, name, age):
        super().__init__(name)
        self.age = age
    def show(self):
        print(f"hello your name is {self.name} and your age is {self.age}")

animal1 = Animal("lion")
person1 = Human("akarsh",23)

animal1.show()
person1.show()"""

"""class Animal:
    def __init__(self, name):
        self.name = name

class Human(Animal):
    def __init__(self, name, age):
        super().__init__(name)
        self.age = age

# Correct inheritance (only from Human)
class Robots(Human):
    def __init__(self, name, age):
        super().__init__(name, age)

    def show(self):
        print(f"My name is {self.name} and age is {self.age}")

# Create object
robot = Robots("Robo1", 5)
robot.show()"""

"""# Top parent(Diamond problem)
class A:
    def show(self):
        print("A class")

# Inheriting from A
class B(A):
    def show(self):
        print("B class")
        super().show()

class C(A):
    def show(self):
        print("C class")
        super().show()

# Child class inheriting from B and C
class D(B, C):
    def show(self):
        print("D class")
        super().show()

# Create object
obj = D()
obj.show()"""

"""# Parent class 1
class Camera:
    def feature(self):
        print("Camera: Takes photos")

# Parent class 2
class MusicPlayer:
    def feature(self):
        print("MusicPlayer: Plays music")

# Child class
class SmartPhone(Camera, MusicPlayer):
    def feature(self):
        print("SmartPhone: Combines features")
        super().feature()

# Create object
phone = SmartPhone()
phone.feature()"""

"""class Factory:
    def __init__(self, material, zips):
        self.material = material
        self.zips = zips

class Bhopalfactory(Factory):
    def __init__(self, material, zips, color):
        super().__init__(material, zips)
        self.color = color

class Punefactory(Bhopalfactory):
    def __init__(self, material, zips, color, pockets):
        super().__init__(material, zips, color)
        self.pockets = pockets

    def show(self):
        print(f"Bag is made of {self.material}, {self.zips} zips, {self.color} color, {self.pockets} pockets")

obj = Punefactory("leather", 3, "Black", 2)
obj.show()"""

"""#method overiding
class Animal:
    def show(self):
        print("hello i am a human")
class Human(Animal):
    def show(self):
        print("hello I am lion")

obj = Human()
obj.show()"""

"""#method overriding
class Animal:
    def sound(self):
        print("animal  mkes a sound")

class Dog(Animal):
    def sound(self):
        print("Dog barks")
obj = Animal()
obj.sound()"""

#Encapsulation
"""class Factory:
    a="pune"
    def show(self):
        print("hello! how are you?")

class Bhopal(Factory):
    def show2(self):
        print(super().a)
obj = Bhopal()
obj.show2()"""

"""class Factory:
    __a = "pune"

    def show(self):
        print(Factory.__a)

obj = Factory()
obj.show()"""

"""#Abstraction
from abc import ABC, abstractmethod
class abstract:
    @abstractmethod
    def perimeter(self):
        pass
    
    @abstractmethod
    def area(self):
        pass

class circle:
    def __init__(self,radius):
        self.radius = radius

    def show(self):
        print(f"circle radius is {self.radius}")

    def perimeter(self):
        pass
    def area(self):
        pass

obj = circle(17)
obj.show()"""

"""def my_decorate(func):
    def wrapper():
        print("I will print beforre the function")
        func()
        print("smtng after the func")
    return wrapper

@my_decorate 
def say_hello():
    print("hello")
say_hello()"""

"""class Animal:
    @property
    def show(delf):
        print("heyy!")
obj = Animal()
obj.show"""

"""def decorate(func):
    def wrapper(a,b):
        print("The addition to ur numbers are:")
        func(a,b)
        print("Thank you hope you liked it")
    return wrapper
@decorate
def addition(a,b):
    print(f"your total is {a+b}")
addition(12,67)"""

"""def addition(*args):
    sum = 0
    for i in args:
        sum = sum + i
    print(sum)
addition(45,46,54,65)"""

"""def information(**kwargs):
     print("your information is \n")
     for i in kwargs:
         print(f"{i} : {kwargs[i]}")

 information(name = "akarsh", age = 45, designation = "AI/ML")"""

"""def decorate(func):
    def wrapper(*args,**kwargs):
        print("The addition to your numbers are:")
        func(*args,**kwargs)
        print("thank you hope u liked it")
    return wrapper

@decorate
def addition(a,b):
    print(f"total of ur addition is {a + b}")
addition(45,65)"""

"""l = []
for i in range(1,21):
    if i % 2 == 0:
        l.append(i)
print(l)"""

"""l = [i for i in range(1,11) if i % 2 == 0]
print(l)"""

"""l = {i : i ** 2 for i in range(1,11) }
print(l)"""

"""addition = lambda a,b : a+b
print(addition(12,45))"""

"""addition = lambda a:"even" if a%2 == 0 else odd
print(addition(12))"""

"""a = [1,2,3,4,5,6]
result = map(lambda x : x * 2 ,a)
print(list(result))"""

"""def even(x):
    if x % 2 == 0:
        return True
    else:
        return False
a = [1,3,5,7,9,2]
result = filter(even,a)
print(list(result))"""



      
        




        





