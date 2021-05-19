# assemblyscreensaver
Assembly cortex m0 picture scrolling

In this homework, you are going to implement a simple screen saver to be displayed on the LCD peripheral
that we have seen in class. LCD is a 320x240 simulated graphics display.
The screen saver application you will write will load an 80x60 image (image file is provided with the project as
a C array) starting at the top left corner of the LCD and will move it diagonally on the screen (with equal
amount of x and y displacements at each iteration). When the image touches the boundary of the screen, it
will bounce back and start moving in the reflected direction (the image should reflect off of all 4 edges of the
LCD). The colors of the image should be correct so you need to swap the R and B components of every pixel
correctly. The screen saver will run forever moving the image around the LCD continuously. Here is an
example picture that shows the behavior:


![image](https://user-images.githubusercontent.com/50769889/118782320-d7a1f580-b842-11eb-81f6-6d48c0d46c4a.png)
