od=25; //outer diameter
height=25; //height cylindrical part of link

ballr=(od/2)*0.88; //radius of ball on top
sr=od*.13; //string radius

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
	//translate([0,0,od*.1+height])
		//sphere( r = ballr);
	cylinder(h = height, r1 = 1*od/2, r2 = 1*od/2);
	screwblock();
}

module inside() {
	cylinder(h = (.5*od), r1 = 0.8*ballr, r2 = 0.8*ballr);
	translate([0,0,(.5*od)])
		cylinder(h = ballr+od*.1+height-0.5*od, r1 = 0.8*ballr, r2 = 0);
	cylinder(h=height+od*4, r1=sr, r2=sr);
	translate([0,0,ballr*-.36])
	//translate([0,0,od*-.2])
		sphere(r=ballr*1);
}

module screwblock() {
	translate([-(.5*od),-(.5*od),height]) {
		difference() {	
			cube([od,od,od*3]);
			translate([(-1),(.5*od),height/2]) rotate([0,90,0]) cylinder(h=od*2, r=od*.2);
		}
		//translate([(0),(.5*od),height/2]) rotate([0,90,0]) cylinder(h=od, r1=od*.4, r2=od*.4);
	}

}
		