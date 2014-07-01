//
// Before to proceed, install following library : http://svn.clifford.at/openscad/trunk/libraries/shapes.scad
// Into your .local/share/OpenSCAD/libraries
//
// Don't forget to update your OPENSCADPTAH environment variable
//
//


include  <shapes.scad>

length = 50 ;
height = 15 ;
thickness = 5 ;
seatbelt_thickness = 2 ;
play = 0.5 ;
radius = 1 ;

module SeatBeltClip_Bracket()
{
	translate([thickness/2,(length)/2,height/2])
		intersection(){
			roundedBox([thickness,length+thickness,height],radius);
			rotate([90,0,0])
				roundedBox([thickness,height,length+thickness],radius);
	}

	translate([(thickness*2+seatbelt_thickness)/2,length+thickness/2,height/2]){
		intersection(){		
			roundedBox([thickness*2+seatbelt_thickness,thickness,height],radius);
			rotate([90,0,0])
				roundedBox([thickness*2+seatbelt_thickness,height,thickness],radius);
			rotate([0,90,0])
				roundedBox([height,thickness,thickness*2+seatbelt_thickness],radius);
		}
	}

	translate([(thickness*2+seatbelt_thickness)/2,-thickness/2,height/2]){
		intersection(){		
			roundedBox([thickness*2+seatbelt_thickness,thickness,height],radius);
			rotate([90,0,0])
				roundedBox([thickness*2+seatbelt_thickness,height,thickness],radius);
			rotate([0,90,0])
				roundedBox([height,thickness,thickness*2+seatbelt_thickness],radius);
		}
	}

	translate([thickness*2+seatbelt_thickness-thickness/2,-thickness/2-play/2,thickness/4+play/2])
		cube([thickness/2,thickness,height-thickness/2-play]) ;

	translate([thickness*2+seatbelt_thickness-thickness/2,length-thickness/2+play/2,thickness/4+play/2])
		cube([thickness/2,thickness,height-thickness/2-play]) ;
}

module SeatBeltClip_Bar()
{
	translate([thickness+seatbelt_thickness,0,0])
		difference() {
			translate([thickness/2,(length-play*2)/2+play,height/2])
				rotate([90,0,0])
	 				roundedBox([thickness,height,length-play*2],radius) ;
			translate([thickness/2,0,thickness/4])
				cube([thickness/2,thickness/2+play,height-thickness/2]) ;
			translate([thickness/2,length-thickness/2-play,thickness/4])
				cube([thickness/2,thickness/2+play,height-thickness/2]) ;
		}
}

SeatBeltClip_Bracket();
SeatBeltClip_Bar();

