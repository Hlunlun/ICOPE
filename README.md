###### tags: `Flutter` `ICOPE`

# ICOPE_V1
before 2023/01/10

## Design thinking
1. Define problem
    - How to help the elderly to keep personal health record
4. How to collect data
    - Complex problem
    - collect data around
    - Human-centered design
5. Prototyping
    - Empathize
    - Where to collect data : forum
6. Test

## Table for contents
- [General info](##General-info)
- [Configuration](##Technologies)

## General info
- Name : ICOPE 
- Language : Chinese, Taiwanese
- Target User : For elderly user 50+
- Goal : Help the elderly to record their healthy status(divided into six parts : Cognitive abilities, Locomotor abilities, Vitality, Visual abilities, Hearing capacities, Psychological capacity) every day 
- Status : Only simple question for six parts and user account management, stil update

## Configuration
- Android Studio : Android API 31 Platform
- Flutter 3.3.8
- Dart 2.18.4
- Python 3.9.13
- pymongo 4.3.3
- flask 2.2.2

## Technologies
- Flutter : develope app in this programming language
- flask : create server for app to connect to database
- pymongo : create api for app to do CRUD on database in MongoDB


## Result
### Login
![](https://i.imgur.com/Mpy4N9n.jpg)
### Home Page
![](https://i.imgur.com/ZnBgUsV.png)
### Drawer
![](https://i.imgur.com/kZDJe9F.png)
### Ask basic question
- Gender
![](https://i.imgur.com/1u87GxY.png)
- Birthday
![](https://i.imgur.com/IFPllIE.png)
### Simple question for six parts
- **Cognitive abilities**
![](https://i.imgur.com/R9sKL3L.png)
- **Locomotor abilities**
![](https://i.imgur.com/sPOvRFk.png)
- **Vitality**
![](https://i.imgur.com/wku6Wyr.png)
- **Visual abilities**
![](https://i.imgur.com/VwkHPNh.png)
- **Hearing capacities**
![](https://i.imgur.com/NpeFJJQ.png)
- **Psychological capacity**
![](https://i.imgur.com/LagNxwL.png)

## Reference
#### Icope
- [Icopebot](https://icopebot.botdesign.net/)
- [Icope使用手冊網址](https://www.afro.who.int/fr/publications/manuel-conseils-sur-levaluation-et-les-filieres-axees-sur-la-personne-dans-les-soins)
-[Icope使用手冊[French]](https://apps.who.int/iris/bitstream/handle/10665/329945/9789290313274-fre.pdf?sequence=5&isAllowed=y)
- [Icope App 使用手冊 [French]](https://inspire.chu-toulouse.fr/wp-content/uploads/2020/11/Flyer-ERVPD-DEF-HD.pdf)
- [Icope 教學影片 [French]](https://inspire.chu-toulouse.fr/wp-content/uploads/2020/11/replay-23-11-2020.mp4)
- [Icope 參與者](https://inspire.chu-toulouse.fr/wp-content/uploads/2020/11/replay-23-11-2020.mp4)
- [Icope App 簡介](https://inspire.chu-toulouse.fr/fr/outils-digitaux/)

#### 衛生福利部
- [慢性疾病風險評估平台](https://cdrc.hpa.gov.tw/)
-: [慢性病風險評估簡介第四版0617.pdf](https://cdrc.hpa.gov.tw/doc/%E6%85%A2%E6%80%A7%E7%97%85%E9%A2%A8%E9%9A%AA%E8%A9%95%E4%BC%B0%E7%B0%A1%E4%BB%8B%E7%AC%AC%E5%9B%9B%E7%89%880617.pdf)


## Database
- [mongodb](https://account.mongodb.com/account/login?n=%2Fv2%2F63a1128aea49074b907ea0e1%23%2Fmetrics%2FreplicaSet%2F63a112d7f0f4b7736300ab48%2Fexplorer%2Ficope%2Fusers%2Ffind)
- [python_flask_rest_api](https://www.tutorjoes.in/blog/python_flask_rest_api)








