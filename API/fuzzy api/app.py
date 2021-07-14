from urllib.request import urlopen

import mysql.connector
from flask import Flask
from flask import request
import numpy as np
import skfuzzy as fuzz
from skfuzzy import control as ctrl
from datetime import date
from datetime import timedelta
import urllib
import matplotlib
import json

app = Flask(__name__)


@app.route('/land', methods=['GET'])
def wheat_rust():
    stationData = request.args.to_dict()
    day0 = str(date.today())
    day1 = str(date.today() - timedelta(days=1))
    day2 = str(date.today() - timedelta(days=2))
    day3 = str(date.today() - timedelta(days=3))
    day4 = str(date.today() - timedelta(days=4))
    day5 = str(date.today() - timedelta(days=5))
    mydb = mysql.connector.connect(
        host="sql4.freesqldatabase.com",
        user="sql4424593",
        password="HNnt6XA89d",
        database="sql4424593"
    )

    mycursor = mydb.cursor()

    mycursor.execute(
        """SELECT land_id,farmer_id,title FROM land_owners,lands WHERE land_id=id AND station = %s"""%stationData['station'])
    #return str("""SELECT land_id,farmer_id,title FROM land_owners,lands WHERE land_id=id station = %s"""%stationData['station'])

    row = mycursor.fetchone()
    landID = row[0]
    farmerID = row[1]
    title = row[2]

    mycursor.execute("""INSERT INTO status(entry_date, land_id, maxTemp, minTemp, humidity, windSpeed) VALUES("%s", %s, %s, %s, %s, %s)""" % (
        day1, landID, stationData['maxTemp'], stationData['minTemp'], stationData['humidity'], stationData['windSpeed']))

    mydb.commit()

    mycursor.execute(
        """SELECT maxTemp, minTemp,humidity,windSpeed FROM status WHERE land_id = %s and (entry_date = %s or entry_date = %s or entry_date = %s or entry_date = %s or entry_date = %s)""",
        (landID, day1, day2, day3, day4, day5))

    myresult = mycursor.fetchall()

    max_temp = ctrl.Antecedent(np.arange(0, 61, 1), 'max_temp')
    min_temp = ctrl.Antecedent(np.arange(0, 61, 1), 'min_temp')
    relative_humidity = ctrl.Antecedent(np.arange(0, 101, 1), 'relative_humidity')
    wind_speed = ctrl.Antecedent(np.arange(0, 32.1, 0.1), 'wind_speed')
    rust_severity = ctrl.Consequent(np.arange(0, 11, 1), 'rust_severity')

    max_temp['accepted'] = fuzz.trimf(max_temp.universe, [0, 15, 25])
    max_temp['rejected'] = fuzz.trimf(max_temp.universe, [24.9, 35, 60])

    min_temp['rejected'] = fuzz.trimf(min_temp.universe, [0, 4, 8])
    min_temp['accepted'] = fuzz.trimf(min_temp.universe, [7.9, 11, 14])
    min_temp['rejected2'] = fuzz.trimf(min_temp.universe, [13.9, 27, 60])

    relative_humidity['rejected'] = fuzz.trimf(relative_humidity.universe, [0, 35, 70.1])
    relative_humidity['accepted'] = fuzz.trimf(relative_humidity.universe, [70, 85, 100])

    wind_speed['rejected'] = fuzz.trimf(wind_speed.universe, [0, 1, 1.51])
    wind_speed['accepted'] = fuzz.trimf(wind_speed.universe, [1.5, 6, 9])
    wind_speed['rejected2'] = fuzz.trimf(wind_speed.universe, [8.9, 20, 32])

    rust_severity['low'] = fuzz.trimf(rust_severity.universe, [0, 3, 6])
    rust_severity['high'] = fuzz.trimf(rust_severity.universe, [5.9, 8, 10])

    rule1 = ctrl.Rule(
        max_temp['accepted'] & min_temp['accepted'] & relative_humidity['accepted'] & wind_speed['accepted'],
        rust_severity['high'])
    rule2 = ctrl.Rule(
        max_temp['rejected'] | min_temp['rejected'] | min_temp['rejected2'] | relative_humidity['rejected'] |
        wind_speed['rejected'], rust_severity['low'])

    rust_ctrl = ctrl.ControlSystem([rule1, rule2])

    rust_disease_severity1 = ctrl.ControlSystemSimulation(rust_ctrl)

    rust_disease_severity1.input['max_temp'] = myresult[0][0]
    rust_disease_severity1.input['min_temp'] = myresult[0][1]
    rust_disease_severity1.input['relative_humidity'] = myresult[0][2]
    rust_disease_severity1.input['wind_speed'] = myresult[0][3]

    rust_disease_severity1.compute()
    result1 = rust_disease_severity1.output['rust_severity']

    rust_disease_severity2 = ctrl.ControlSystemSimulation(rust_ctrl)

    rust_disease_severity2.input['max_temp'] = myresult[1][0]
    rust_disease_severity2.input['min_temp'] = myresult[1][1]
    rust_disease_severity2.input['relative_humidity'] = myresult[1][2]
    rust_disease_severity2.input['wind_speed'] = myresult[1][3]

    rust_disease_severity2.compute()
    result2 = rust_disease_severity2.output['rust_severity']

    rust_disease_severity3 = ctrl.ControlSystemSimulation(rust_ctrl)

    rust_disease_severity3.input['max_temp'] = myresult[2][0]
    rust_disease_severity3.input['min_temp'] = myresult[2][1]
    rust_disease_severity3.input['relative_humidity'] = myresult[2][2]
    rust_disease_severity3.input['wind_speed'] = myresult[2][3]

    rust_disease_severity3.compute()
    result3 = rust_disease_severity3.output['rust_severity']

    rust_disease_severity4 = ctrl.ControlSystemSimulation(rust_ctrl)

    rust_disease_severity4.input['max_temp'] = myresult[3][0]
    rust_disease_severity4.input['min_temp'] = myresult[3][1]
    rust_disease_severity4.input['relative_humidity'] = myresult[3][2]
    rust_disease_severity4.input['wind_speed'] = myresult[3][3]

    rust_disease_severity4.compute()
    result4 = rust_disease_severity4.output['rust_severity']

    rust_disease_severity5 = ctrl.ControlSystemSimulation(rust_ctrl)

    rust_disease_severity5.input['max_temp'] = myresult[4][0]
    rust_disease_severity5.input['min_temp'] = myresult[4][1]
    rust_disease_severity5.input['relative_humidity'] = myresult[4][2]
    rust_disease_severity5.input['wind_speed'] = myresult[4][3]

    rust_disease_severity5.compute()
    result5 = rust_disease_severity5.output['rust_severity']

    if result1 >= 5 and result2 >= 5 and result3 >= 5 and result4 >= 5 and result5 >= 5:
        message = 'Wheat Rust will possibly appear today in '+ str(title)
        mycursor.execute(
            """INSERT INTO notifications(date, user_id, message, seen) VALUES("%s", "%s","%s",'0')""" % (
                day0, farmerID, message))

        mydb.commit()
#    else:
#        message1 = 'Wheat Rust Negative'

    mycursor.execute(
        """SELECT postal_code FROM lands WHERE id = %s""" % landID)

    postalCode = mycursor.fetchone()[0]

    url = "https://api.aerisapi.com/forecasts/%s?limit=5&client_id=GYqeCk2gsNVQcoWP2niE6&client_secret=jMtnT2usFEsqWFe7bAAAGefDWhbMmzveHp9q2oqg"
    json_url = urlopen(url % postalCode)
    data = json.loads(json_url.read())
    rust_disease_severity6 = ctrl.ControlSystemSimulation(rust_ctrl)

    rust_disease_severity6.input['max_temp'] = data['response'][0]['periods'][0]['maxTempC']
    rust_disease_severity6.input['min_temp'] = data['response'][0]['periods'][0]['minTempC']
    rust_disease_severity6.input['relative_humidity'] = data['response'][0]['periods'][0]['humidity']
    rust_disease_severity6.input['wind_speed'] = (data['response'][0]['periods'][0]['windSpeedMPH'] / 2.237)

    rust_disease_severity6.compute()
    result6 = rust_disease_severity6.output['rust_severity']

    rust_disease_severity7 = ctrl.ControlSystemSimulation(rust_ctrl)

    rust_disease_severity7.input['max_temp'] = data['response'][0]['periods'][1]['maxTempC']
    rust_disease_severity7.input['min_temp'] = data['response'][0]['periods'][1]['minTempC']
    rust_disease_severity7.input['relative_humidity'] = data['response'][0]['periods'][1]['humidity']
    rust_disease_severity7.input['wind_speed'] = (data['response'][0]['periods'][1]['windSpeedMPH'] / 2.237)

    rust_disease_severity7.compute()
    result7 = rust_disease_severity7.output['rust_severity']

    rust_disease_severity8 = ctrl.ControlSystemSimulation(rust_ctrl)

    rust_disease_severity8.input['max_temp'] = data['response'][0]['periods'][4]['maxTempC']+2
    rust_disease_severity8.input['min_temp'] = data['response'][0]['periods'][4]['minTempC']+2
    rust_disease_severity8.input['relative_humidity'] = data['response'][0]['periods'][4]['humidity']+2
    rust_disease_severity8.input['wind_speed'] = (data['response'][0]['periods'][4]['windSpeedMPH'] + 2 / 2.237)

    rust_disease_severity8.compute()
    result8 = rust_disease_severity8.output['rust_severity']

    rust_disease_severity9 = ctrl.ControlSystemSimulation(rust_ctrl)

    rust_disease_severity9.input['max_temp'] = data['response'][0]['periods'][4]['maxTempC']
    rust_disease_severity9.input['min_temp'] = data['response'][0]['periods'][4]['minTempC']
    rust_disease_severity9.input['relative_humidity'] = data['response'][0]['periods'][4]['humidity']
    rust_disease_severity9.input['wind_speed'] = (data['response'][0]['periods'][4]['windSpeedMPH'] / 2.237)

    rust_disease_severity9.compute()
    result9 = rust_disease_severity9.output['rust_severity']

    rust_disease_severity10 = ctrl.ControlSystemSimulation(rust_ctrl)

    rust_disease_severity10.input['max_temp'] = data['response'][0]['periods'][4]['maxTempC']
    rust_disease_severity10.input['min_temp'] = data['response'][0]['periods'][4]['minTempC']
    rust_disease_severity10.input['relative_humidity'] = data['response'][0]['periods'][4]['humidity']
    rust_disease_severity10.input['wind_speed'] = (data['response'][0]['periods'][4]['windSpeedMPH'] / 2.237)

    rust_disease_severity10.compute()
    result10 = rust_disease_severity10.output['rust_severity']

    if result6 >= 5 and result7 >= 5 and result8 >= 5 and result9 >= 5 and result10 >= 5:
        message = 'Wheat Rust will possibly appear after 5 days in ' + str(title)
        mycursor.execute(
            """INSERT INTO notifications(date, user_id, message, seen) VALUES("%s", "%s","%s",'0')""" % (
                day0, farmerID, message))

    return ""


if __name__ == '__main__':
    app.run()
