od=25; //outer diameter
height=25; //height cylindrical part of link

ballr=(od/2)*0.88; //radius of ball on top
sr=od*.13; //string radius

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
	cylinder(h = height, r1 = 1*od/2, r2 = 1*od/2);
	translate([-(.5*od),-(.5*od),height]) screwblock();
}

module inside() {
	cylinder(h = (.5*od), r1 = 0.8*ballr, r2 = 0.8*ballr);
	translate([0,0,(.5*od)])
		cylinder(h = ballr+od*.1+height-0.5*od, r1 = 0.8*ballr, r2 = 0);
	translate([0,0,ballr*-.36])
		sphere(r=ballr*1);
	translate([0,0,((ballr+od*.1+height-0.5*od)-((ballr+od*.1+height-0.5*od)/(0.8*ballr))*sr)+(.5*od)]) //height of cone - (string radius * height of cone / radius of cone) + distance cone was translated
		cylinder(h=height+od*4, r=sr*1.8);
}

module screwblock() {
	difference() {	
		cube([od,od,od*3]);
		translate([(-1),(.5*od),height/2]) holes();
	}

	module holes() {
		for(z=[0:2]) {
			translate([0,0,z*height]) rotate([0,90,0]) cylinder(h=od*2, r=od*.2);
		}
	}

}
		