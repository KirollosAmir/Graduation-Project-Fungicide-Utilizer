#include "dht.h"
dht DHT;
int dht_apin = A0;
int sensorPin = A1; 
int sensorValue;  

void setup(){
 
  Serial.begin(9600);
  delay(500);//Delay to let system boot
  Serial.println("Humidity    -    Temperature    -    Soil Moisture\n"); 
}
 
void loop(){
    DHT.read11(dht_apin);
    sensorValue = analogRead(sensorPin); 
    Serial.print("Humidity = ");
    Serial.print(DHT.humidity);
    Serial.print("%  ");
    Serial.print("Temperature = ");
    Serial.print(DHT.temperature); 
    Serial.print("C  ");
    Serial.print("Soil Moisture = ");
    Serial.println(sensorValue);
    delay(5000);
}


