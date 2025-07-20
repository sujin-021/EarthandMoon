// Meteors properties
float [] meteor_fx = new float[5]; //origin X positions of meteors
float [] meteor_x = new float[5]; // current X positions of meteors
float [] meteor_y = new float[5]; // current Y positions of meteors
float [] meteor_speed = new float[5]; // speed of each meteor

// meteor tail (shadow arrays for 5 meteors)
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


// stars 
float []star_x = new float[150];
float []star_y = new float[150];
float [] star_alpha = new float[150]; // transparency of stars
float [] star_alpha_speed = new float[150];


// Moon orbit
float angle = 0.0; // angle
float moon_r = 320; // radius
float moon_x = 0; // moon X position
float moon_y = 0; // moon Y position


// images
PImage moon;
PImage earth;



void setup(){
  size(800,800);
  
  // initialize meteor positions and speeds
  for(int i =0; i<meteor_x.length; i++){
    meteor_fx[i]= -400 + i * 200;
    meteor_x[i] = -400 + i * 200;
    meteor_y[i] = -100;
    
    meteor_speed[i] = random(1.5, 3);
  }
  
  // initialize stars with random positions and alpha values
  for(int i =0; i<star_x.length; i++){
    star_x[i] = random(0,800);
    star_y[i] = random(0,800);
    
    star_alpha[i] = random(100, 255);
    star_alpha_speed[i] = random(5, 10); 
  }
  
  // load images
  moon = loadImage("moon.png");
  earth = loadImage("earth.png");
  imageMode(CENTER);
  
}



void draw(){
  background(0);
  
  // twinkling stars
  for(int i =0; i<star_x.length; i++){
    star_alpha[i] += star_alpha_speed[i]; // raise alpha value
    if (star_alpha[i] > 255 || star_alpha[i] < 100) { // reverse direnction when reaching limits
      star_alpha_speed[i] *= -1; 
    }

    fill(255, 255, 255, star_alpha[i]);
    noStroke();
    ellipse(star_x[i], star_y[i], 2, 2); // draw stars
  }
  
  meteor(); // draw Meteors
  moon(); // draw Moon
  earth(); // draw Earth

}


void meteor(){
  for(int i =0; i<meteor_x.length; i++){
        fill(210, 210, 230);
        noStroke();
        ellipse(meteor_x[i], meteor_y[i], 3, 3);
        meteor_y[i] = meteor_x[i]-meteor_fx[i]; // diagonal falling trajectory
        meteor_x[i] += meteor_speed[i];
        if(meteor_x[i] > 800){
          meteor_x[i] = -50; // reset the position if they go out of the screen
        }
  }
  
  
  // meteors tail (move them back)
  for(int i = kage_x1.length-1; i > 0; i--){
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
  
  
  // store current meteor positions at index 0
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
    

  // draw fading trails
  for (int i = 0; i < kage_x1.length; i++) {
    fill(210 - i * 10, 210 - i * 10, 255 - i * 10);
    ellipse(kage_x1[i], kage_y1[i], 3 - i * 0.1, 3 - i * 0.1);
    ellipse(kage_x2[i], kage_y2[i], 3 - i * 0.1, 3 - i * 0.1);
    ellipse(kage_x3[i], kage_y3[i], 3 - i * 0.1, 3 - i * 0.1);
    ellipse(kage_x4[i], kage_y4[i], 3 - i * 0.1, 3 - i * 0.1);
    ellipse(kage_x5[i], kage_y5[i], 3 - i * 0.1, 3 - i * 0.1);
  }
}


void earth(){
  image(earth, 400, 400, 160, 160);
}


void moon(){
  // Circular orbit using angle
  moon_x = moon_r * cos(angle) + 400;
  moon_y = moon_r * sin(angle) + 400;
  angle -= 0.005;
  
  image(moon, moon_x, moon_y, 40, 40);
  
  if(angle < -TWO_PI){
  angle = 0; // reset after full orbit
  }
}
