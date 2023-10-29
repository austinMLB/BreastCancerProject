// Number of new images to generate
nNewImages = 20;

// Original image
base = "G:\\My Drive\\ML\\BreastCancerProject\\data\\Fake\\normal\\img2"
open(base+".png");

for (i = 0; i < nNewImages; i++) {
    // Duplicate the original image
    run("Duplicate...", "title=Noisy_Image_" + i);

    // Add random noise to the new image
    run("Add Noise", "standard=25");

    // Save the new image in PNG format with a unique name
    saveAs("PNG", base + i + ".png");

    // Close the new image
    close();
}
