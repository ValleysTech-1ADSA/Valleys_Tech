#include "DHT.h"
#define dht_type DHT11 //define qual o tipo de sensor DHTxx que se está utilizando
/**
* Configurações iniciais sobre os sensores
* DHT11, LM35, LDR5 e TCRT5000
*/
int dht_pin = A2;
DHT dht_1 = DHT(dht_pin, dht_type); //pode-se configurar diversossensores DHTxx
int lm35_pin = A0, leitura_lm35 = 0;
float temperatura;
int ldr_pin = A5, leitura_ldr = 0;
int switch_pin = 7;
void setup()
{
Serial.begin(9600);
dht_1.begin();
pinMode(switch_pin, INPUT);
}
void loop()
{
/**
* Bloco do DHT11
*/
float umidade = dht_1.readHumidity();
float temperatura = dht_1.readTemperature();
float umidade2 = dht_1.readHumidity()*1.10;
float temperatura2 = dht_1.readTemperature()*1.10;
float umidade3 = dht_1.readHumidity()*1.20;
float temperatura3 = dht_1.readTemperature()*1.20;
float umidade4 = dht_1.readHumidity()*1.30;
float temperatura4 = dht_1.readTemperature()*1.30;

if (isnan(temperatura) or isnan(umidade))
{
Serial.println("Erro ao ler o DHT");
}
else
{
Serial.print(umidade);
Serial.print(";");
Serial.print(temperatura);
Serial.print(";");
Serial.print(umidade2);
Serial.print(";");
Serial.print(temperatura2);
Serial.print(";");
Serial.print(umidade3);
Serial.print(";");
Serial.print(temperatura3);
Serial.print(";");
Serial.print(umidade4);
Serial.print(";");
Serial.println(temperatura4);
}
delay(2000);
}
