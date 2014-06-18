length = 50 ;
height = 15 ;
thickness = 5 ;
seatbelt_thickness = 2 ;
play = 0.5 ;
radius = 2 ;

module SeatBeltClip_Bracket()
{
	cube([thickness,length,height]);

	translate([0,length,0])
		cube([thickness*2+seatbelt_thickness,thickness,height]);

	translate([0,-thickness,0])
		cube([thickness*2+seatbelt_thickness,thickness,height]);

	translate([thickness*2+seatbelt_thickness-thickness/2,0,thickness/4+play/2])
		cube([thickness/2,thickness/2,height-thickness/2-play]) ;

	translate([thickness*2+seatbelt_thickness-thickness/2,length-thickness/2+play,thickness/4])
		cube([thickness/2,thickness/2,height-thickness/2-play]) ;

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

