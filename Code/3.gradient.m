function [Gx,Gy,Gtheta,Gmag]=gradient(varargin)
        [ED] = parse_inputs(varargin{:});
        mask_x=[-1 -2 -1;0 0 0;1 2 1];
        mask_y=[-1 0 1;-2 0 2;-1 0 1];
        pixel_z=[0 0 0;0 0 0;0 0 0];
        resultx=[0 0 0;0 0 0;0 0 0];
        resulty=[0 0 0;0 0 0;0 0 0];
        [row,column,value]=find(ED);
        r=length(row);
        for i=1:1:r
            z5=ED(row(i),column(i));
            z1=ED(row(i)-1,column(i)-1);
            z2=ED(row(i),column(i)-1);
            z3=ED(row(i)+1,column(i)-1);
            z4=ED(row(i)-1,column(i));
            z6=ED(row(i)+1,column(i));
            z7=ED(row(i)-1,column(i)+1);
            z8=ED(row(i),column(i)+1);
            z9=ED(row(i)+1,column(i)+1);
            pixel_z=[z1 z2 z3;z4 z5 z6;z7 z8 z9];
            resultx=mask_x.*pixel_z;
            resulty=mask_y.*pixel_z;
            Gx(row(i),column(i))=( resultx(3,1) + (2 *resultx(3,2)) + resultx(3,3) ) - ( resultx(1,1) + ( 2 * resultx(1,2) ) + resultx(1,3) );
            Gy(row(i),column(i))=(resulty(1,3)+(2*resulty(2,3))+resulty(3,3))-(resulty(1,1)+(2*resulty(2,1))+resulty(3,1));
            Gtheta(row(i),column(i))=(atan(Gy(row(i),column(i))/Gx(row(i),column(i))))*57.2957795; 
            Gmag(row(i),column(i))=( (Gx (row(i),column(i)) ^2) + (Gy (row(i),column(i)) ^2) ) ^0.5;
        end 
end

%-------------------------------
function [ED] = parse_inputs(varargin)
% Defaults:

error(nargchk(1,1,nargin,'struct'));

switch nargin
    case 0             
        eid = sprintf('MATLAB:%s:obsoleteSyntaxNeedMoreArgs',mfilename);
        error(eid,...
            '%s\n%s', 'Gradient(ED) is a deprecated syntax.', ...
            'Specify the image name to find gradient.');
    case 1         
        ED = varargin{1};
    otherwise
        eid = sprintf('MATLAB:%s:invalidInputArgs',mfilename);
        error(eid,'Invalid input arguments.');
end

end