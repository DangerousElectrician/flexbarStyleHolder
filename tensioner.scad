use <link.scad>
use <../Thread_Library.scad>

length=100;
pitch=10;
pitchRadius=20;

od = 25;
height = 25;

translate([60,0,30])screw();
handle();

module cup() {
	translate([0,0,.5*height])
	difference(){
		rotate([180,0,0]) link(od,height);
		translate([-(.5*od),-(.5*od),-2.1*height])cube([od,od,od*1.6]);
	}
}

module handle() {
	translate([0,0,length+height*.5])cup();

	translate([0,0,length]) difference() {
		cylinder(h=height*.5, r1=26, r2=od/2);
		cylinder(h=height*.5,r1=20, r2=0.8*(od/2)*0.88);
	}
	difference() {
	trapezoidNut(length=length,				// axial length of the threaded rod
	radius=30,				// outer radius of the nut
	pitch=10,				// axial distance from crest to crest
	pitchRadius=20,			// radial distance from center to mid-profile
	threadHeightToPitch=0.5,	// ratio between the height of the profile and the pitch
						// std value for Acme or metric lead screw is 0.5
	profileRatio=0.5,			// ratio between the lengths of the raised part of the profile and the pitch
						// std value for Acme or metric lead screw is 0.5
	threadAngle=90,			// angle between the two faces of the thread
						// std value for Acme is 29 or for metric lead screw is 30
	RH=false,				// true/false the thread winds clockwise looking along shaft, i.e.follows the Right Hand Rule
	countersunk=0,			// depth of 45 degree chamfered entries, normalized to pitch
	clearance=.1,			// radial clearance, normalized to thread height
	backlash=0.1,			// axial clearance, normalized to pitch
	stepsPerTurn=24			// number of slices to create per turn
	
		);
	cylinder(h=length,r=18.8); //clear up some artifacts from thread generation
	}
}



module screw() {
	difference() {
		union(){
				trapezoidThread(
				length=length, 			// axial length of the threaded rod 
				pitch=pitch, 			// axial distance from crest to crest
				pitchRadius=pitchRadius, 	// radial distance from center to mid-profile
				threadHeightToPitch=0.5, 	// ratio between the height of the profile and the pitch 
									// std value for Acme or metric lead screw is 0.5
				profileRatio=0.5, 			// ratio between the lengths of the raised part of the profile and the pitch
									// std value for Acme or metric lead screw is 0.5
				threadAngle=90,			// angle between the two faces of the thread 
									// std value for Acme is 29 or for metric lead screw is 30
				RH=false, 				// true/false the thread winds clockwise looking along shaft, i.e.follows the Right Hand Rule
				clearance=-.06, 			// radial clearance, normalized to thread height
				backlash=0.3, 			// axial clearance, normalized to pitch
				stepsPerTurn=24 			// number of slices to create per turn
				);
			translate([-20,-50,-30])cube([40,100,30]); 
	}
	
	translate([0,0,-31])cylinder(h=length*2, r=od*.3);
	}
}