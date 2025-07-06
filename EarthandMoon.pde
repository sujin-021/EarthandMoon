float [] meteor_fx = new float[5];
float [] meteor_x = new float[5]; 
float [] meteor_y = new float[5];
float [] meteor_speed = new float[5];

float [] kage_x1 = new float[20];
float [] kage_y1 = new float[20];
float [] kage_x2 = new float[20];
float [] kage_y2 = new float[20];
float [] kage_x3 = new float[20];
float [] kage_y3 = new float[20];
float [] kage_x4 = new float[20];
float [] kage_y4 = new float[20];
float [] kage_x5 = new float[20];
float [] kage_y5 = new float[20];

float []star_x =new float[150];
float []star_y =new float[150];

float [] star_alpha = new float[150];
float [] star_alpha_speed = new float[150];

  float angle =0.0;
  float moon_r = 320;
  float moon_x =0;
  float moon_y =0;

PImage moon;
PImage earth;

void setup(){
  size(800,800);
  for(int i =0; i<meteor_x.length; i++){
    meteor_fx[i]=-400+i*200;
    meteor_x[i] =-400+i*200;
    meteor_y[i] =-100;
    meteor_speed[i] = random(1.5,3);
  }
  
  for(int i =0; i<star_x.length; i++){
    star_x[i] = random(0,800);
    star_y[i] = random(0,800);
    star_alpha[i] = random(100, 255);
    star_alpha_speed[i] = random(5, 10); 
  }
  
  moon=loadImage("moon.png");
  earth=loadImage("earth.png");
  imageMode(CENTER);
  
}


void draw(){
background(0);
  for(int i =0; i<star_x.length; i++){
    star_alpha[i] += star_alpha_speed[i];
    if (star_alpha[i] > 255 || star_alpha[i] < 100) {
      star_alpha_speed[i] *= -1; 
    }

    fill(255, 255, 255, star_alpha[i]);
    noStroke();
    ellipse(star_x[i],star_y[i],2,2);
  }
  meteor();
  moon();
  earth();

}


void meteor(){
  for(int i =0; i<meteor_x.length; i++){
        fill(210,210,230);
        noStroke();
        ellipse(meteor_x[i],meteor_y[i],3,3);
        meteor_y[i]=meteor_x[i]-meteor_fx[i];
        meteor_x[i]+=meteor_speed[i];
        if(meteor_x[i]>800){
          meteor_x[i] =-50;
        }
  }
  
  for(int i =kage_x1.length-1; i>0; i--){
    kage_x1[i] = kage_x1[i-1];
    kage_y1[i] = kage_y1[i-1];
    
    kage_x2[i] = kage_x2[i-1];
    kage_y2[i] = kage_y2[i-1];
    
    kage_x3[i] = kage_x3[i-1];
    kage_y3[i] = kage_y3[i-1];
    
    kage_x4[i] = kage_x4[i-1];
    kage_y4[i] = kage_y4[i-1];
    
    kage_x5[i] = kage_x5[i-1];
    kage_y5[i] = kage_y5[i-1];
  }
  
  
  kage_x1[0]= meteor_x[0];
  kage_y1[0]= meteor_y[0];
  
  kage_x2[0]= meteor_x[1];
  kage_y2[0]= meteor_y[1];
  
  kage_x3[0]= meteor_x[2];
  kage_y3[0]= meteor_y[2];
  
  kage_x4[0]= meteor_x[3];
  kage_y4[0]= meteor_y[3];
  
  kage_x5[0]= meteor_x[4];
  kage_y5[0]= meteor_y[4];
    

  
  for(int i =0; i<kage_x1.length; i++){
    fill(210-i*10,210-i*10,255-i*10);
    ellipse(kage_x1[i],kage_y1[i],3-i*0.1,3-i*0.1);
  }
  
  
  for(int i =0; i<kage_x1.length; i++){
    fill(210-i*10,210-i*10,255-i*10);
    ellipse(kage_x2[i],kage_y2[i],3-i*0.1,3-i*0.1);
  }
  
  
    for(int i =0; i<kage_x1.length; i++){
    fill(210-i*10,210-i*10,255-i*10);
    ellipse(kage_x3[i],kage_y3[i],3-i*0.1,3-i*0.1);
  }
  
  
    for(int i =0; i<kage_x1.length; i++){
    fill(210-i*10,210-i*10,255-i*10);
    ellipse(kage_x4[i],kage_y4[i],3-i*0.1,3-i*0.1);
  }
  
    for(int i =0; i<kage_x1.length; i++){
    fill(210-i*10,210-i*10,255-i*10);
    ellipse(kage_x5[i],kage_y5[i],3-i*0.1,3-i*0.1);
  }
}

void earth(){
  image(earth,400,400,160,160);
}

void moon(){
  
moon_x = moon_r*cos(angle)+400;
moon_y = moon_r*sin(angle)+400;
  angle-=0.005;
  image(moon,moon_x,moon_y,40,40);
  if(angle<-2*PI){
  angle = 0;
  }
}
