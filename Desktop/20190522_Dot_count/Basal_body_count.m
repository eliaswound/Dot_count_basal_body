% 1. Load image as matrix 
% 2. Load binary 
% 3. Calculate region area
% --------------------------------------------------------------------------------------------------
% 1.0 load image
[FileName,PathName] = uigetfile({'*.tif';'.tiff';'.ome.tiff'},'Select the input Tag Image file');
cd(PathName);
info=imfinfo(FileName);
image=imread(FileName);
% 1.1 show image and load image and show in 
fig1=figure(2000);clf;
subplot(2,2,1);
imshow(image);
title('Red Raw ');
axis equal;
% 2.1 Calculate binary level intensity
% Using standard deviation as noise, and use mean as signal 
threshhold=input('please input the threshold you want to use(0-255)');
level=threshhold/255;

% 2.2 Create binary image 
bw=im2bw(image,level);
figure(2000);
subplot(2,2,2);
imshow(bw);
title('Red Binary');
axis equal;

%3.0 Calculate region area
s=regionprops(bw,'Area');
bw2=imfill(bw,'holes');
figure(2000);
subplot(2,2,3);
imshow(bw2);
title('Red Binary Filled')
axis equal;
sfill=regionprops(bw,'Area');
a=sum(sum(bw));
b=sum(sum(bw2));
bw3=bw2-bw;
figure(2000)
subplot(2,2,4);
imshow(bw3);
title('holes filled');
axis equal;






%value = input('please input the threshold you want to use(0-255)');
%level=value/255;
%bw=im2bw(image,level);

