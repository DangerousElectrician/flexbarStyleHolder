$fn=100; ////make things smoother but slows down rendering, uncomment when generating stl

use<link.scad>
od = 25;
height = 25;

difference(){
link(od,height);
translate([-(.5*od),-(.5*od),-2.1*height])cube([od,od,od*3]);
}

translate([-(.5*od),-(.5*od),-2.1*height]) screwblock();
module screwblock() {
	difference() {	
		cube([od,od,od*3]);
		translate([(-1),(.5*od),height/2]) 
			holes();
		
		translate([od/2,od/2,0]) cylinder(r=od*.3,h=height*3);
	}


	module holes() {
		for(z=[0:2]) {
			translate([0,0,z*height]) rotate([0,90,0]) cylinder(h=od*2, r=od*.25);
		}
	}

}
		