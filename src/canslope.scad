
//
// canslope.scad

// unit is mm

o2 = 0.2;
$fn = 90;

can_height = 122;
can_diameter = 66;
can_base_diameter = 52;

slope_length = 300;
slope_height = 40;
x_margin = 3;
alpha = atan(slope_height / slope_length);

//side_thickness = 4.2;
//node_diameter= 14;
//axis_diameter= 10;

ball_radius = 5;
br = ball_radius;
sl2 = slope_length / 2;
ch2 = can_height / 2;
sh = slope_height;
cdi = can_diameter - can_base_diameter;


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
      cd2 = can_diameter / 2;
      translate([ -ch2, -sl2, 0 ]) sphere(r=br);
      translate([ +ch2, -sl2, 0 ]) sphere(r=br);
      translate([ -ch2, -sl2, cd2 ]) sphere(r=br);
      translate([ +ch2, -sl2, cd2 ]) sphere(r=br);
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

  hr = can_height * 0.84;
  dy = 10;
  hh = slope_height * 3;

  translate([ 0, - hr / 2 - dy, 0 ])
    cylinder(d=hr, h=hh, center=true);
  translate([ 0, - hr - dy, 0 ])
    cube([ hr, hr, hh ], center=true);
  translate([ 0, + hr / 2 + dy, 0 ])
    cylinder(d=hr, h=hh, center=true);
  translate([ 0, + hr + dy, 0 ])
    cube([ hr, hr, hh ], center=true);

  tr = can_diameter * 0.84;
    //
  translate([ 0, 0, tr ])
    rotate([ 90, 0, 0 ])
      cylinder(r=tr, h=slope_length * 1.2, center=true);

  ar = can_diameter * 0.56;
    //
  translate([ 0, slope_length * 0.35, 0 ])
    rotate([ 0, 90, 0 ])
      cylinder(r=ar, h=can_height * 1.2, center=true);

  //hside = 200; // halfer side
  //  //
  //#translate([ 0, 100, 0 ])
  //  cube([ hside, hside, hside ], center=true);
}

