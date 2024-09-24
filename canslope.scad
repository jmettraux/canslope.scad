
//
// canslope.scad

// unit is mm

o2 = 0.2;

can_height = 122;
can_diameter = 66;
can_base_diameter = 52;

slope_length = 300;
slope_height = 40;

side_thickness = 4.2;
node_diameter= 14;
axis_diameter= 10;

module node() {
  cylinder(d=node_diameter, h=side_thickness, center=true, $fn=90);
}
module hole() {
  translate([ 0, 0, side_thickness / 2 ])
    cylinder(d=axis_diameter + o2, h=side_thickness, center=true, $fn=180);
}

module side() {
  difference() {
    union() {
      hull() {
        translate([ 0, 0, 0 ]) node();
        translate([ -can_diameter / 2, 0, 0 ]) node();
      }
      hull() {
        translate([ 0, 0, 0 ]) node();
        translate([ 0, slope_length, 0 ]) node();
      }
      hull() {
        translate([ 0, slope_length, 0 ]) node();
        translate([ -slope_height, slope_length, 0 ]) node();
      }
      hull() {
        translate([ -slope_height, slope_length, 0 ]) node();
        translate([ 0, 0, 0 ]) node();
      }
    }
    #translate([ 0, 0, 0 ]) hole();
    #translate([ 0, slope_length * 0.9, 0 ]) hole();
    #translate([ -slope_height * 0.7, slope_length, 0 ]) hole();
  }
}

module tube() {
  cylinder(d=axis_diameter, h=can_height, center=true, $fn=180);
}

//side();
//mirror([ 1, 0, 0 ]) side();
tube();

