%%%Esto es el script de la practica 2 de fsi, fi

info = mmfileinfo('testVideo.mpg');
audio = info.Audio;
video = info.Video;

%%%hemos sacado la info del video, mmfileinfo

v = VideoReader('testVideo.mpg'); %%creamos un objeto que sea el video


bpp = v.BitsPerPixel;
Duration = v.Duration;
framerate = v.FrameRate;
num_frames = v.NumFrames;

tag = v.Tag;

fprintf('bpp = %d\n', bpp);
fprintf('Duracion = %d\n', Duration);
fprintf('framerate = %d\n', framerate);
fprintf('nummero de frames = %d\n', num_frames);
fprintf('tag = %d\n', tag);

%% Lectura y reproducci´on de un video en formato mpeg
% Precarga la estructura de datos.
v = VideoReader('testVideo.mpg');
s=struct('cdata', zeros(v.Height, v.Width, 3, 'uint8'),'colormap', []);

numFrames = 0;
Duration=v.CurrentTime;
while hasFrame(v)
numFrames = numFrames + 1;
s(numFrames).cdata = readFrame(v);
Duration=v.CurrentTime;
end
% Visualizaci´on del video

implay(s,v.FrameRate);
Duration;
numFrames;