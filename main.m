titleBar = 'Hello';
ch = char(10);
userPrompt = strcat('Put 0 to Quit',ch,'Put 1 to add new word to dictionary', ch ,'Put 2 for Text to speech', ch ,'Put 3 for Speech to text');
word = inputdlg(userPrompt, titleBar, 1);
d=cell2mat(word);
if d=='1'
  NewWord;
elseif d=='2'
  d=1
  TextToSpeech;
elseif d=='3'
  SpeechToText;
else
  msgbox('Thanks!');
end;









