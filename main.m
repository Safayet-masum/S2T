
%Initial UI

titleBar = 'Hello';

%Input codes

ext='0';
Newword='1';
Texttospeech='2';
Speechtotext='3';

%newline
nl = char(10);

userPrompt = strcat('Put 0 to Quit',nl,...
                    'Put 1 to add new word to dictionary',...
                    nl ,'Put 2 for Text to speech', nl ,...
                    'Put 3 for Speech to text');

%input choice from user                  
word = inputdlg(userPrompt, titleBar, 1);

%convert to matrix-compatibility
d=cell2mat(word);

if d==Newword
  NewWord;
  
elseif d==Texttospeech
  TextToSpeech;
  
elseif d==Speechtotext
  SpeechToText;
  
else
  msgbox('Thanks!');
  
end;









