int anal1 = 0;
int anal2 = 0;

void setup() {
 //initialize the serial communication:
 Serial.begin(9600); } 
void loop() {
  anal1 = analogRead(A0);
//  anal2 = analogRead(A1);
 //send the value of analog input 0:
 Serial.println(anal1);
 //Serial.println(anal2);
 
 } 
