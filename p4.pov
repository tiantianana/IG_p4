// PoVRay 3.7 Scene File "Demo_sphere01.pov"
// author:  .Friedrich A. Lohmueller, Jan-2014
// homepage: http://www.f-lohmueller.de/
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

#include "Candle_2.inc"

//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {//perspective angle 45               // front view
                            location  <0.0 , 1.5 ,-4.5>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1 , 0.0>
                            angle 42}
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <2.0 , 2.5 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90  //right side view
                            location  <3.0 , 1.0 , 0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <0.0 , 3.0 ,-0.001>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
camera{Camera_0}
// sun ----------------------------------------------------------------------
// light_source{<-2000,3000,-3000> color White}
// sky ----------------------------------------------------------------------
sky_sphere { pigment { color Black } } //end of skysphere
// ground -------------------------------------------------------------------
plane { <0,1,0>, 0 
    texture { 
        pigment{color Black}
        finish{ reflection 0.1 }
    } 
} // end of plane
     
//---------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//---------------------------------------------------------------------------

// sphere { <0,0,0>, 0.5 
//     texture {  
//         pigment{ 
//             color  rgb< 0.8, 0.0, 0.0>}
//             finish {reflection {0.40 metallic 0.5}}
//     } // end of texture 
//     scale<1,1,1>  rotate<0,0,0>  translate<-0.9,0.5 ,-0.8>  
// }  // end of sphere ----------------------------------- 
   
// sphere { <0,0,0>, 0.35 
//     texture {  
//         pigment{ color  rgb< 1,1,1> }
//         finish { reflection {0.10 metallic }}
//     } // end of texture 
//     scale<1,1,1>  rotate<0,0,0>  translate<0.8,0.35 ,-1>  
// }  // end of sphere ----------------------------------- 


object{ 
    Candle_2( 0.5,  // Shining_On, 0= off, >0 = intensity of candle light 
                0, //  Flame_Shadow, // >0 = intensity ; 0 = off
                0.6,  // Candle_Height, relative to diameter (d=1) 
                1.5,  // Candle_Intensity,  
                0.4   // Candle_Flame_Scale
                5, // Fade_Distance, //  3 ~ 5    
                4 // Fade_Power //   2,3,4
    ) // -------------------------
    rotate<0,0,0>
    translate<-0.8,0,-0.7>  
} 