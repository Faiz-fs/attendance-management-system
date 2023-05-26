
import cv2, sys, numpy, os
import face_recognition

haar_file = 'haarcascade_frontalface_default.xml'

sub_data = 'faces'
for filename in os.listdir(sub_data):
    f = os.path.join(sub_data,filename)
    if os.path.isfile(f):
        print(filename)
(width, height) = (130, 100)


face_cascade = cv2.CascadeClassifier(haar_file)
webcam = cv2.VideoCapture(0)


count = 1
while True:
    (_, im) = webcam.read()
    gray = cv2.cvtColor(im, cv2.COLOR_BGR2RGB)
    #img2_encoding = face_recognition.face_encodings(gray)[0]
    faces = face_cascade.detectMultiScale(gray, 1.3, 4)
    for (x, y, w, h) in faces:
        cv2.rectangle(im, (x, y), (x + w, y + h), (255, 0, 0), 2)
        face = gray[y:y + h, x:x + w]
        face_resize = cv2.resize(face, (width, height))
        img = cv2.imread("faces/fs.jpeg")
        rgb_img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        img_encoding = face_recognition.face_encodings(rgb_img)[0]
        img2_encoding = face_recognition.face_encodings(gray)[0]
        result = face_recognition.compare_faces([img_encoding], img2_encoding)
        print(result,)


        '''for filename in os.listdir(sub_data):
            f = os.path.join(sub_data, filename)
            if os.path.isfile(f):
                img = cv2.imread(f)
                rgb_img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
                img_encoding = face_recognition.face_encodings(rgb_img)[0]
                result = face_recognition.compare_faces([img_encoding], img2_encoding)
                print(result)'''

        #cv2.imwrite('% s/% s.png' % (path, count), face_resize)
    count += 1

    cv2.imshow('OpenCV', im)
    key = cv2.waitKey(10)
    if key == 27:
        break
