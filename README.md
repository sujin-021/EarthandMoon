# 🌏 Earth and Moon 🌔

### Overview
This is a Processing-based artwork that simply visualizes the Earth and the Moon orbiting in space, along with dynamic meteor trails and twinkling stars.
You can enjoy a cosmic environment filled with stars and falling meteors, evoking the feeling of a starry night sky.


### Technologies used 
- Java (Processing)


### System Features
- Orbiting moon : The orbit is calculated using trigonometric functions (cos, sin) to simulate a 2D circular path. This demonstrates how orbital motion can be simplified and visualized using basic math in a 2D space.
  
- Meteors with tails : The movement follows a diagonal line (y = -x direction). Trails are implemented using arrays that store previous positions. Each frame, older positions follow the newer ones, creating a fading effect.
  
- Twinkling Stars : Stars are placed randomly using ellipse() with varying opacity (alpha values). Each star’s transparency fluctuates frame-by-frame and reverses direction when reaching min/max limits, creating a twinkling effect enhancing the immersive space atmosphere.


### Preview
[Click and Enjoy!](./demomovie.gif)
> Meteor trails leave soft, glowing stars, while the moon orbits steadily.
