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
% alternative way to get level
% level=graythresh(image)
% 2.2 Create binary image 
bw=im2bw(image,level);
figure(2000);
subplot(2,2,2);
imshow(bw);
title('Red Binary');
axis equal;

%3.0 Calculate region area
s=regionprops(bw,'Area');
%alternative fill hole method
%bw2=imfill(bw,'holes');
%figure(2000);
%subplot(2,2,3);
%title('Red Binary Filled')
%axis equal;
%sfill=regionprops(bw,'Area');
%a=sum(sum(bw));
%b=sum(sum(bw2));
%bw3=bw2-bw;
%figure(2000)
%subplot(2,2,4);
%imshow(bw3);
%title('holes filled');
%axis equal;

%get length of the tall vector
sz=sum(size(s))-1;
%assign stuct values into vector 
TotalArea=zeros(1,sz);
for i=1:sz
    TotalArea(1,i)=gather(s(i).Area);
end
threshhold2=input('please input the threshold you want to use(min)');
threshhold3=input('pleas input the threshhold you want to us (max)');
EffectAreaCount=0;
for i=1:sz
    if TotalArea(1,i)>threshhold2 && TotalArea(1,i)<threshhold3
        EffectAreaCount=EffectAreaCount+1;
    end
end
Return EffectAreaCount;
