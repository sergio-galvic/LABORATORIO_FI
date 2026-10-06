M = 256;
N = 256;
Nbandas = 256;
%creamos nuestro vector de N elementos
x=linspace(0,1,N);
%aplicamos la formula para sacar una tira e bandas de mach, la cual
%simplemente hemos de alargar en altura para tener toda la cosa
xq=(fix(Nbandas*x))/(Nbandas-1);

%creamos la imagen con las bandas basandonos en el patron otriginal
imagen_double=repmat(xq,M,1);


%utilizamos imshow para visualizar una imagen de nuestra matriz con imagesc
%se muestra una escala de colores del azul oscuro al amarillo claro
imshow(imagen_double);

%con imshow se muestra el gradiente en escala de grises
%imshow(imagen);

%para sacar de una imagen en double, una imagen en formato unit8, 
%hemos de hacer la siguiente conversion
%A = double(B)/255; %esta es para pasar de unit8 a double manin
imagen_uint8 = uint8(round(imagen_double*255));%esta es para pasar de double a uint8 manin
imshow(imagen_uint8 );

%ahora la parte 6, en la que asociamos a cada banda un color, reducimos el
%numero de bandas

%primeramente creamos un mapa

%mapa=(linspace(0,1,Nbandas));%necesitamos que esto sea un vector horizontal, no vertical
%esto crea un vector 8x3, las ocho bandas, por los tres canales de color
%que queremos representar

%sin embargo, matlab ya tiene una funcion para hacer mapas de colores, por
%lo que usamos eso+

mapa = colormap(jet(Nbandas));%aqui hemos generado nustro mapa de colorers desocho bandas de colores
imindex = gray2ind(imagen_uint8,Nbandas);%esto es una conversion, para pasra valores de 0 a 1, a valores de 1 a 8

imshow(imindex);

%yt ahora le metemos el mapa "de color" para demostrar que, efectivamente,
%los colores son diferentes pese a en escala e negros no se note facilmente
imshow(imindex,mapa);

