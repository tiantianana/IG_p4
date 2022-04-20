// PoVRay 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"

#include "candle.inc"

//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {perspective angle 80              // front view
                            location  <0.0 , 11,-18>
                            right     x*image_width/image_height
                            look_at   <0.0 , 6 , 0>}
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 80  // diagonal view
                            location  <-20, 12,-11>
                            right     x*image_width/image_height
                            look_at   <-1 , 9 , -1>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90  //right side view
                            location  <-4 , 8 , 1>
                            right     x*image_width/image_height
                            look_at   <0 , 8 , 1>}
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 160        // top view
                            location  <0.0 , 10, 0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_4 = camera {/*ultra_wide_angle*/ angle 80  // diagonal view
                            location  <15, 12, -11>
                            right     x*image_width/image_height
                            look_at   <5 , 9 , -1>}

#declare Camera_5 = camera {/*ultra_wide_angle*/ angle 80  // diagonal view
                            location  <-20, 12, 0>
                            right     x*image_width/image_height
                            look_at   <-5 , 9 , -1>}

// camera{Camera_5}
camera {
  location  <6, 15, -50>
  look_at   <0, .8,  0>
  angle 15
} 

// light_source{
//     <-15, 15, 15>
//     color Yellow
//     spotlight
//     radius 12
//     falloff 8
//     tightness 50
//     point_at <0, 5, -8>
// }

// sky ----------------------------------------------------------------------
sky_sphere { pigment { color Black} }

// suelo ----------------------------------------------------------------------
object{
    box { <0,0,0>,< 1.00, 1.00, 1.00>   
    texture { pigment { color Red } }
    scale <20,5,5>
    } 
    translate<0,0,0>
}  

// object {
//     candle
//     scale <5,2,2>
//     translate<-14,5.1,-15>
// }

object {
    candle2
    scale 1
    translate<-14,5.1,-15>
    rotate <0, 40, 0>
}