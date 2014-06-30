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

	translate([thickness*2+seatbelt_thickness-thickness/2,-thickness/2,thickness/4+play/2])
		cube([thickness/2,thickness,height-thickness/2-play]) ;

	translate([thickness*2+seatbelt_thickness-thickness/2,length-thickness/2+play,thickness/4])
		cube([thickness/2,thickness,height-thickness/2-play]) ;

//	difference() {
//		cube(30, center = true);
//		sphere(20);
//	}
}

module SeatBeltClip_Bar()
{
	translate([thickness+seatbelt_thickness,0,0])
		difference() {
			translate([0,play,0])
	 			cube([thickness,length-play*2,height]) ;
			translate([thickness/2,0,thickness/4])
				cube([thickness/2,thickness/2+play,height-thickness/2]) ;
			translate([thickness/2,length-thickness/2-play,thickness/4])
				cube([thickness/2,thickness/2+play,height-thickness/2]) ;
		}
}

SeatBeltClip_Bracket();
SeatBeltClip_Bar();

