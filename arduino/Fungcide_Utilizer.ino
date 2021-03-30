#include "dht.h"
dht DHT;
int dht_pin = A0;
int moisture_pin = A1; 
int rain_pin = A2; 
int moisture_value; 
int rain_value;  
int TempArray[24];
int HumArray[24];
int MoisArray[24];
int Hour = 0;

void setup(){
 
  Serial.begin(9600);
  delay(500);//Delay to let system boot
  pinMode(dht_pin,INPUT);
  pinMode(moisture_pin,INPUT);
  pinMode(rain_pin,INPUT);
  Serial.println("Humidity     -     Temperature     -     Soil Moisture     -     Rain\n"); 
}
 
void loop(){
    
    DHT.read11(dht_pin);
    moisture_value = 100 - ((analogRead(moisture_pin)/1023)*100); 
    rain_value = analogRead(rain_pin); 
    Serial.print("Humidity = ");
    Serial.print(DHT.humidity);
    Serial.print("%  ");
    Serial.print("Temperature = ");
    Serial.print(DHT.temperature); 
    Serial.print("C  ");
    Serial.print("Soil Moisture = ");
    Serial.print(moisture_value);
    Serial.print("  Raindrops = ");
    Serial.println(rain_value);

    
    TempArray[Hour] = DHT.temperature;
    HumArray[Hour] = DHT.humidity;
    MoisArray[Hour] = moisture_value;
    
    Hour += 1;
    
    if(Hour == 24){
      //upload data to array and reset hour value 
      Hour = 0;
    }
    
    delay(3600000);
}


