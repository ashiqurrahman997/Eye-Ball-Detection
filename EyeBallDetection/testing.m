clear; clc;
I=imread('eye3.jpg'); I=rgb2gray(I);
figure;
R=imread('RIGHT.png');
L=imread('LEFT.png');
U=imread('UP.png');
D=imread('DOWN.png');


subplot(2,2,1); imshow(I); title('Original Image');

%f=im2bw(straight);
%subplot(2,2,2); imshow(f); title('im2bw');
%EyeDetect= vision.CascadeObjectDetector('EyePairBig');

%to detect eyes
EyeDetect= vision.CascadeObjectDetector('RightEyeCART','MergeThreshold',40);

%crop eyes from image
BB= step(EyeDetect, I);

rectangle('Position', BB, 'LineWidth', 2, 'LineStyle', '-', 'EdgeColor', 'r');

Eyes= imcrop(I, BB);
subplot(2,2,2); imshow(Eyes); title('Cropped Eyes');

[row , col]=size(Eyes);

[centers, radii, metric] = imfindcircles(Eyes, [25 50], 'ObjectPolarity','dark', 'Sensitivity', 0.93); 
a=viscircles(centers, radii,'Color','b');




disp(row);
disp(col);

disp(round(centers));



a=round(centers(1));
b=round(col/2);

a1=round(centers(2));
b1=round(row/2);



a=round(centers(1));
b=round(row/2);

disp(round(row/2))
disp(round(col/2));
if(a>b)
    subplot(2,2,3); imshow(R);
    disp("RIGHT");
else subplot(2,2,3); 
      imshow(L)
      disp("LEFT")
end
    
 
if(a1>b1)
    subplot(2,2,4); imshow(U);
    disp(a1);
else subplot(2,2,4); 
      imshow(D)
      disp(b1);
end
    
        
   


