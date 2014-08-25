function [ CC ]=ccformation(varargin)
        [ED,Val] = parse_inputs(varargin{:});
         CC = bwconncomp(ED);
         labeled=labelmatrix(CC);
         Rgb_label=label2rgb(labeled,@copper,'c','shuffle');
         imshow(Rgb_label,'InitialMagnification','fit');
         [row_size,column_size,number]=size(ED);
         label_count=0;
         if (column_size > row_size)
             label=zeros(column_size)
         else
             label=zeros(row_size)
         end
         for i=1:1:row_size
             for j=1:1:column_size
                 if (Val(j,i) ~= Inf)
                     label_count=label_count+1;
                     if (i-1==0) && (j-1==0)
                         p5=Val(j+1,i);
                         p7=Val(j,i+1);
                         p8=Val(j+1,i+1);
                         if (Val(j,i)/p5) <3
                           if label(j+1,i)==0
                               label(j,i)=label_count;
                           elseif (label_count>label(j+1,i))
                               label(j,i)=label(j+1,i);
                           else
                               label(j,i)=label_count;
                           end
                         end
                     end
                     if (j-1==0) && (i-1~=0) && (i+1<=row_size)
                         p2=Val(j,i-1);
                         p3=Val(j+1,i-1);
                         p5=Val(j+1,i);
                         p7=Val(j,i+1);
                         p8=Val(j+1,i+1);
                     end
                     if (j-1==0) && (i-1~=0) && (i+1>row_size)
                         p2=Val(j,i-1);
                         p3=Val(j+1,i-1);
                         p5=Val(j+1,i);
                     end
                     if (i-1==0) && (j-1~=0) && (j+1<=column_size)
                         p4=Val(j-1,i);
                         p5=Val(j+1,i);
                         p6=Val(j-1,i-1);
                         p7=Val(j,i+1);
                         p8=Val(j+1,i+1);
                     end
                     if (i-1==0) && (j-1~=0) && (j+1>column_size)
                         p4=Val(j-1,i);
                         p5=Val(j+1,i);
                         p6=Val(j-1,i-1);
                         p7=Val(j,i+1);
                         p8=Val(j+1,i+1);
                     end    
                     if (j+1 > column_size) && (i-1~=0) && (i+1<=row_size)
                         p1=Val(j-1,i-1);
                         p2=Val(j,i-1);
                         p4=Val(j-1,i);
                         p6=Val(j-1,i+1);
                         p7=Val(j,i+1);
                     end    
                     if (j+1 > column_size) && (i-1~=0) && (i+1>row_size)
                         p1=Val(j-1,i-1);
                         p2=Val(j,i-1);
                         p4=Val(j-1,i);
                     end
                 end
                 
             end
         end
         
         
        
end

%-------------------------------
function [ED] = parse_inputs(varargin)
% Defaults:

error(nargchk(2,2,nargin,'struct'));

switch nargin
    case 0              
        eid = sprintf('MATLAB:%s:obsoleteSyntaxNeedMoreArgs',mfilename);
        error(eid,...
            '%s\n%s', 'CCformation(ED) is a deprecated syntax.', ...
            'Specify the image name to find gradient.');
    case 2         
        ED = varargin{1};
        Val = varargin{2};
    otherwise
        eid = sprintf('MATLAB:%s:invalidInputArgs',mfilename);
        error(eid,'Invalid input arguments.');
end

end