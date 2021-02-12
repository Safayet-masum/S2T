titleBar = 'Text to Speech';
userPrompt = 'Enter your text here';
word = inputdlg(userPrompt, titleBar, 1);
s=char(word)
l=size(s)(2)
gg=''
for i=1:l
  if s(i)==' '
    say(gg);
    gg=''
   else gg=strcat(gg,s(i));
  endif
endfor
say(gg);
main;
