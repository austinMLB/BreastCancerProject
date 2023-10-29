// Original image
base = "G:\\My Drive\\ML\\BreastCancerProject\\data\\Fake\\";
base2 = "G:\\My Drive\\ML\\BreastCancerProject\\data\\Fake2\\";
labels = newArray("benign", "malignant", "normal");
print("Array of Labels:")
Array.print(labels);
for(i = 0; i<3; i++){
	print("In i loop");
	my_folder = base + "\\";
	my_target_folder = base2 +"\\";
	list = getFileList(my_folder);
	for (j = 0; j < list.length; j++){ 
		print("In j loop");
		run("Bio-Formats Importer", "open=[list[i]] autoscale color_mode=Grayscale rois_import=[ROI manager] specify_range view=Hyperstack stack_order=XYCZT c_begin=1 c_end=1 c_step=1");	
	    run("Duplicate...", "title=Noisy_Image_" + j);
		run("Invert");
		run("Maximum...", "radius=5");
		saveAs("PNG", my_target_folder +"\\img" + j + ".png");
		close();
		close();
	}
}
