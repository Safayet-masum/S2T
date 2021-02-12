titleBar = 'Speech to Text';
ch = char(10);
userPrompt = strcat('Say you sentence/s immidiately after pressing ok',ch,'How many words are there?');
word = inputdlg(userPrompt, titleBar, 1);
len=str2num(char(word));
aud1=record(len,8000);
freq1=fft(aud1);
result= 'Did you say:';
files = dir('*.wav');
for(j=1:8000:len*8000)
  window=aud1(j:j+8000-1);
  freq=fft(window);
  min=9999999;
  result=strcat(result,' ');
  for i=1:length(files)
    disp(files(i).name);
    [ref,fs]=audioread(files(i).name);
    reff=fft(ref);
    dis=EDistance(freq,reff)
    d=abs(dis);
    if d<min
      min=d;
      info=audioinfo(files(i).name);
      x=[info.Title];
    end
   end
   result=strcat(result,x);
end
msgbox(result);
main;


  
  
  
  
%sound(aud);
