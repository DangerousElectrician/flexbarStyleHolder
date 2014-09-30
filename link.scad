od=100; //major diameter
height=100;
sr=15; //string radius

difference() {
	
	outside();
	inside();
}

//showinside();
module showinside() {
	translate([200,0,0])
		inside();
}

ballr=(od/2)*0.98;
module outside () {
	translate([0,0,height*1.1])
		sphere( r = ballr);
	cylinder(h = height, r1 = 1.1*od/2, r2 = 1.1*od/2);
}

module inside() {
	union() {
		translate([0,0,-1])
			cylinder(h = (.5*height)+1, r1 = 0.8*od/2, r2 = 0.8*od/2);
		translate([0,0,(.5*height)])
			cylinder(h = (od/2)*0.98+height, r1 = 0.8*od/2, r2 = 0);
		cylinder(h=height*2, r1=sr, r2=sr);
		translate([0,0,height*-.2])
			sphere(r=ballr*1);
	}
}