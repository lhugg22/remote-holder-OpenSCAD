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
	gap = 3;

	sound_X = 16;
	sound_Y = 41;

	rotateVector = [0, 20, 0];

	rotateTV = [15, 0, 0];
	rotateSound = [-15, 0, 0];


	difference(){
		//additions
		union(){
			//TV Remote box
			rotate(rotateVector) rotate(rotateTV) translate([0,0,65/2 - 13]) 
			cube(size=[tv_remote_X + gap, tv_remote_Y + gap, 65], center=true);
			//Surround sound Remote
			rotate(rotateVector) rotate(rotateSound) translate([(tv_remote_X+sound_X+(2*gap))/2, 0, 55/2 - 5]) 
			cube(size=[sound_X + gap, sound_Y + gap, 55], center=true);
			//rounding the corners for tv remote holder
			rotate(rotateVector) rotate(rotateTV) translate([(tv_remote_X)/2, (tv_remote_Y)/2, 65/2 - 13]) 
			cylinder(h=65, r=2.5, center=true, $fn=50);
			rotate(rotateVector) rotate(rotateTV) translate([-(tv_remote_X)/2, (tv_remote_Y)/2, 65/2 - 13]) 
			cylinder(h=65, r=2.5, center=true, $fn=50);
			rotate(rotateVector) rotate(rotateTV) translate([-(tv_remote_X)/2, -(tv_remote_Y)/2, 65/2 - 13]) 
			cylinder(h=65, r=2.5, center=true, $fn=50);
			rotate(rotateVector) rotate(rotateTV) translate([(tv_remote_X)/2, -(tv_remote_Y)/2, 65/2 - 13]) 
			cylinder(h=65, r=2.5, center=true, $fn=50);
			//rounding the corners for the sound remote
			rotate(rotateVector) rotate(rotateSound) translate([sound_X+gap+(tv_remote_X+gap)/2,(sound_Y)/2, 55/2 - 5]) 
			cylinder(h=55, r=2.5, center=true, $fn=50);
			rotate(rotateVector) rotate(rotateSound) translate([sound_X+gap+(tv_remote_X+gap)/2,-(sound_Y)/2, 55/2 - 5]) 
			cylinder(h=55, r=2.5, center=true, $fn=50);
			rotate(rotateVector) rotate(rotateSound) translate([(tv_remote_X+gap)/2,(sound_Y)/2, 55/2 - 5]) 
			cylinder(h=55, r=2.5, center=true, $fn=50);
			rotate(rotateVector) rotate(rotateSound) translate([(tv_remote_X+gap)/2,-(sound_Y)/2, 55/2 - 5]) 
			cylinder(h=55, r=2.5, center=true, $fn=50);
		}

		//subtractions
		union(){
			//TV Remote cuttout
			rotate(rotateVector) rotate(rotateTV) translate([0,0,65/2 - 13 + gap]) 
			cube(size=[tv_remote_X, tv_remote_Y, 65.5], center=true);
			//sound remote cuttout
			rotate(rotateVector) rotate(rotateSound) translate([(tv_remote_X+sound_X+(2*gap))/2,0,55/2 - 5 + gap]) 
			cube(size=[sound_X, sound_Y, 55.5], center=true);
		}
	}

}

difference(){
	union(){
		translate([0,0,10])remoteHolder();
		translate([5,0,3/2]) cube(size=[58,58,3], center=true);
	}

	translate([0,0,-20/2]) cube(size=[100,100,20], center=true);
}
