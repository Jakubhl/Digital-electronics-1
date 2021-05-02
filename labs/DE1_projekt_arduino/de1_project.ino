byte trig = 8;
byte echo = 9;
long doba;
int vzdalenost;
int zpozdeni =750;
byte piezo = 1;
byte stavy;
byte led;
unsigned long t1;
unsigned long t2;
unsigned long t3;
unsigned long t4;
void setup() {
  // put your setup code here, to run once:
  pinMode(trig,OUTPUT);
  pinMode(echo,INPUT);
  pinMode(10,OUTPUT);
  pinMode(11,OUTPUT);
  pinMode(12,OUTPUT);
  pinMode(13,OUTPUT);
  pinMode(2,OUTPUT);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:

  digitalWrite(trig,LOW);
  delayMicroseconds(20);
  digitalWrite(trig,HIGH);
  delayMicroseconds(30);
  digitalWrite(trig,LOW);
 doba=pulseIn(echo,HIGH);
 vzdalenost=doba*0.034/2;
 


switch(piezo){
  case 1:digitalWrite(2,HIGH);t1=millis();piezo=2; 
break;
  case 2:t2=millis();if(t2-t1>zpozdeni/2){digitalWrite(2,LOW);t1=millis();piezo=3;}
break;
  case 3:t2=millis();if(t2-t1>zpozdeni){piezo=1;}
break;
};

switch(led){
  case 1:digitalWrite(13,HIGH);t3=millis();led=2; 
break;
  case 2:t4=millis();if(t4-t3>500){digitalWrite(13,LOW);t3=millis();led=3;}
break;
  case 3:t4=millis();if(t4-t3>500){led=1;}
break;
  };

if(vzdalenost>=40){digitalWrite(2,LOW);stavy=1;if(led==1){led=0;};if(piezo==1){piezo=0;};};
if(vzdalenost<40 && vzdalenost>=30){stavy=2;if(led==0){led=1;};if(piezo==0){piezo=1;};};
if(vzdalenost<30 && vzdalenost>=20){stavy=3;if(led==1){led=0;};if(piezo==0){piezo=1;};};
if(vzdalenost<20 && vzdalenost>=10){stavy=4;if(led==1){led=0;};if(piezo==0){piezo=1;};};
if(vzdalenost<10 && vzdalenost>=4){stavy=5;if(led==1){led=0;};if(piezo==0){piezo=1;};};
if(vzdalenost<4){stavy=6;if(led==1){led=0;};if(piezo==1){piezo=0;};};

delay(100);

switch(stavy){
  case 1:
      
      digitalWrite(13,LOW);
      digitalWrite(12,LOW);
      digitalWrite(11,LOW);
      digitalWrite(10,LOW);
       
  break;
  case 2:
 
    digitalWrite(13,LOW);
    digitalWrite(12,LOW);
    digitalWrite(11,LOW);
    digitalWrite(10,LOW);
    zpozdeni=800;
    
  break;
  case 3:
  
    digitalWrite(13,HIGH);
    digitalWrite(12,LOW);
    digitalWrite(11,LOW);
    digitalWrite(10,LOW);
    zpozdeni=500;
   
  break;
  case 4:
 
    digitalWrite(13,HIGH);
    digitalWrite(12,HIGH);
    digitalWrite(11,LOW);
    digitalWrite(10,LOW);
    zpozdeni=300;
  
  break;
  case 5:
  
    digitalWrite(13,HIGH);
    digitalWrite(12,HIGH);
    digitalWrite(11,HIGH);
    digitalWrite(10,LOW);
    zpozdeni=150;
    
  break;
  case 6:
  
    digitalWrite(13,HIGH);
    digitalWrite(12,HIGH);
    digitalWrite(11,HIGH);
    digitalWrite(10,HIGH);
    digitalWrite(2,HIGH);
    
  break; 
  
  };

 
}
