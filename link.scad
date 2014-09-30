od=100; //outer diameter
height=100; //height cylindrical part of link
sr=od*.15; //string radius
ballr=(od/2)*0.98; //radius of ball on top

difference() {
	
	outside();
	inside();
}

//showinside();
module showinside() {
	translate([2*od,0,0])
		inside();
}

module outside () {
	translate([0,0,height*1.1])
		sphere( r = ballr);
	cylinder(h = height, r1 = 1.1*od/2, r2 = 1.1*od/2);
}

module inside() {
	union() {
		cylinder(h = (.5*height), r1 = 0.8*od/2, r2 = 0.8*od/2);
		translate([0,0,(.5*height)])
			cylinder(h = (od/2)*0.98+height, r1 = 0.8*od/2, r2 = 0);
		cylinder(h=height*2, r1=sr, r2=sr);
		translate([0,0,height*-.2])
			sphere(r=ballr*1);
	}
}