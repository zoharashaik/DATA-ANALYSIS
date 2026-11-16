"""from pathlib import Path
import os

def readfileandfolder():
    path = Path('')
    items = list(path.rglob('*'))
    for i, items in enumerate(items):
        print(f"{i+1} : {items}")

def createfile():
    try:
        readfileandfolder()
        name = input("Plese tell your file name:")
        p = Path(name)
        if not p.exists():
            with open(p,"w") as fs:
                data = input("what you want to write:")  
                fs.write(data)

            print("FILE CREATED SUCCESSFULLY")
        else:
            print("This file already exists")


    except Exception as err:
        print(f"an error occured as {err}")

def readfile():
    try:
        readfileandfolder()
        name = input("which file you want to read:")
        p = Path(name)
        if p.exists() or p.is_file():
            with open(p,"r") as fs:
                data = fs.read()
                print(data)

            print("FILE READED SUCCESSFULLY")
        else:
            print("This file doesn't exists")

    except Exception as err:
        print(f"an error occured as {err}")

def updatefile():
    try:
        readfileandfolder()
        name = input("Which file you want to update:")
        p = Path(name)
        if p.exists() or p.is_file():
            print("press 1 to change name of the file")
            print("press 2 for overwriting the content of the file")
            print("press 3 for appending the content in your file")

            res = int(input("Enter your response:"))

            if res == 1:
                name2 = input("Enter your new name:")
                p2 = Path(name2)
                p.rename(p2)

            if res == 2:
                with open(p, "w") as fs:
                    data = input("Enter what you want to write to overwrite the file:")
                    fs.write(data)

            if res == 3:
                with open(p, "a") as fs:
                    data = input("Enter what you want to append the content in this file:")
                    fs.write(" "+data)

            print("FILE UPDATED SUCCESSFULLY")

    except Exception as err:
        print(f"an exception occured as {err}")

def deletefile():
    try:
        readfileandfolder()
        name = input("Enter which file you want to delete:")
        p = Path(name)
        if p.exists() or p.is_file():
            os.remove(p)

            print("FILE REMOVED SUCCESSFULLY")

        else:
            print("This file doesnt exists ")
    except Exception as err:
        print(f"An error occured as {err}")


print("Press 1 for creating a file")
print("press 2 for reading a file")
print("press 3 for updating a file")
print("press 4 for deleting a file")

check = int(input("Enter your response:"))

if check == 1:
    createfile()

if check ==  2:
    readfile()

if check == 3:
    updatefile()

if check == 4:
    deletefile()"""


from pathlib import Path
import os

# ---------------------------
# SHOW ALL FILES AND FOLDERS
# ---------------------------
def show_items():
    path = Path.cwd()
    items = list(path.rglob("*"))

    print("\nAvailable Files and Folders:\n")

    for i, item in enumerate(items):
        print(f"{i+1} : {item}")


# ---------------------------
# CREATE FILE
# ---------------------------
def create_file():
    name = input("Enter file name: ")
    p = Path(name)

    if not p.exists():
        data = input("Enter content: ")

        with open(p, "w") as f:
            f.write(data)

        print("File created successfully")

    else:
        print("File already exists")


# ---------------------------
# READ FILE
# ---------------------------
def read_file():
    name = input("Enter file name to read: ")
    p = Path(name)

    if p.exists() and p.is_file():
        with open(p, "r") as f:
            print("\nFile Content:\n")
            print(f.read())
    else:
        print("File not found")


# ---------------------------
# EDIT FILE
# ---------------------------
def edit_file():
    name = input("Enter file name to edit: ")
    p = Path(name)

    if p.exists() and p.is_file():

        print("1. Overwrite file")
        print("2. Append content")

        choice = int(input("Enter choice: "))

        if choice == 1:
            data = input("Enter new content: ")

            with open(p, "w") as f:
                f.write(data)

        elif choice == 2:
            data = input("Enter content to append: ")

            with open(p, "a") as f:
                f.write("\n" + data)

        print("File updated successfully")

    else:
        print("File not found")


# ---------------------------
# DELETE FILE
# ---------------------------
def delete_file():
    name = input("Enter file name to delete: ")
    p = Path(name)

    if p.exists():
        os.remove(p)
        print("File deleted successfully")
    else:
        print("File not found")


# ---------------------------
# CREATE FOLDER
# ---------------------------
def create_folder():
    name = input("Enter folder name: ")
    p = Path(name)

    if not p.exists():
        p.mkdir()
        print("Folder created successfully")
    else:
        print("Folder already exists")


# ---------------------------
# SEARCH FILE
# ---------------------------
def search_file():
    name = input("Enter file name to search: ")
    path = Path.cwd()

    found = list(path.rglob(name))

    if found:
        print("\nFile Found at:\n")
        for f in found:
            print(f)
    else:
        print("File not found")


# ---------------------------
# MAIN MENU
# ---------------------------
def main():

    while True:

        print("\n------ FILE MANAGER ------")

        print("1. Show files and folders")
        print("2. Create file")
        print("3. Read file")
        print("4. Edit file")
        print("5. Delete file")
        print("6. Create folder")
        print("7. Search file")
        print("8. Exit")

        choice = int(input("Enter your choice: "))

        if choice == 1:
            show_items()

        elif choice == 2:
            create_file()

        elif choice == 3:
            read_file()

        elif choice == 4:
            edit_file()

        elif choice == 5:
            delete_file()

        elif choice == 6:
            create_folder()

        elif choice == 7:
            search_file()

        elif choice == 8:
            print("Exiting program")
            break

        else:
            print("Invalid choice")


# Run program
main()
