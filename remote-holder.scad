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




	difference(){
		//additions
		union(){
			//TV Remote box
			translate([0,0,55/2])
			cube(size=[tv_remote_X + gap, tv_remote_Y + gap, 55], center=true);
			//Surround sound Remote
			translate([(tv_remote_X+sound_X+(2*gap))/2, 0, 45/2])
			cube(size=[sound_X + gap, sound_Y + gap, 45], center=true);
		}

		//subtractions
		union(){

		}
	}

}


remoteHolder();