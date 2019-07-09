from flask import Flask, jsonify
from os import listdir
import base64
img_dir = "static/cadre_img/"
imgFiles = listdir(img_dir)
app = Flask(__name__)
app.config['JSON_AS_ASCII'] = False
a = [
     {"name":"現任幹部(第三屆)", "items":[
                                   {"name":"劉祐炘", "intro":"好棒棒", "photo":"yozn.png"},
                                   {"name":"yh", "intro":"好棒棒", "photo":"yh.png"}
                                   ]},
     {"name":"現任幹部(第三屆)", "items":[
                                   {"name":"劉祐炘", "intro":"好棒棒", "photo":"yozn.png"}
                                   ]},
     {"name":"現任幹部(第三屆)", "items":[
                                   {"name":"劉祐炘", "intro":"好棒棒", "photo":"yozn.png"}
                                   ]}
     ]
curriculum = [
              {"date":"2019.05.31", "name":"第一堂社課", "url":"https://drive.google.com/file/d/1M8yP804MCF_wmtaVeOCTk-0_FEPs0ghe/view"},
              {"date":"2019.06.04", "name":"第二堂社課", "url":"https://drive.google.com/file/d/19M0So61yIaGOj7r0iY3p2OPVvRmf5T_u/view"},
              {"date":"2019.06.10", "name":"第三堂社課", "url":"https://drive.google.com/file/d/1Qa3FVzDGB8ccZBLju9EZBj1Mw1e6KDrl/view"},
              {"date":"2019.06.19", "name":"第五堂社課", "url":"https://drive.google.com/file/d/1s5gVC_UYKM4x12PkHl7lMATRJJ0ybI45/view"},
              {"date":"2019.06.22", "name":"第六堂社課", "url":"https://drive.google.com/file/d/1D53ktmb-Z7pCTnV3IHEssCGSQ2AGRIfd/view"},
              {"date":"2019.06.30", "name":"第七堂社課", "url":"https://drive.google.com/file/d/1D5AQ-v1-mbmPQfVR-q8KeIqxHjPBlXJ6/view"},
              ]
seasonsColor = [
                [113, 200, 157],
                [234, 102, 88],
                [246, 170, 65],
                [159, 210, 232]
                ]
activities = [
              {"color":seasonsColor[3], "date":"2019-12-15", "type":1,
              "title":"聖誕節交換禮物", "summary":"iOSClub 第二次社遊 - 草泥馬與我有約!",
              "lineInfo":"酌收2000", "ImgUrl":"null", "isEmphasized":0},
              
              {"color":seasonsColor[2], "date":"2019-11-15", "type":1,
              "title":"雙十烤肉", "summary":"歡迎大家來我們攤位看看哦~",
              "lineInfo":"null", "ImgUrl":"null", "isEmphasized":0},
              
              {"color":seasonsColor[2], "date":"2019-10-15", "type":1,
              "title":"新生茶會", "summary":"歡迎大家來我們攤位看看哦~",
              "lineInfo":"null", "ImgUrl":"null", "isEmphasized":0},
              
              {"color":seasonsColor[1], "date":"2019-09-15", "type":1,
              "title":"社團博覽會", "summary":"歡迎大家來我們攤位看看哦~",
              "lineInfo":"null", "ImgUrl":"null", "isEmphasized":0},
              
              {"color":seasonsColor[1], "date":"2019-07-11", "type":1,
              "title":"六根清淨", "summary":"iOSClub 第二次社遊 - 草泥馬與我有約!",
              "lineInfo":"null", "ImgUrl":"null", "isEmphasized":1},
              
              {"color":seasonsColor[2], "date":"2018-10-10", "type":1,
              "title":"秋日賞楓", "summary":"吃竹間!!",
              "lineInfo":"null", "ImgUrl":"null", "isEmphasized":1},
              
              {"color":seasonsColor[1], "date":"2019-05-10", "type":1,
              "title":"期末聚餐", "summary":"吃竹間!!",
              "lineInfo":"null", "ImgUrl":"null", "isEmphasized":1},
              
              {"color":seasonsColor[1], "date":"2019-05-09", "type":1,
              "title":"社員大會", "summary":"有準備精美小禮物哦~",
              "lineInfo":"null", "ImgUrl":"null", "isEmphasized":1},
              
              {"color":seasonsColor[0], "date":"2019-03-09", "type":1,
              "title":"春日賞花季", "summary":"有準備精美小禮物哦~",
              "lineInfo":"null", "ImgUrl":"null", "isEmphasized":1},
              
              {"color":seasonsColor[3], "date":"2019-01-01", "type":1,
              "title":"歡慶元旦", "summary":"有準備精美小禮物哦~",
              "lineInfo":"null", "ImgUrl":"null", "isEmphasized":1},
              ]




@app.route("/api/v1/cadre")
def getCadres():
    
    for i in range(len(a)):
        for j in range(len(a[i]["items"])):
            fileName = a[i]["items"][j]["photo"] if a[i]["items"][j]["photo"] in imgFiles else "default.png"
            with open("static/cadre_img/{}".format(fileName), "rb") as imageFile:
                tempStr = base64.b64encode(imageFile.read())
            a[i]["items"][j]["photo"] = tempStr.decode('utf-8')
    return jsonify(a)


@app.route("/api/v1/curriculum")
def getCurriculum():
    return jsonify(curriculum)
@app.route("/api/v1/activities")
def getActivities():
    return jsonify(activities)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port="2914")
# 如果是阿貴方案
# app.run(host='0.0.0.0', port='80')#

