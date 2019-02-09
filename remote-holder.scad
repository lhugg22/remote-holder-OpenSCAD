//Louis Huggings
//Creating a custom remote holder
//First github integration for backup


//dimensions of the remotes
//tv remote
//top button face
//165mm x 50mm
//bottom qwerty face
//135mm x 37mm
//height 21mm

//Surround sound remote
//top face
//140mm x 41mm
//depth
//16mm


module remoteHolder() {
	//vars
	tv_remote_X = 21;
	tv_remote_Y = 50;
	gap = 5;
	space = 2.5;

	sound_X = 16;
	sound_Y = 41;

	rotateVector = [0, 16, 0];

	rotateTV = [15, 0, 0];
	rotateSound = [-15, 0, 0];


	difference(){
		//additions
		union(){
			//TV Remote box
			rotate(rotateVector) rotate(rotateTV) translate([0,0,75/2 - 13]) 
			cube(size=[tv_remote_X + gap, tv_remote_Y + gap, 75], center=true);
			//Surround sound Remote
			rotate(rotateVector) rotate(rotateSound) translate([(tv_remote_X+sound_X+(2*gap))/2, 0, 55/2 - 5]) 
			cube(size=[sound_X + gap, sound_Y + gap, 55], center=true);

			translate([-3.5,10,36]) rotate([70,-15,-85]) color("DarkGreen") linear_extrude(height=1, center=true, convexity=10, scale=1)
			text("Flix", size=7);

			translate([-5.5,14,26]) rotate([85,5,-90]) color("DarkGreen") linear_extrude(height=3, center=true, convexity=10, scale=1)
			text("Remote", size=10, font="Times New Roman");
		}

		//subtractions
		union(){
			//TV Remote cuttout
			rotate(rotateVector) rotate(rotateTV) translate([0,0,75/2 - 13 + gap]) 
			cube(size=[tv_remote_X + space, tv_remote_Y + space, 75.5], center=true);
			//sound remote cuttout
			rotate(rotateVector) rotate(rotateSound) translate([(tv_remote_X+sound_X+(2*gap))/2,0,55/2 - 5 + gap]) 
			cube(size=[sound_X + space, sound_Y + space, 55.5], center=true);
		}
	}

}

difference(){
	union(){
		translate([0,0,10])remoteHolder();
		translate([9,1,3/2]) cube(size=[63,63,3], center=true);
	}

	translate([0,0,-20/2]) cube(size=[100,100,20], center=true);
}
