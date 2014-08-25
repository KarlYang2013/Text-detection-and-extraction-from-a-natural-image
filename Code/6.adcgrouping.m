function []=adcgrouping(varargin)


% Important key functions/ parameters
% Call regionprops(CC, 'basic') to get the Area, Centroid and BoundBox
% Centroid(1) will have centroid.x
% Centroid(2) will have centroid.y
% BoundBox(3) will have x_width -> width
% BoundBox(4) will have y_width -> height
[ED] = parse_inputs(varargin{:});
% I=imread('225.jpg');
% figure,imshow(I);title('image 1');
% J= im2bw(I);
% figure,imshow(J);title('image BW');
CC = bwconncomp(ED);
% CC.NumObjects;
% CC;
[L,num] = bwlabel(ED);
num;
data = regionprops(CC, 'basic');
data
height1 = size(data(3),1);
height1
data(3).Area
data(3).Centroid(1)


% figure,imshow(K);title('image CC');
nc = size(ED,2);
nc
nr = size(ED,1);
nr
comp = [];
count = 0;
grain = false(size(ED));
grain(CC.PixelIdxList{3}) = true;
for i=1:1:num
    if (data(i).Area > 100 )
        grain(CC.PixelIdxList{i}) = true;
        count = count +1;
        comp(count)=i;
    end
    
end


figure, imshow(grain);

% labeled = labelmatrix(CC);
% whos labeled
% RGB_label = label2rgb(labeled, @spring, 'c', 'shuffle');
% figure, imshow(RGB_label)
FL = [];
FLD = [];
FR = [];
FRD = [];
% T1 to T5 are constants based on experimental observations (from paper)
T1 = 2;
T2 = 3;
T3 = 0.5;
T4 = 2;
T5 = 40;
sprintf('BoundBox\n');
for i=1:1:(num-1)
%     the 2 components to be considered are i & (i+1) % num
    i
    c1 = i;
    c2 = (i+1);
%     data(i).BoundingBox
    if ( (1/T1) < ( data(c1).BoundingBox(4)/data(c2).BoundingBox(4) ) < T1  )
        [dist1] = dist(data(c1).Centroid(1),data(c2).Centroid(1));
        [max] = max2(data(c1).BoundingBox(3),data(c2).BoundingBox(3));
%         dist1
%         max
        if ( dist1 <= ( T2 * max ) )
%             max
            [dist1] = dist(data(c1).Centroid(2),data(c2).Centroid(2));
            [max] = max2(data(c1).BoundingBox(4),data(c2).BoundingBox(4));
%             max
            if ( dist1 <= ( T3 * max ) )
%                 max
                if( 1/T4 < data(c1).Area/data(c2).Area < T4 )
%                     T4
                    if ( data(c1).Centroid(1) <= data(c2).Centroid(1) )
                        FR(i)=i+1;
                        FLD(i+1)=i;
                    else
                        FL(i)=i+1;
                        FRD(i+1)=i;
                    end
                end
            end
        end
    end
end 
FR
FL
FRD
FLD
comp
num
end



function [ED] = parse_inputs(varargin)
% Defaults:

error(nargchk(1,1,nargin,'struct'));

switch nargin
    case 0              
        eid = sprintf('MATLAB:%s:obsoleteSyntaxNeedMoreArgs',mfilename);
        error(eid,...
            '%s\n%s', 'CCformation(ED) is a deprecated syntax.', ...
            'Specify the image name to find gradient.');
    case 1         
        ED = varargin{1};
    otherwise
        eid = sprintf('MATLAB:%s:invalidInputArgs',mfilename);
        error(eid,'Invalid input arguments.');
end

end