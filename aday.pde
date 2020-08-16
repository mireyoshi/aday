int direction = 1;
float speed = 8;
float x1 = 50;
float x2 = 500;
float y = -100;
PVector location;
PVector velocity;
PVector acceleration;
int star = 50;
int cm = 255;


void setup(){
  size(750,600);
  frameRate(30);
  noStroke();
  location = new PVector(x2,y);
  velocity= new PVector(0,0);
  acceleration = new PVector(-0.25,0.25);
}

void draw(){
  if(frameCount/cm%2==0){
    background(180-frameCount%cm,cm-frameCount%cm,cm-frameCount%cm);
    
  }
  else if(frameCount/cm%2!=0){
    background(-75+frameCount%cm,frameCount%cm,frameCount%cm);
  }
  
  PImage img1 = loadImage("walkwomen1.png");
  PImage img2 = loadImage("walkwomen2.png");
  PImage img3 = loadImage("cloud.png");
  PImage img4 = loadImage("star.png");


//bottom
  pushMatrix();
  translate(width/2,height);
  rotate(radians(frameCount));

//bottom-buildings
  for(int i=0; i<10 ;i++){
    fill(195*i%cm,125*i%cm,180*i%cm);
    pushMatrix();
    pushStyle();
    rotate(radians(i*36));
    rect(170,-20,150,40);
    fill(253,250,165);
    rect(250,-10,40,20);
    popMatrix();
    popStyle();
    
    pushMatrix();
    pushStyle();
    rotate(radians(i*60));
    rect(170,-40,100,80);
    fill(253,250,165);
    rect(230,-30,20,20);
    rect(230,10,20,20);
    rect(200,-30,20,20);
    rect(200,10,20,20);
    popMatrix();
    popStyle();
    
    pushMatrix();
    pushStyle();
    rotate(radians(i*120));
    triangle(200,-45,200,45,240,0);
    fill(253,250,165);
    rect(170,-25,30,50);
    popMatrix();
    popStyle();
  }

//bottom-ground
  fill(187,94,0);
  ellipse(0,0,350,350);
  popMatrix();

//uppper
  pushMatrix();
  translate(width/2,0);
  rotate(radians(frameCount/1.417));
  
//upper-sun
  fill(255,137,6);
  ellipse(0,200,100,100);
  pushMatrix();
  translate(0,200);
  for(int i=0;i<10;i++){
    rotate(120);
    triangle(60,-20,60,20,85,0);
  }
  popMatrix();

//upper-moon
  fill(255,255,0);
  ellipse(0,-200,100,100);
  if(frameCount/cm%2==0){
    fill(180-frameCount%cm,cm-frameCount%cm,cm-frameCount%cm);
  }
  else if(frameCount/255%2!=0){
    fill(-75+frameCount%cm,frameCount%cm,frameCount%cm);
  }
  arc(50,-200,130,100,HALF_PI,PI+HALF_PI,CHORD);
  popMatrix();

//human
  if(frameCount/10%2==0){
    image(img1,250,360,200,150);
  }else{
    image(img2,200,360,200,150);
  }
  
//cloud.star
  if(frameCount/1.417%360<90||frameCount/1.417%360>270){

    x1 += speed*direction;
    x2 += speed/2*-direction;
    
    if(x1>width-250||(x1<50)){
      direction *= -1;
    }
    if(direction==1){
      image(img3,x1,50,200,100);
      image(img3,x2,150,200,100);
    }
    else{
      image(img3,x1,50,200,100);
      image(img3,x2,150,200,100);
    }
  }
  else if(frameCount/1.417%360>90||frameCount/1.417%360<270){
    float a = random(10,50);
    image(img4,random(50,750),random(10,300),a,a);
    image(img4,location.x,location.y,star,star);
    image(img4,location.x+500,location.y-500,star,star);
    image(img4,location.x+1000,location.y-750,star,star);
    velocity.add(acceleration);
    location.add(velocity);
    if(location.x+1000<0){
      location.x = x2;
      location.y = y;
      velocity.x = 0;
      velocity.y = 0;
    }
  }
}
