%add a new word to the dictionary
%Repeating recomended to increase frequency

titleBar = 'Add a new word';

userPrompt = 'Say you word immidiately after pressing ok';

%input the word
word = inputdlg(userPrompt, titleBar, 1);

%Generating File Name
%Word+random number +.exe
%Random number so that same word can be duplicated to increase accuracy

rn=num2str(randi(10000));
filename=strcat(char(word),rn);
filename=strcat(filename,'.wav');

%recording the audio
aud=record(1,8000);

%Writing into file
%extra parameter Title holds the original word accessible from audioinfo
audiowrite(filename,aud,8000, 'Title', word);
pause(1);

%Playback the sound
sound(aud);

%Back to Main for further works
main;

