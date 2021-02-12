%This Converts Speech audio to text

titleBar = 'Speech to Text';

%Newline
nl = char(10);
userPrompt = strcat('Say you sentence/s immidiately after pressing ok',...
                    nl,'How many words are there?');
                   
%Input number of words
word = inputdlg(userPrompt, titleBar, 1);

%Convert to int
len=str2num(char(word));

%Record audio
aud=record(len,8000);

%Convering to frequency spectrum
freq=fft(aud);

%Stores result
result= 'Did you say:';


%Loading all files
files = dir('*.wav');

for(j=1:8000:len*8000)
  
  %Splitting to windows to find words
  %8000 frames long
  window=aud(j:j+8000-1);
  
  %Convering to frequency spectrum
  wfreq=fft(window);
  
  %Applying filter to reduce noise
  Ffreq=filter(wfreq);
  
  %Best match finder
  min=9999999;
  
  result=strcat(result,' ');
  
  for i=1:length(files)
    
    disp(files(i).name);
    
    %Loading audio data
    [ref,fs]=audioread(files(i).name);
    
    %Reference data in frequency spectrum
    reff=fft(ref);
    
    %Applying filter to reduce noise
    Freff=filter(reff);
    
    %Similarity calculator
    dis=EDistance(Ffreq,Freff)
    
    %Modulus
    d=abs(dis);
    
    
    if d<min
      min=d;
      
      %Storing best result
      info=audioinfo(files(i).name);
      x=[info.Title];
      
    end
    
   end
   
   %Adding best result to sentence
   result=strcat(result,' ',x);
   
end

%Display Result
msgbox(result);


main;


  
  
  
  
%sound(aud);
