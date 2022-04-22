
#include "colors.inc"

global_settings
{
    assumed_gamma 1
}

#declare FLAME_COLOR1 = (2*Firebrick+Goldenrod)/3;
#declare FLAME_COLOR2 = (2*Orange+Goldenrod)/3;

camera
{
    location -10*z
    angle 40
    right x*image_width/image_height
}

# declare flame = 
ovus
{
    1, 0.6
    pigment {rgbt 1}
    hollow
    interior
    {
        media
        {
            samples 5
            emission 6
            //scattering {1, White}
            //absorption 4
            density
            {
                spherical scale 2
                translate -1.5*y
                color_map
                {
                    [0 FLAME_COLOR1]
                    [0.25 FLAME_COLOR2/8]
                    [0.30 FLAME_COLOR2/8]
                    [0.40 Black/4]
                    [0.45 Black/10]
                    [0.6 rgb 0]
                }
            }
        }
    }

    scale <0.8, 1.8, 0>
    scale 1/(1.3*1.5)
    rotate <0,0,2>

}