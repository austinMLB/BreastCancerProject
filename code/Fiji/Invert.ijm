// Original image
base = "G:\\My Drive\\ML\\BreastCancerProject\\data\\Fake\\";
base2 = "G:\\My Drive\\ML\\BreastCancerProject\\data\\Fake2\\";
labels = newArray("benign", "malignant", "normal");
print("Array of Labels:")
Array.print(labels);
for(i = 0; i<3; i++){
	print("In i loop");
	my_folder = base +labels[i]+"\\";
	my_target_folder = base2 +labels[i]+"\\";
	list = getFileList(my_folder);
	for (j = 0; j < list.length; j++){ 
		print("In j loop of "+list.length);
		my_name = my_folder+list[j];
		print(my_name);
		my_ingest = "open=["+my_name+"] autoscale color_mode=Grayscale rois_import=[ROI manager] specify_range view=Hyperstack stack_order=XYCZT c_begin=1 c_end=1 c_step=1";
		run("Bio-Formats Importer", my_ingest);	
	    run("Duplicate...", "title=Inverted_Image_" + j);
		run("Invert");
		run("Maximum...", "radius=5");
		//saveAs("PNG", my_target_folder +"\\img" + j + ".png");
		saveAs("PNG", my_target_folder +list[j]);
		close();
		close();
	}
}
