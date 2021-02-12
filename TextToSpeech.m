%This procedure takes a string and prints audio

titleBar = 'Text to Speech';
userPrompt = 'Enter your text here';

%taking sentence input
word = inputdlg(userPrompt, titleBar, 1);

%converting to string
s=char(word)
l=size(s)(2)

%splitting the words from sentences
split='';

for i=1:l
  
  if s(i)==' '
    
    %Sending for audio
    say(split);
    
    split='';
    
   else split=strcat(split,s(i));
    
  endif
  
endfor

%sending the final word
say(split);

main;
