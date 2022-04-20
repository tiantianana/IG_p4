// Persistence of Vision Ray Tracer Scene Description File
// File: candle.pov
// Vers: 3
// Desc: Red burning candle.
// Date: Jun 22 1998
// Auth: Micha Riser (mriser@usa.net)
//       http://www.geocities.com/SiliconValley/Pines/7992/

#include "colors.inc"

#declare candle=
union{

    difference { 
        
        // Exterior
        blob {
            threshold 0.1
            cylinder {
                <2.25,-.03,1.25>,<2.25,2.25,1.25>,0.25,1
                scale<1,0.3,1>
                finish{ambient .3 reflection 0 brilliance 1}
                pigment{color rgb<1,0,0>}
            }
        } 

        // Interior
        sphere {
            <2.25,.8,1.25>,0.185
            pigment{color rgb<0.9,0.8,0.8>
            } 
            scale<1,0.95,1> 
            finish{ambient.5}
        }
    }

    // vela ---
    union{
        cylinder{<2.25,.6,1.25>,<2.25,.77,1.25>,0.01}
        cylinder{<2.25,.755,1.25>,<2.26,.785,1.255>,0.01}
        pigment{Black}
    }

    // llama ---
    sphere { 0, 1
        pigment { color rgbt <0.2, 0, 1, 1> }
        //   halo {
        //     emitting
        //     spherical_mapping
        //     linear
        //     turbulence .3
        //    color_map {
        //       [	0.0001 color rgbt<0.8,.5,.1,.5>]
        //       [ 1 color rgbt <1,1, .3,  0> ]
        //     }
        //    samples 20
        //  translate<0,-.8,0>
        //  }
            hollow
        scale<0.25,1.5,.25>
        scale 0.15
        translate<2.25,.9,1.25>
    }

    //light_source { <2.25,1.05,1.25> rgb<0.9,1,0.6>*.8 }    
}


#declare candle2 = 
union {
    //cup
    cylinder {
        <0,0,0>, <0, 4.75, 0>, 2
        translate <0,0.1,0>
        pigment{color rgb<1,0,0>}
        finish { ambient .4}
        rotate <0, -100, 0> // <x�, y�, z�>
    }

    cylinder {
            <0, 0, 0>, <0, 4.9, 0> 1.7
            pigment {White}
            finish {ambient .4}
    }
    cylinder {
            <0, 0, 0>, <0, 4, 0> 1.8
            pigment {Brown}
            finish {ambient .4}
    }

}

