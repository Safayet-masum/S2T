titleBar = 'Add a new word';
userPrompt = 'Say you word immidiately after pressing ok';
word = inputdlg(userPrompt, titleBar, 1);
ex=num2str(randi(10000));
filename=strcat(char(word),ex);
filename=strcat(filename,'.wav');
aud=record(1,8000);
audiowrite(filename,aud,8000, 'Title', word);
pause(2);
sound(aud);
main;

