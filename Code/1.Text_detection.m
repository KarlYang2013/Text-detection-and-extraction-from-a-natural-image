I=imread('102.jpg');
figure,imtool(I);title('Original Image');
[row,column,numberofchannel]=size(I);
level = graythresh(I);
BW = im2bw(I, level);
% figure,imtool(BW);title('Binary Image');
div=0;
m = [0 0 0; 0 0 0; 0 0 0];
c=[0 0 0;0 0 0;0 0 0];
global p1 p2 p3 p4 p5 p6 p7 p8;
for k=1:1:1
for i=1:1:row
   for j=1:1:column
       p=impixel(I,i,j);
           fprintf('\ni= %f',i);
           fprintf('\tj= %f',j);
        p
        if (i~=1)&&(i~=row)&&(j~=1)&&(j~=column)
                p1=impixel(I,i-1,j-1);
                p2=impixel(I,i-1,j);
                p3=impixel(I,i-1,j+1);
                p4=impixel(I,i,j-1);
                p5=impixel(I,i,j+1);
                p6=impixel(I,i+1,j-1);
                p7=impixel(I,i+1,j);
                p8=impixel(I,i+1,j+1);
            d1= (abs((p(1)-p1(1)))+abs((p(2)-p1(2)))+abs((p(3)-p1(3))))/(3*255);
            d2= (abs((p(1)-p2(1)))+abs((p(2)-p2(2)))+abs((p(3)-p2(3))))/(3*255);
            d3= (abs((p(1)-p3(1)))+abs((p(2)-p3(2)))+abs((p(3)-p3(3))))/(3*255);
            d4= (abs((p(1)-p4(1)))+abs((p(2)-p4(2)))+abs((p(3)-p4(3))))/(3*255);
            d5= (abs((p(1)-p5(1)))+abs((p(2)-p5(2)))+abs((p(3)-p5(3))))/(3*255);
            d6= (abs((p(1)-p6(1)))+abs((p(2)-p6(2)))+abs((p(3)-p6(3))))/(3*255);
            d7= (abs((p(1)-p7(1)))+abs((p(2)-p7(2)))+abs((p(3)-p7(3))))/(3*255);
            d8= (abs((p(1)-p8(1)))+abs((p(2)-p8(2)))+abs((p(3)-p8(3))))/(3*255);
            c1=(1-d1)^10;
            c2=(1-d2)^10;
            c3=(1-d3)^10;
            c4=(1-d4)^10;
            c5=(1-d5)^10;
            c6=(1-d6)^10;
            c7=(1-d7)^10;
            c8=(1-d8)^10;
            m=[c1 c2 c3; c4 0 c5; c6 c7 c8];
            div=1/sum(sum(m));
            m=div*m;
            p1=p1*m(1,1);
            p2=p2*m(1,2);
            p3=p3*m(1,3);
            p4=p4*m(2,1);
            p5=p5*m(2,3);
            p6=p6*m(3,1);
            p7=p7*m(3,2);
            p8=p8*m(3,3);
            p(1)=p1(1)+p2(1)+p3(1)+p4(1)+p5(1)+p6(1)+p7(1)+p8(1);
            p(2)=p1(2)+p2(2)+p3(2)+p4(2)+p5(2)+p6(2)+p7(2)+p8(2);
            p(3)=p1(3)+p2(3)+p3(3)+p4(3)+p5(3)+p6(3)+p7(3)+p8(3); 
             p
        elseif (i==1) && (j==1)
%             only three will be there for the first pixel
            p5=impixel(I,i,j+1);
            p7=impixel(I,i+1,j);
            p8=impixel(I,i+1,j+1);
            d5= (abs((p(1)-p5(1)))+abs((p(2)-p5(2)))+abs((p(3)-p5(3))))/(3*255);
            d7= (abs((p(1)-p7(1)))+abs((p(2)-p7(2)))+abs((p(3)-p7(3))))/(3*255);
            d8= (abs((p(1)-p8(1)))+abs((p(2)-p8(2)))+abs((p(3)-p8(3))))/(3*255);
            c5=(1-d5)^10;
            c7=(1-d7)^10;
            c8=(1-d8)^10;
            m=[0 0 0; 0 0 c5; 0 c7 c8];
            div=1/sum(sum(m));
            m=div*m;
            p5=p5*m(2,3);
            p7=p7*m(3,2);
            p8=p8*m(3,3);
            p(1)=p5(1)+p7(1)+p8(1);
            p(2)=p5(2)+p7(2)+p8(2);
            p(3)=p5(3)+p7(3)+p8(3); 
             p
        elseif (i==1) && (j~=column)
%                 first row pixel but not the first column pixel
                p4=impixel(I,i,j-1);
                p5=impixel(I,i,j+1);
                p6=impixel(I,i+1,j-1);
                p7=impixel(I,i+1,j);
                p8=impixel(I,i+1,j+1);
            d4= (abs((p(1)-p4(1)))+abs((p(2)-p4(2)))+abs((p(3)-p4(3))))/(3*255);
            d5= (abs((p(1)-p5(1)))+abs((p(2)-p5(2)))+abs((p(3)-p5(3))))/(3*255);
            d6= (abs((p(1)-p6(1)))+abs((p(2)-p6(2)))+abs((p(3)-p6(3))))/(3*255);
            d7= (abs((p(1)-p7(1)))+abs((p(2)-p7(2)))+abs((p(3)-p7(3))))/(3*255);
            d8= (abs((p(1)-p8(1)))+abs((p(2)-p8(2)))+abs((p(3)-p8(3))))/(3*255);
            c4=(1-d4)^10;
            c5=(1-d5)^10;
            c6=(1-d6)^10;
            c7=(1-d7)^10;
            c8=(1-d8)^10;
            m=[0 0 0; c4 0 c5; c6 c7 c8];
            div=1/sum(sum(m));
            m=div*m;
            p4=p4*m(2,1);
            p5=p5*m(2,3);
            p6=p6*m(3,1);
            p7=p7*m(3,2);
            p8=p8*m(3,3);
            p(1)=p4(1)+p5(1)+p6(1)+p7(1)+p8(1);
            p(2)=p4(2)+p5(2)+p6(2)+p7(2)+p8(2);
            p(3)=p4(3)+p5(3)+p6(3)+p7(3)+p8(3);
            p
        elseif (i==1) && (j==column)
%                 first row and last column pixel
                p4=impixel(I,i,j-1);
                p6=impixel(I,i+1,j-1);
                p7=impixel(I,i+1,j);
            d4= (abs((p(1)-p4(1)))+abs((p(2)-p4(2)))+abs((p(3)-p4(3))))/(3*255);
            d6= (abs((p(1)-p6(1)))+abs((p(2)-p6(2)))+abs((p(3)-p6(3))))/(3*255);
            d7= (abs((p(1)-p7(1)))+abs((p(2)-p7(2)))+abs((p(3)-p7(3))))/(3*255);
            c4=(1-d4)^10;
            c6=(1-d6)^10;
            c7=(1-d7)^10;
            m=[0 0 0; c4 0 0; c6 c7 0];
            div=1/sum(sum(m));
            m=div*m;  
            p4=p4*m(2,1);
            p6=p6*m(3,1);
            p7=p7*m(3,2);
            p(1)=p4(1)+p6(1)+p7(1);
            p(2)=p4(2)+p6(2)+p7(2);
            p(3)=p4(3)+p6(3)+p7(3);
            p
        elseif (i~=1)&&(i~=row)&&(j==1)
%                 fist column but not the first row plus not the last row
                   p2=impixel(I,i-1,j);
                   p3=impixel(I,i-1,j+1);
                   p5=impixel(I,i,j+1);
                   p7=impixel(I,i+1,j);
                   p8=impixel(I,i+1,j+1);
            d2= (abs((p(1)-p2(1)))+abs((p(2)-p2(2)))+abs((p(3)-p2(3))))/(3*255);
            d3= (abs((p(1)-p3(1)))+abs((p(2)-p3(2)))+abs((p(3)-p3(3))))/(3*255);
            d5= (abs((p(1)-p5(1)))+abs((p(2)-p5(2)))+abs((p(3)-p5(3))))/(3*255);
            d7= (abs((p(1)-p7(1)))+abs((p(2)-p7(2)))+abs((p(3)-p7(3))))/(3*255);
            d8= (abs((p(1)-p8(1)))+abs((p(2)-p8(2)))+abs((p(3)-p8(3))))/(3*255);
            c2=(1-d2)^10;
            c3=(1-d3)^10;
            c5=(1-d5)^10;
            c7=(1-d7)^10;
            c8=(1-d8)^10;
            m=[0 c2 c3; 0 0 c5; 0 c7 c8];
            div=1/sum(sum(m));
            m=div*m;
            p2=p2*m(1,2);
            p3=p3*m(1,3);
            p5=p5*m(2,3);
            p7=p7*m(3,2);
            p8=p8*m(3,3);
            p(1)=p2(1)+p3(1)+p5(1)+p7(1)+p8(1);
            p(2)=p2(2)+p3(2)+p5(2)+p7(2)+p8(2);
            p(3)=p2(3)+p3(3)+p5(3)+p7(3)+p8(3);
            p
        elseif (i~=1) && (i~=row)&& (j==column)
%                 last column pixel
                   p1=impixel(I,i-1,j-1);
                   p2=impixel(I,i-1,j);
                   p4=impixel(I,i,j-1);
                   p6=impixel(I,i+1,j-1);
                   p7=impixel(I,i+1,j);
            d1= (abs((p(1)-p1(1)))+abs((p(2)-p1(2)))+abs((p(3)-p1(3))))/(3*255);
            d2= (abs((p(1)-p2(1)))+abs((p(2)-p2(2)))+abs((p(3)-p2(3))))/(3*255);
            d4= (abs((p(1)-p4(1)))+abs((p(2)-p4(2)))+abs((p(3)-p4(3))))/(3*255);
            d6= (abs((p(1)-p6(1)))+abs((p(2)-p6(2)))+abs((p(3)-p6(3))))/(3*255);
            d7= (abs((p(1)-p7(1)))+abs((p(2)-p7(2)))+abs((p(3)-p7(3))))/(3*255);
            c1=(1-d4)^10;
            c2=(1-d5)^10;
            c4=(1-d6)^10;
            c6=(1-d7)^10;
            c7=(1-d8)^10;
            m=[c1 c2 0; c4 0 0; c6 c7 0];
            div=1/sum(sum(m));
            m=div*m;
            p1=p1*m(1,1);
            p2=p2*m(1,2);
            p4=p4*m(2,1);
            p6=p6*m(3,1);
            p7=p7*m(3,2);
            p(1)=p1(1)+p2(1)+p4(1)+p6(1)+p7(1);
            p(2)=p1(2)+p2(2)+p4(2)+p6(2)+p7(2);
            p(3)=p1(3)+p2(3)+p4(3)+p6(3)+p7(3);
            p
        elseif(i==row) && (j==1)
%                     last row and first column pixel
                       p2=impixel(I,i-1,j);
                       p3=impixel(I,i-1,j+1);
                       p5=impixel(I,i,j+1);
            d2= (abs((p(1)-p2(1)))+abs((p(2)-p2(2)))+abs((p(3)-p2(3))))/(3*255);
            d3= (abs((p(1)-p3(1)))+abs((p(2)-p3(2)))+abs((p(3)-p3(3))))/(3*255);
            d5= (abs((p(1)-p5(1)))+abs((p(2)-p5(2)))+abs((p(3)-p5(3))))/(3*255);
            c2=(1-d2)^10;
            c3=(1-d3)^10;
            c5=(1-d5)^10;
            m=[0 c2 c3; 0 0 c5; 0 0 0];
            div=1/sum(sum(m));
            m=div*m;
            p2=p2*m(1,2);
            p3=p3*m(1,3);
            p5=p5*m(2,3);
            p(1)=p2(1)+p3(1)+p5(1);
            p(2)=p2(2)+p3(2)+p5(2);
            p(3)=p2(3)+p3(3)+p5(3);
            p
        elseif (i==row) && (j~=1) && (j~=column)
%                 last row and intermediate column
                   p1=impixel(I,i-1,j-1);
                   p2=impixel(I,i-1,j);
                   p3=impixel(I,i-1,j+1);
                   p4=impixel(I,i,j-1);
                   p5=impixel(I,i,j+1);
            d1= (abs((p(1)-p1(1)))+abs((p(2)-p1(2)))+abs((p(3)-p1(3))))/(3*255);
            d2= (abs((p(1)-p2(1)))+abs((p(2)-p2(2)))+abs((p(3)-p2(3))))/(3*255);
            d3= (abs((p(1)-p3(1)))+abs((p(2)-p3(2)))+abs((p(3)-p3(3))))/(3*255);
            d4= (abs((p(1)-p4(1)))+abs((p(2)-p4(2)))+abs((p(3)-p4(3))))/(3*255);
            d5= (abs((p(1)-p5(1)))+abs((p(2)-p5(2)))+abs((p(3)-p5(3))))/(3*255);
            c1=(1-d1)^10;
            c2=(1-d2)^10;
            c3=(1-d3)^10;
            c4=(1-d4)^10;
            c5=(1-d5)^10;
            m=[c1 c2 c3; c4 0 c5; 0 0 0];
            div=1/sum(sum(m));
            m=div*m;
            p1=p1*m(1,1);
            p2=p2*m(1,2);
            p3=p3*m(1,3);
            p4=p4*m(2,1);
            p5=p5*m(2,3);
            p(1)=p1(1)+p2(1)+p3(1)+p4(1)+p5(1);
            p(2)=p1(2)+p2(2)+p3(2)+p4(2)+p5(2);
            p(3)=p1(3)+p2(3)+p3(3)+p4(3)+p5(3);
             p 
        else 
%                 last row and last column pixel
                   p1=impixel(I,i-1,j-1);
                   p2=impixel(I,i-1,j);
                   p4=impixel(I,i,j-1);
            d1= (abs((p(1)-p1(1)))+abs((p(2)-p1(2)))+abs((p(3)-p1(3))))/(3*255);
            d2= (abs((p(1)-p2(1)))+abs((p(2)-p2(2)))+abs((p(3)-p2(3))))/(3*255);
            d4= (abs((p(1)-p4(1)))+abs((p(2)-p4(2)))+abs((p(3)-p4(3))))/(3*255);
            c1=(1-d1)^10;
            c2=(1-d2)^10;
            c4=(1-d4)^10;
            m=[c1 c2 0; c4 0 0; 0 0 0];
            div=1/sum(sum(m));
            m=div*m;
            p1=p1*m(1,1);
            p2=p2*m(1,2);
            p4=p4*m(2,1);
            p(1)=p1(1)+p2(1)+p4(1);
            p(2)=p1(2)+p2(2)+p4(2);
            p(3)=p1(3)+p2(3)+p4(3);
            p
            
        end   
   end
end 
end 
figure,imtool(I);title('After Normalization Process:Color Image');
level = graythresh(I);
BW = im2bw(I, level);
figure,imtool(BW);title('After Normalization Process:Binary Image');
% ------------------------
% Color Reduction Process
rgb_rows = reshape(I, [], 3);
size(rgb_rows);
[unique_colors, m, n] = unique(rgb_rows, 'rows');
color_counts = accumarray(n, 1);
fprintf('There are %d unique colors in the image.\n', ...
    size(unique_colors, 1));
[X,map]=color_reduction(I,0.1);
I=ind2rgb(X,map);
figure,imtool(I);title('Color Reduced Image');
rgb_rows = reshape(I, [], 3);
size(rgb_rows);

[unique_colors, m, n] = unique(rgb_rows, 'rows');
color_counts = accumarray(n, 1);
fprintf('After Color reduction Process..there are %d unique colors in the image.\n', ...
    size(unique_colors, 1));
% ------------------------------
% Edge Detection Process Using Canny detector
J=rgb2gray(I);
ed=edge(J,'canny');
figure,imtool(ed);title('Canny Edge Detection');
% ed(120,219)
%--------------------------------
%Gradient calculation of each pixel using Sobel mask
% x-Dirextion Gradient(Gx)
% y-Dirextion Gradient(Gy)
% Direction of an image(Gtheta)
% Gradient magnitude
[Gx,Gy,Gtheta,Gmag]=gradient(ed);
% [Gmagg,Gdir]=imGradient(J,'sobel');
[row,column,value]=find(ed);
length(column)
% 1 Radien=57.2957795
% ----------------------------------
% Calculation of Stroke Width Transformation
 [Val]=swt_try(Gx,Gy,Gmag,Gtheta,ed);
%  figure,imtool(ed);title('After SWT');
%  t=find_tensors(ed,18.25);
adcgrouping(ed);
 

