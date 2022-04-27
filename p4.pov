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
#declare Camera_Number = 3 ;
//-------------------------------------------------------------------------------------------------------<<<<
//------------------------------------------------------------- Camera_Position, Camera_look_at, Camera_Angle
#switch ( Camera_Number )
#case (0)
  #declare Camera_Position = < 0.00, 1.00, -5.00> ;  // front view
  #declare Camera_Look_At  = < 0.00, 1.00,  0.00> ;
  #declare Camera_Angle    =  65 ;
#break
#case (1)
  #declare Camera_Position = < 5.00, 5.00, -5.00> ;  // front view
  #declare Camera_Look_At  = < 0.00, 1.00,  0.00> ;
  #declare Camera_Angle    =  45 ;
#break
#case (2)
  #declare Camera_Position = < 5.00, 1.85, 15.00> ;  // front view
  #declare Camera_Look_At  = < 0.00, 1.2,  0.00> ;
  #declare Camera_Angle    =  45 ;
#break
#else
  #declare Camera_Position = < 1.50, 1.85, -4.00> ;// front view
  #declare Camera_Look_At  = < 1.00, 1.2,  0.00> ;
  #declare Camera_Angle    =  40 ;
#break
#end // of "#switch ( Camera_Number )" -----------------------------
//---------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------<<<<
camera { location Camera_Position
        right    x*image_width/image_height
        angle    Camera_Angle
        look_at  Camera_Look_At
}

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
     
light_source{ <2,20,-2.5> color White}

//---------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//---------------------------------------------------------------------------

#declare Candle_Texture_Cooper = 
texture  {
    pigment { 
        image_map  {
            jpeg "assets/cooper.jpeg"
            map_type 2
        }
    }
    finish { reflection {0.45}}
}

#declare Candle_Texture_Silver = 
texture  {
    pigment { 
        image_map  {
            jpeg "assets/silver.jpeg"
            map_type 2
        }
    }
    finish { reflection {0.45}}
}
#declare Candle_Texture_Gold = 
texture  {
    pigment { 
        image_map  {
            jpeg "assets/gold.jpeg"
            map_type 2
        }
    }
    finish { reflection {0.5}}
}

# declare candle1 = 
object{ 
    Candle_2( 0.05,  // Shining_On, 0= off, >0 = intensity of candle light 
                0.6,  // Candle_Height, relative to diameter (d=1) 
                0.3   // Candle_Flame_Scale
                5, // Fade_Distance, //  3 ~ 5    
                4, // Fade_Power //   2,3,4
                Candle_Texture_Cooper
    ) // -------------------------
    translate <0,0,0>  
} 

#declare candle2 = 
object{ 
    Candle_2( 0.05,  // Shining_On, 0= off, >0 = intensity of candle light 
                0.6,  // Candle_Height, relative to diameter (d=1) 
                0.25   // Candle_Flame_Scale
                5, // Fade_Distance, //  3 ~ 5    
                4, // Fade_Power //   2,3,4
                Candle_Texture_Silver
    ) // -------------------------
    translate <1.2,0,0.5>  
} 

#declare candle3 = 
object{ 
    Candle_2( 0.05,  // Shining_On, 0= off, >0 = intensity of candle light 
                0.65,  // Candle_Height, relative to diameter (d=1) 
                0.21,   // Candle_Flame_Scale
                5, // Fade_Distance, //  3 ~ 5    
                4, // Fade_Power //   2,3,4
                Candle_Texture_Gold
    ) // -------------------------
    translate<0.25,0,1.2>  
} 

union {
    object {
        candle1
    }
    object {
        candle2
    }
    object {
        candle3
    }
    scale <1.25, 1.5,1.25>
    translate<0.2, 0, 0.7>  
}

cylinder{ <0,0,0>,<0,2,0>,0.2 
    texture{ 
        pigment{ color White }
        finish { ambient 0.8 diffuse 0.2 phong 1 }
    } // end of texture
    scale <20,5,1> rotate<0,100,0> translate<6,0,-3>
} // end of cylinder  ----------------------------------

cylinder{ <0,0,0>,<0,2,0>,0.2 
    texture{ 
        pigment { color (2*Orange+Goldenrod)/4 }
        finish { ambient 0.8 diffuse 0.2 phong 1 } }
    scale <40,5,1> rotate<0,100,0> translate<-8,0,-1.25>
} // end of cylinder  ------------------------------------
