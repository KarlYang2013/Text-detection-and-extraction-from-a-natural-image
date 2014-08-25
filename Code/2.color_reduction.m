function [X,map] = color_reduction(varargin)

[RGB,m,dith] = parse_inputs(varargin{:});
so = size(RGB);

% Converts depending on what is m:
if isempty(m) % Convert RGB image to an indexed image.
    X = reshape(1:(so(1)*so(2)),so(1),so(2));
    if so(1)*so(2) <= 256
        X = uint8(X-1);
    elseif so(1)*so(2) <= 65536
        X = uint16(X-1);
    end
    map = im2doubleLocal(reshape(RGB,so(1)*so(2),3));

else
    if length(m)==1 % TOL is given
        if isa(RGB,'uint16') || isfloat(RGB)
            RGB = grayto8(RGB);
        end

        if (m < 1) % tol is given. Uniform quantization
            max_colors = 65536;
            max_N = floor(max_colors^(1/3)) - 1;
            N = round(1/m);
            if (N > max_N)
                N = max_N;
                wid = sprintf('MATLAB:%s:tooManyColors',mfilename);
                warning(wid,'Too many colors; increasing tolerance to %g',1/N);
            end
        
            [x,y,z] = meshgrid((0:N)/N);
            map = [x(:),y(:),z(:)];

            if dith(1) == 'n'
                RGB = round(im2doubleLocal(RGB)*N);
                X = RGB(:,:,3)*((N+1)^2)+RGB(:,:,1)*(N+1)+RGB(:,:,2)+1;
            else
                X = dither(RGB,map);
            end
               [X,map] = cmunique(X,map);
        end 
    end

end

end 
%--------------

%  Function: parse_inputs

function [RGB,m,dith] = parse_inputs(varargin)
% Defaults:
dith = 'dither';
m = [];

error(nargchk(1,3,nargin,'struct'));

switch nargin
    case 1               
        eid = sprintf('MATLAB:%s:obsoleteSyntaxNeedMoreArgs',mfilename);
        error(eid,...
            '%s\n%s', 'RGB2IND(RGB) is a deprecated syntax.', ...
            'Specify number of colors, tolerance');
    case 2               %  where x = TOL
        RGB = varargin{1};
        m = varargin{2};
    case 3               % (RGB,x,DITHER_OPTION)
        RGB = varargin{1};  %              where x = TOL
        m = varargin{2};
        dith = varargin{3};
    otherwise
        eid = sprintf('MATLAB:%s:invalidInputArgs',mfilename);
        error(eid,'Invalid input arguments.');
end

end

%---------------------------
function d = im2doubleLocal(img)

imgClass = class(img);

switch imgClass
    case {'uint8','uint16'}
        d = double(img) / double(intmax(imgClass));
    case {'single'}
        d = double(img);
    case 'double'
        d = img;
end
end