function [ Val ]= swt_try(varargin)
    [Gx,Gy,Gmag,Gtheta,ED]=parse_inputs(varargin{:});
    [row,column,value]=find(ED);
    [row_size,column_size,channel_value]=size(ED);
    row_size
    column_size
    Len=0;
    for i=1:1:row_size
        for j=1:1:column_size
            Val(i,j)=Inf;
        end
    end
    Tf=isinf(Val);
    fprintf('Inside SWT');
    for i=1:1:row_size
        for j=1:1:column_size
            if (ED(i,j)>0)
                if ( Tf(i,j)==1 )
                    
                        s=i;
                        t=j;
                        dp=Gtheta(i,j);
                        for c=1:1:30
                            if ( (s<row_size) && (t<column_size) )
                                if (Gtheta(s,t)>=0) && (Gtheta(s,t)<=20)
                                    s=s+1;
                                    t=t+0;
                                    if (ED(s,t)>0)
                                        if (s-i) > (t-j)
                                            if (s-i) >=0
                                              Len=s-i;
                                            end
                                        else
                                            if (t-j) >=0
                                              Len=t-j;
                                            end
                                        end
                                        for m=i:1:s
                                            for n=j:1:t
                                                if Val(m,n)> Len
                                                    Val(m,n)=Len;
                                                    Tf(m,n)=0;
                                                end
                                                ED(m,n)=1;
                                            end
                                        end
                                        %fprintf('\nif 1');
                                        %if ( abs( Gtheta(s,t) - (dp- (dp/abs(dp) )* 180) ) < 30 ) %checking the condition here.
                                            %fprintf('Strating Co-ordinates:%f and %f',i,j);
                                            %fprintf('Ending Co-ordinates:%f and %f',s,t);
                                            %break;
                                        %end
                                        break;
                                    end
                                end
                            end 
                            if (s<row_size) && (t<column_size)
                                if (Gtheta(s,t)>=21) && (Gtheta(s,t)<=45)
                                    %fprintf('\nInside First If');
                                    s=s+1;
                                    t=t-1;
                                    if (ED(s,t)>0)
                                        if (s-i) > (t-j)
                                            if (s-i) >=0
                                              Len=s-i;
                                            end
                                        else
                                            if (t-j) >=0
                                              Len=t-j;
                                            end
                                        end
                                         for m=i:1:s
                                            for n=j:1:t
                                                if Val(m,n)> Len
                                                    Val(m,n)=Len;
                                                    Tf(m,n)=0;
                                                end
                                                ED(m,n)=1;
                                            end
                                        end
                                        %fprintf('\nif 2');
                                        %if ( abs( Gtheta(s,t) - (dp- (dp/abs(dp) )*180) ) <30 ) %checking the condition here.
                                            %fprintf('Strating Co-ordinates:%f and %f',i,j);
                                            %fprintf('Ending Co-ordinates:%f and %f',s,t);
                                            %break;
                                        %end
                                        break;
                                    end
                                end
                            end 
                            if (s<row_size) && (t<column_size)
                                if (Gtheta(s,t)>45) && (Gtheta(s,t)<=90)
                                    s=s+0;
                                    t=t-1;
                                    if (ED(s,t)>0)
                                        if (s-i) > (t-j)
                                            if (s-i) >=0
                                              Len=s-i;
                                            end
                                        else
                                            if (t-j) >=0
                                              Len=t-j;
                                            end
                                        end
                                         for m=i:1:s
                                            for n=j:1:t
                                                if Val(m,n)> Len
                                                    Val(m,n)=Len;
                                                    Tf(m,n)=0;
                                                end
                                                ED(m,n)=1;
                                            end
                                        end
                                        %fprintf('\nif 3');
                                        %fprintf('\nValue: %f',abs( Gtheta(s,t) - (dp- (dp/abs(dp) )*180)));
                                        %if ( abs( Gtheta(s,t) - (dp- (dp/abs(dp) )*180) ) <30 ) %checking the condition here.
                                            %fprintf('Strating Co-ordinates:%f and %f',i,j);
                                            %fprintf('Ending Co-ordinates:%f and %f',s,t);
                                            %break;
                                        %end
                                        break;
                                    end
                                end
                            end 
                        end %(for end here)
                end %(if end here)
            end 
        end
    end
    figure,imtool(ED);title('Image With SWT');
end







%-------------------------------------------------
function [Gx,Gy,Gmag,Gtheta,ED] = parse_inputs(varargin)

error(nargchk(5,5,nargin,'struct'));

switch nargin
    
    case 5          
        Gx = varargin{1};
        Gy = varargin{2};
        Gmag = varargin{3};
        Gtheta = varargin{4};
        ED = varargin{5};
    otherwise
        eid = sprintf('MATLAB:%s:invalidInputArgs',mfilename);
        error(eid,'Invalid input arguments.');
end

end