// POV-Ray 3.6/3.7  include file "Candle_2.inc"                                                                                                                                 // author: Friedrich A, Lohmueller, Aug-2009
// homepage: http://www.f-lohmueller.de/
// email: Friedrich.Lohmueller_aT_t-online.de
// modified version of "Candle_1.inc" 
// with some improvements by Thierry Banel 

#include "flame.inc"
#include "shapes.inc"     

#macro Candle_2 ( Shining__On,  // Light on 
				  C__Height,    // Candle_Height,   
				  C__Scale,      // Candle_Flame_Scale
				  Fade_Distance, //  3 ~ 5    
				  Fade_Power //   2,3,4
				  Candle_Texture
				) // -----------------------------------------
// -----------------------------------------------------------

#declare Candle_Wax_Liquid_Texture = 
	texture{ 
		pigment{ color White }
				//normal { bumps 0.15 scale <0.05,0.1,0.05>*2} 
				//finish { reflection {0.2}}
		} // end texture

#local C__Candle =

union{ 
	difference{
		
		union{ 

			cylinder { <0,0.04,0>, <0,C__Height,0>, 0.5 }
			cylinder { <0,0,0>, <0,0.04,0>, 0.47 }

			// object{
				// Round_Cylinder(<0,0.,0>, <0,C__Height+0.02,0>, 0.5, 0.02, 0)
				// texture { Candle_Texture }
			// } 
			// object{
				// Round_Cylinder(<0,0,0>, <0,0.02,0>, 0.48, 0.05, 0)
				// texture { pigment { color White } }
			// }  

			texture { Candle_Texture }
		}

		sphere{
			<0,0,0>,0.465 scale<1,0.5,1> translate<0,C__Height+0.05,0>
			texture { Candle_Texture } 
		}
		
	} // end difference

	// Cera	
	cylinder { <0,0,0>,<0,C__Height-0.02,0>,0.45 
				texture{ Candle_Wax_Liquid_Texture    } 
	}
	// wick - Docht 

	// Palo vela
	union{ 
		cylinder{<0,-0.05,0>,<0,0.1,0>,0.1-C__Scale/5 pigment{rgb 1}}
		cylinder{<0, 0.1,0>,<0,0.3,0>,0.1-C__Scale/5 pigment{rgb 0}}
		scale C__Scale
		translate<0,C__Height-0.05,0>
	} // end wick

} // end C__Candle


union{ 

  object{C__Candle}

  // Flame
  object { 
	flame translate<0,0.5,0> scale 0.75
	scale C__Scale  translate <0,C__Height+C__Scale/5,0> 
  }
  
  // Shining of the flame
  #if(Shining__On>0)
  light_source { <0,0,0>          
				color rgb <0.8, 0.3, 0.0>*0.5*Shining__On   
				area_light            // kind of light source (Art der Lichtquelle)
				<-0.25, -0.25, 0> <0.25, 0.5, 0> // lights spread out across this distance (x * z)
				4, 15                // total number of lights in grid (4x*4z = 16 lights)
				adaptive 1          // 0,1,2,3...
				//jitter              // adds random softening of light
				translate<0,C__Height+0.25+0.350,0>
	fade_distance Fade_Distance  // 3
	fade_power Fade_Power // 4
			  } //---------------- end of area_light 

  light_source { <0,0,0>          
				color rgb <0.8, 0.3, 0.0>*0.5*Shining__On   
				area_light            // kind of light source (Art der Lichtquelle)
				<0, -0.25,-0.25> <0, 0.5, 0.25> // lights spread out across this distance (x * z)
				4, 15                // total number of lights in grid (4x*4z = 16 lights)
				adaptive 1          // 0,1,2,3...
				//jitter              // adds random softening of light
				translate<0,C__Height+0.25+0.350,0>
	fade_distance  Fade_Distance  // 3
	fade_power Fade_Power // 4
  } //---------------- end of area_light 
  #end // of "#if(Shining__On>0)"


}// end union
// ----------------------------------------------------------------------------------
#end// of macro ------------------------------------------------------// end of macro
