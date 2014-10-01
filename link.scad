
//link(25,25);

module link(od, height) {//height cylindrical part of link
//height cylindrical part of link
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
		translate([0,0,od*.1+height])
			sphere( r = ballr);
		cylinder(h = height, r = 1*od/2);
	}
	
	module inside() {
		cylinder(h = (.5*od), r = 0.8*ballr);
		translate([0,0,(.5*od)])
			cylinder(h = ballr+od*.1+height-0.5*od, r1 = 0.8*ballr, r2 = 0);
		translate([0,0,((ballr+od*.1+height-0.5*od)-((ballr+od*.1+height-0.5*od)/(0.8*ballr))*sr)+(.5*od)]) //height of cone - (string radius * height of cone / radius of cone) + distance cone was translated
			cylinder(h=height+od, r=sr);
		translate([0,0,ballr*-.36])
		sphere(r=ballr*1);
	}
}