warning off
clc, close all , clear all
image = imread ( '188.jpg' ); % Read Binary Image

imshow (image), title ( 'INPUT IMAGE WITH NOISE' )

% ------ Filter Image Noise ------
if length (size (image)) == 3 % RGB image
     image =rgb2gray(image);
end
 image =medfilt2(image);
[f,c] = size (image);
image (1,1) = 255;
Image (f, 1) = 255;
image (1, c) = 255;
image (f, c) = 255;
% ------ END Image Noise Filter ------

word = []; % Matrix Storage word from image
re = image;
fid = fopen ( 'text.txt' , 'wt' ); % Opens text.txt as file for write
while 1
    [fl re] = lines (re); % Fcn 'lines' separate lines in text
    IMGN = ~fl;
    % * - * Uncomment line below to see lines one by one 
    % Imshow (fl), pause (1)
   
    % -------Calculating connected components -------
    L = bwlabel (IMGN);
    mx =max(max (L));
    BW = edge (double (IMGN), 'sobel' );
    [imx, imy] = size (BW);
    for n = 1: mx
        [r, c] = find (L == n);
        rc = [r c];
        [sx sy] = size (rc);
        n1 = zeros (imx, imy);
        for i = 1: sx
            x1 = rc (i, 1);
            y1 = rc (i, 2);
            n1 (x1, y1) = 255;
        end
        % ------- END Calculating connected components ------- 
        n1 = ~ n1;
        n1 = ~ clip (n1);
         img_r =same_dim(n1); % Transf. to size 42 X 24
        % ------ Uncomment line below to see letters one by one --------
        % imshow (img_r) pause (1)
        % ---------------------------
        letter = read_letter (img_r); % img to text
        word = [word letter];
    end
    % Fprintf (fid, '% s \ n', lower (word));% Write 'word' in text file (lower)
    fprintf (fid, '% s \ n ' , word); 
   % Write 'word' in text file (upper)
    word = []; % Clear 'word' variable
    
    %  When the sentences finish, breaks the loop 
    if isempty (re)  % See variable 're' in Fcn 'lines'
        break
    end
    % ----------------------------------------------------
end
fclose (fid);
winopen ( 'text.txt' ) % Open 'text.txt' file