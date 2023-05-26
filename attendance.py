from os import path
from datetime import date, datetime
import csv
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore


def databaseget():
    my_dict = {}
    # cred = credentials.Certificate("/home/faisal/world/miniproject/sdkconnect.json")
    # app_options = {'projectId': 'attendancemanagement5'}
    # default_app = firebase_admin.initialize_app(cred)
    # app = firebase_admin.initialize_app(cred, options=app_options)
    print(app.name)
    # db = firestore.client()
    stdlit = db.collection("students").stream()
    for i in stdlit:
        my_dict[i.id[:12]] = i.to_dict()['attend']
    return my_dict


def filecheck(data):
    header = ["Rollno", "Entrytime","Exittime", "status"]
    if path.isfile("/home/faisal/world/miniproject/files/" + tdate + ".csv"):
        f = open("/home/faisal/world/miniproject/files/" + tdate + ".csv", 'a+', newline='')
        csv.reader(f)
        w = csv.DictWriter(f, fieldnames=header)
        w.writerow({"Rollno": data, "Entrytime": datetime.today().strftime("%I:%M %p"), "status": "present"})
    else:
        f = open("/home/faisal/world/miniproject/files/" + tdate + ".csv", 'w+', newline='')
        w = csv.DictWriter(f, fieldnames=header)
        w.writeheader()
        w.writerow({"Rollno": data, "Entrytime": datetime.today().strftime("%I:%M %p"), "status": "present"})


global tdate, cred, app, app_options, db
cred = credentials.Certificate("/home/faisal/world/miniproject/sdkconnect.json")
app_options = {'projectId': 'attendancemanagement5'}
# default_app = firebase_admin.initialize_app(cred)
app = firebase_admin.initialize_app(cred, options=app_options)
db = firestore.client()
tdate = str(date.today())
stdlist = []
if path.isfile("/home/faisal/world/miniproject/files/" + tdate + ".csv"):
    f = open("/home/faisal/world/miniproject/files/" + tdate + ".csv", 'r')
    reader = csv.DictReader(f)
    for i in reader:
        stdlist.append(i["Rollno"])
    print(stdlist)
while True:
    a = input("enter")
    if a == 'q':
        break
    else:
        if a in stdlist:
            f = open("/home/faisal/world/miniproject/files/" + tdate + ".csv", 'a+')
            reader = csv.DictReader(f)
            #for i in reader:
            #f.close()
        else:
            stdlist.append(a)
            filecheck(a)
            data = databaseget()
            print(data)
            data[a.lower()] += 1
            print(data[a.lower()])
            std = db.collection("students").document(a.lower() + "@mcet.in")
            std.set({'attend': data[a.lower()]}, merge=True)

