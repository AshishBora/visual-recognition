# Instructions to reporoduce the results


**Start in the ./src/ directory.**


**Prepare the images to be tested:**

1. Create a folder with the template image and all the scene images that you wish to test on.
2. Rename the template image to template.*, where * is any image extension.
3. Make sure that nothing other than image files exist in that directory


**Tell the program where the image are**

1. For matchComparison part: open matchComarison.m in the src direcotry. Edit the path on line number 19 to indicate the image folder path. Then you can simply run the script to get the results

2. Similarly, for detectObject part edit the appropriate path (around line number 19), and run detectObject.m to get the results.



**Note on Results Dump**

By default, all results are stored as image files in the same source image folder. Please retrieve and remove them before running any other part or the same part for the second time, lest the program run on the outputs of the previous parts.