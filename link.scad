od=25; //outer diameter
height=25; //height cylindrical part of link
sr=od*.15; //string radius
ballr=(od/2)*0.98; //radius of ball on top

difference() {
	
	outside();
	inside();
}

showinside();
module showinside() {
	translate([2*od,0,0])
		inside();
}

module outside () {
	translate([0,0,od*.1+height])
		sphere( r = ballr);
	cylinder(h = height, r1 = 1.1*od/2, r2 = 1.1*od/2);
}

module inside() {
	union() {
		cylinder(h = (.5*od), r1 = 0.8*od/2, r2 = 0.8*od/2);
		translate([0,0,(.5*od)])
			cylinder(h = ballr+od*.1+height-0.5*od, r1 = 0.8*od/2, r2 = 0);
		cylinder(h=height+od, r1=sr, r2=sr);
		translate([0,0,od*-.2])
			sphere(r=ballr*1);
	}
}