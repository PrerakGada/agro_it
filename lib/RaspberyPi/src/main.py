import json
import time
import datetime
import gpiozero
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import Adafruit_DHT

# Constants
CREDENTIAL_PATH = "credentials.json"
SMOKE_SENSOR_PIN = 14
MOTION_SENSOR_PIN = 17
MOISTURE_SENSOR_PIN = 23
DHT_SENSOR_PIN = 10
SPRINKLER_PIN = 15
PESTICIDE_PIN = 20
FERTILIZER_PIN = 18
BUZZER_PIN = 12

# Firebase credentials
credentialsCertificate = credentials.Certificate(CREDENTIAL_PATH)
firebase_admin.initialize_app(credentialsCertificate)
database = firestore.client()

# Sensor wrapper classes

class MQ135(gpiozero.GPIODevice):
	"""
	MQ-135 Smoke detector
	"""
	def __init__(self, pin_no):
		super().__init__(pin_no)

class MoistureSensor(gpiozero.GPIODevice):
	"""
	FC-28 Soil / Water Moisture detector
	"""
	def __init__(self, pin_no):
		super().__init__(pin_no)

# Sensors and variables

mq_135 = MQ135(SMOKE_SENSOR_PIN)
dht_sensor = Adafruit_DHT.DHT11
moisture_sensor = MoistureSensor(MOISTURE_SENSOR_PIN)
motion_sensor = gpiozero.MotionSensor(MOTION_SENSOR_PIN)
sprinkler_led = gpiozero.LED(SPRINKLER_PIN)
pesticide_led = gpiozero.LED(PESTICIDE_PIN)
fertilizer_led = gpiozero.LED(FERTILIZER_PIN)
buzzer = gpiozero.Buzzer(BUZZER_PIN)
last_humidity = 0
last_temperature = 0

# Data functions

def getSmokeValue():
	return mq_135.value

def getMoistureValue():
	return moisture_sensor.value

def getHumidityValue():
	humidity, _ = Adafruit_DHT.read(dht_sensor, DHT_SENSOR_PIN)
	global last_humidity
	if humidity == None:
		humidity = last_humidity
	last_humidity = humidity
	return humidity

def getTemperatureValue():
	_, temperature = Adafruit_DHT.read(dht_sensor, DHT_SENSOR_PIN)
	global last_temperature
	if temperature == None:
		temperature = last_temperature
	last_temperature = temperature
	return temperature

def getMotionValue():
	return motion_sensor.value

def getPesticideData():
	collection = database.collection("sensorData")
	pesticideDocRef = collection.document("pesticideCycle")
	pesticideDoc = pesticideDocRef.get().to_dict()
	pesticideDue = pesticideDoc["nextPesticideDue"]
	pesticideStatus = pesticideDoc["acknowledged"]
	currentTimeStamp = time.time()
	if currentTimeStamp >= pesticideDue and pesticideStatus == False:
		# Spray pesticides
		pesticide_led.value = 1
		buzzer.value = 1
		time.sleep(5)
		pesticide_led.value = 0
		buzzer.value = 0
		pesticideDocRef.update({
			"nextPesticideDue" : pesticideDue,
			"acknowledged" : True
		})

def getFertilizerData():
	collection = database.collection("sensorData")
	fertilizerDocRef = collection.document("fertilizerCycle")
	fertilizerDoc = fertilizerDocRef.get().to_dict()
	fertilizerDue = fertilizerDoc["nextFertilizerDue"]
	fertilizerStatus = fertilizerDoc["acknowledged"]
	currentTimeStamp = time.time()
	if currentTimeStamp >= fertilizerDue and fertilizerStatus == False:
		# Spray fertilizer
		fertilizer_led.value = 1
		buzzer.value = 1
		time.sleep(5)
		fertilizer_led.value = 0
		buzzer.value = 0
		fertilizerDocRef.update({
			"nextFertilizerDue" : fertilizerDue,
			"acknowledged" : True
		})

def getSprinklerData():
	collection = database.collection("sensorData")
	sprinklerDocRef = collection.document("sprinklerCycle")
	sprinklerDoc = sprinklerDocRef.get().to_dict()
	sprinklerDue = sprinklerDoc["nextSprinklerDue"]
	sprinklerStatus = sprinklerDoc["acknowledged"]
	currentTimeStamp = time.time()
	if currentTimeStamp >= sprinklerDue and sprinklerStatus == False:
		# Activate sprinklers
		activateSprinklers()
		sprinklerDocRef.update({
			"nextSprinklerDue" : sprinklerDue,
			"acknowledged" : True
		})

def activateSprinklers():
	sprinkler_led.value = 1
	buzzer.value = 1
	time.sleep(5)
	sprinkler_led.value = 0
	buzzer.value = 0

def insertData(sensorValues):
	smokeSensor = sensorValues["smokeSensor"]
	motionSensor = sensorValues["motionSensor"]
	moistureSensor = sensorValues["moistureSensor"]
	dhtSensor = sensorValues["dhtSensor"]
	collection = database.collection("sensorData")
	collection.document("smokeSensor").update(smokeSensor)
	collection.document("motionSensor").update(motionSensor)
	collection.document("moistureSensor").update(moistureSensor)
	collection.document("dhtSensor").update(dhtSensor)

def generateJSONData():
	return {
		"smokeSensor" : {
			"smokeValue" : getSmokeValue()
		},
		"motionSensor" : {
			"motionValue" : getMotionValue()
		},
			"moistureSensor" : {
			"moistureValue" : getMoistureValue()
		},
		"dhtSensor" : {
			"humidityValue" : getHumidityValue(),
			"temperatureValue" : getTemperatureValue()
		}
	}

def main():
	while True:
		sensorData = generateJSONData()
		smokeStatus = sensorData["smokeSensor"]["smokeValue"]
		if smokeStatus == 1:
			# In case of fire
			activateSprinklers()

		getPesticideData()
		getFertilizerData()
		print(
			json.dumps(
				sensorData, indent = 4
			)
		)
		insertData(sensorData)
		time.sleep(5)

if __name__ == "__main__":
	main()
