function letter = read_letter (imagn)

A=imread('A.bmp');B=imread('B.bmp');
C=imread('C.bmp');D=imread('D.bmp');
E=imread('E.bmp');F=imread('F.bmp');
G=imread('G.bmp');H=imread('H.bmp');
I=imread('I.bmp');J=imread('J.bmp');
K=imread('K.bmp');L=imread('L.bmp');
M=imread('M.bmp');N=imread('N.bmp');
O=imread('O.bmp');P=imread('P.bmp');
Q=imread('Q.bmp');R=imread('R.bmp');
S=imread('S.bmp');T=imread('T.bmp');
U=imread('U.bmp');V=imread('V.bmp');
W=imread('W.bmp');X=imread('X.bmp');
Y=imread('Y.bmp');Z=imread('Z.bmp');
%Number
one=imread('1.bmp');  two=imread('2.bmp');
three=imread('3.bmp');four=imread('4.bmp');
five=imread('5.bmp'); six=imread('6.bmp');
seven=imread('7.bmp');eight=imread('8.bmp');
nine=imread('9.bmp'); zero=imread('0.bmp');
%*-*-*-*-*-*-*-*-*-*-*-
letter=[A B C D E F G H I J K L M...
    N O P Q R S T U V W X Y Z];
number=[one two three four five...
    six seven eight nine zero];
ndims(number)
character=[letter number];
size(character)
ndims(character)
templates=mat2cell(character,42,[24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24]);
save ('templates','templates')
comp = [];
load templates
for n = 1:36
    sem = corr2(templates {1, n}, imagn);
    comp = [comp sem];
end
vd = find(comp == max (comp));
% * - * - * - * - * - * - * - * - * - * - * - * - * -
if vd == 1
    letter = 'A' ;
elseif vd == 2
    letter = 'B' ;
elseif vd == 3
    letter = 'C' ;
elseif vd == 4
    letter = 'D' ;
elseif vd == 5
    letter = 'E' ;
elseif vd == 6
    letter = 'F' ;
elseif vd == 7
    letter = 'G' ;
elseif vd == 8
    letter = 'H' ;
elseif vd == 9
    letter = 'I' ;
elseif vd == 10
    letter = 'J' ;
elseif vd == 11
    letter = 'K' ;
elseif vd == 12
    letter = 'L' ;
elseif vd == 13
    letter = 'M' ;
elseif vd == 14
    letter = 'N' ;
elseif vd == 15
    letter = 'O' ;
elseif vd == 16
    letter = 'P' ;
elseif vd == 17
    letter = 'Q' ;
elseif vd == 18
    letter = 'A' ;
elseif vd == 19
    letter = 'S' ;
elseif vd == 20
    letter = 'T' ;
elseif vd == 21
    letter = 'U' ;
elseif vd == 22
    letter = 'V' ;
elseif vd == 23
    letter = 'W' ;
elseif vd == 24
    letter = 'X' ;
elseif vd == 25
    letter = 'Y' ;
elseif vd == 26
    letter = 'Z' ;
    % * - * - * - * - *
elseif vd == 27
    letter = '1 ' ;
elseif vd == 28
    letter = '2 ' ;
elseif vd == 29
    letter = '3 ' ;
elseif vd == 30
    letter = '4 ' ;
elseif vd == 31
    letter = '5 ' ;
elseif vd == 32
    letter = '6 ' ;
elseif vd == 33
    letter = '7 ' ;
elseif vd == 34
    letter = '8 ' ;
elseif vd == 35
    letter = '9 ' ;
else
    letter = '0 ' ;
end
end