// Original image
base = "G:\\My Drive\\ML\\BreastCancerProject\\data\\Fake2\\";
target = "G:\\My Drive\\ML\\BreastCancerProject\\data\\Fake2_masks\\";
labels = newArray("benign", "normal", "malignant");
print("Array of Labels:")
Array.print(labels);
for(i = 0; i<3; i++){
	print("In i loop");
	my_folder = base + "\\"+labels[i]+"\\";
	my_target_folder = target +"\\"+labels[i]+"\\";
	my_file = my_folder + "img"+i+".png";
	print(my_file);
	run("Bio-Formats Importer", "open=[my_file] autoscale color_mode=Grayscale rois_import=[ROI manager] specify_range view=Hyperstack stack_order=XYCZT c_begin=1 c_end=1 c_step=1");	

	//run("Threshold...");
	setAutoThreshold("Default dark");
	//setThreshold(222, 255);
	setOption("BlackBackground", true);
	run("Convert to Mask");
	target_file = my_target_folder +"mask.png";
	print(target_file);
	saveAs("PNG", target_file);
}
