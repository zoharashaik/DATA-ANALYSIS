import json
import random
import string
from pathlib import Path


class Bank:
    database = 'data.json'
    data = []

    try:
        if Path(database).exists():
            with open(database) as fs:
                data = json.loads(fs.read())
        else:
            print("No such file exists")
    except Exception as err:
        print(f"exception occured as {err}")

    @staticmethod
    def __update():
        with open(Bank.database,'w') as fs:
            fs.write(json.dumps(Bank.data))

    @classmethod
    def __accountgenerate(cls):
        alpha = random.choices(string.ascii_letters,k=3)
        num = random.choices(string.digits,k=2)
        spchar = random.choices("!@#$%&*",k=1)
        id = alpha + num + spchar
        random.shuffle(id)
        return"".join(id)

        

    def Createaccount(self):
        info = {
            "name" : input("Enter your name:"),
            "age" : int(input("Enter your age:")),
            "email" : input("Enter your email:"),
            "pin" : int(input("Enter your pin:")),
            "accountno." : Bank.__accountgenerate(),
            "balance" : 0
        }
        if info['age'] < 18 or len(str(info['pin'])) != 4:
            print("sorry you vannot create an account")
        else:
            print("account has been created successfully")
            for i in info:
                print(f"{i} : {info[i]}")
            print("note down your account number")

        Bank.data.append(info)

        Bank.__update()

    def depositmoney(self):
        accnumber = input("Enter your account number:")
        pin = int(input("Enter your pin here: "))

        userdata = [i for i in Bank.data if i['accountno.'] == accnumber and i['pin'] == pin]

        if not userdata:
            print("No data found")
        else:
            amount = int(input("How much money you want to deposit:"))
            if amount > 10000 or amount < 0:
                print("You cannot deposit more than 10000 and less than zero")
            else:
                print(userdata)
                userdata[0]['balance'] += amount
                Bank.__update()
                print("Amount deposited successfully")

    def withdrawmoney(self):
        accnumber = input("Enter your account number:")
        pin = int(input("Enter your pin here: "))

        userdata = [i for i in Bank.data if i['accountno.'] == accnumber and i['pin'] == pin]

        if not userdata:
            print("No data found")
        else:
            amount = int(input("How much money you want to withdraw:"))
            if userdata[0]['balance']  < amount:
                print("Sorry you dont have that much money")
            else:
                print(userdata)
                userdata[0]['balance'] -= amount
                Bank.__update()
                print("Amount withdrew successfully")

    def showdetails(self):
        accnumber = input("Enter your account number:")
        pin = int(input("Enter your pin here: "))

        userdata = [i for i in Bank.data if i['accountno.'] == accnumber and i['pin'] == pin]
        print("Your information is here:\n\n")
        for i  in userdata[0]:
            print(f"{i} : {userdata[0][i]}")

    
    def updatedetails(self):
        accnumber = input("Enter your account number:")
        pin = int(input("Enter your pin here: "))

        userdata = [i for i in Bank.data if i['accountno.'] == accnumber and i['pin'] == pin]

        if not userdata:
            print("No such data found")
        else:
            print("Note: You cannot change  your age, accountnumber, balance ")

            print("Fill the details you wanna change if not press enter to skip ")

            newdata = {
                "name" : input("Enter you name :"),
                "email" : input("Enter your email:"),
                "pin" : input("Enter  your pin:")
            }

            if newdata["name"] == "":
                newdata["name"] == userdata[0]['name']
            if newdata["email"] == "":
                newdata["email"] == userdata[0]['email']
            if newdata["pin"] == "":
                newdata["pin"] == userdata[0]['pin']

            newdata['age'] = userdata[0]['age']
            newdata['accountno.'] = userdata[0]['accountno.']
            newdata['balance'] = userdata[0]['balance']

            if type(newdata['pin']) == str:
                newdata['pin'] = int(newdata['pin'])

            for i in newdata:
                if newdata[i] == userdata[0][i]:
                    continue
                else:
                    userdata[0][i] = newdata[i]

            Bank.__update()
            print("Your details updated successfully ")

    def Delete(self):
        accnumber = input("Enter your account number:")
        pin = int(input("Enter your pin here: "))

        userdata = [i for i in Bank.data if i['accountno.'] == accnumber and i['pin'] == pin]

        if not userdata:
            print("No such data found")
        else:
            Press = print("click on D button to delete your account otherwise click on P")
            if Press == "p" or "P":
                print("bypassed")
            if Press == "d" or "D":
                index = Bank.data.index(userdata[0])
                Bank.data.pop(index)
                print("Your account deleted successfully")
                Bank.__update()

 
user = Bank()
print("press 1 to create an account")
print("press 2 to deposit the money")
print("press 3 to withdraw the money")
print("press 4 to show the details")
print("press 5 to  update the details")
print("press 6 to delete  the account")
check = int(input("Enter your response:"))

if check == 1:
    user.Createaccount()

if check ==  2:
    user.depositmoney()

if check == 3:
    user.withdrawmoney()

if check == 4:
    user.showdetails()

if check == 5:
    user.updatedetails()

if check == 6:
    user.Delete()
    