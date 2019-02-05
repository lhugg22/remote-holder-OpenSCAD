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


module remoteHolder() {
	//vars
	tv_remote_X = 21;
	tv_remote_Y = 50;
	gap = 3;




	difference(){
		//additions
		union(){
			cube(size=[tv_remote_X + gap, tv_remote_Y + gap, 55], center=true);
		}

		//subtractions
		union(){

		}
	}

}


remoteHolder();