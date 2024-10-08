
//
// canslope.scad

// unit is mm

o2 = 0.2;
$fn = 90;

can_height = 122;
can_diameter = 66;
can_base_diameter = 52;

can_height_two = 116;

slope_length = 300;
slope_height = 30;
x_margin = 3;
//alpha = atan(slope_height / slope_length);

//side_thickness = 4.2;
//node_diameter= 14;
//axis_diameter= 10;

ball_radius = 4.2;
br = ball_radius;
sl2 = slope_length / 2;
ch2 = can_height_two / 2;
sh = slope_height;
//cdi = can_diameter - can_base_diameter;
cdi = 14 - 9;


difference() {

  union() {
    hull() {

      // floor
      translate([ -ch2, +sl2, 0 ]) sphere(r=br);
      translate([ +ch2, +sl2, 0 ]) sphere(r=br);
      translate([ -ch2, -sl2, 0 ]) sphere(r=br);
      translate([ +ch2, -sl2, 0 ]) sphere(r=br);

      // slope
      translate([ -ch2, +sl2, sh ]) sphere(r=br);
      translate([ +ch2, +sl2, sh ]) sphere(r=br);
      translate([ -ch2, -sl2, 0 ]) sphere(r=br);
      translate([ +ch2, -sl2, 0 ]) sphere(r=br);
    }
    hull() {
      cd2 = can_diameter / 3;
      translate([ -ch2, -sl2, 0 ]) sphere(r=br);
      translate([ -ch2, -sl2 * 0.93, 0 ]) sphere(r=br);
      translate([ -ch2, -sl2, cd2 ]) sphere(r=br);
    }
    hull() {
      cd2 = can_diameter / 3;
      translate([ +ch2, -sl2, 0 ]) sphere(r=br);
      translate([ +ch2, -sl2 * 0.93, 0 ]) sphere(r=br);
      translate([ +ch2, -sl2, cd2 ]) sphere(r=br);
    }
    hull() {
      //cd3 = can_diameter / 4.5;
      cd3 = 13.5;
      translate([ -ch2, -sl2, 0 ]) sphere(r=br);
      translate([ -ch2, -sl2, cd3 ]) sphere(r=br);
      translate([ +ch2, -sl2, 0 ]) sphere(r=br);
      translate([ +ch2, -sl2, cd3 ]) sphere(r=br);
    }
    hull() {
      translate([ -ch2, +sl2, 0 ]) sphere(r=br);
      translate([ -ch2, -sl2, 0 ]) sphere(r=br);
      translate([ -ch2, -sl2, cdi ]) sphere(r=br);
      translate([ -ch2, +sl2, sh + cdi ]) sphere(r=br);
    }
    hull() {
      translate([ +ch2, +sl2, 0 ]) sphere(r=br);
      translate([ +ch2, -sl2, 0 ]) sphere(r=br);
      translate([ +ch2, -sl2, cdi ]) sphere(r=br);
      translate([ +ch2, +sl2, sh + cdi ]) sphere(r=br);
    }
  }

  hr = can_height * 0.63;
  dy = 15;
  hh = slope_height * 3;

  translate([ 0, - hr / 2 - dy, 0 ])
    cylinder(d=hr, h=hh, center=true);
  translate([ 0, - hr * 1.5 - dy, 0 ])
    cube([ hr, hr * 2, hh ], center=true);
  translate([ 0, + hr / 2 + dy, 0 ])
    cylinder(d=hr, h=hh, center=true);
  translate([ 0, + hr * 1.5 + dy, 0 ])
    cube([ hr, hr * 2, hh ], center=true);

  tr = can_diameter * 0.56;
    //
  translate([ 0, 0, tr * 1.4 ])
    rotate([ 90, 0, 0 ])
      cylinder(r=tr, h=slope_length * 1.2, center=true);

  ur = can_diameter * 0.9;
    //
  translate([ 0, 0.4 * slope_length, -ur * 0.45 ])
    rotate([ 90, 0, 0 ])
      cylinder(r=ur, h=0.5 * slope_length, center=true);

  //ar = can_diameter * 0.50;
  //  //
  //translate([ 0, slope_length * 0.35, 0 ])
  //  rotate([ 0, 90, 0 ])
  //    cylinder(r=ar, h=can_height * 1.2, center=true);

  xs = 35;
    //
  #translate([ 0, - 0.5 * slope_length + 0.2 * xs, - 0.4 * xs ])
    cube([ can_height * 1.2, xs, xs ], center=true);

  //hside = 200; // halfer side
  //  //
  //translate([ 0, 100, 0 ])
  //  cube([ hside, hside, hside ], center=true);
}


//module can() {
//  rotate([ 0, 90, 0 ]) cylinder(d=can_diameter, h=can_height, center=true);
//}
//cd = can_diameter;
//yy = cd / 6.3;
//#translate([ 0, yy + -2 * cd, cd * 0.70 ]) can();
//#translate([ 0, yy + -1 * cd, cd * 0.85 ]) can();
//#translate([ 0, yy +  0 * cd, cd * 1.00 ]) can();
//#translate([ 0, yy +  1 * cd, cd * 1.15 ]) can();
//#translate([ 0, yy +  2 * cd, cd * 1.30 ]) can();

