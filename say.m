%This function takes a word and finds this in the
%directory and plays if match found

function d = say(y)
  
  %Loading all the audio file info
  files = dir('*.wav');
  
  %This indicated if the words found or not
  done=0;
  
  for i=1:length(files)
    
    disp(files(i).name);
    
    %Loading audio data
    [ref,fs]=audioread(files(i).name);
    
    %Loading audio info
    info=audioinfo(files(i).name);
    x=[info.Title];
    
    %Checking if match found
    if size(x)==size(y) && x==y
      sound(ref);
      done=1;
      break;
     end
  end
  
  
  if done==0
    warndlg(strcat(y,' not found in the dictionary'));
  end
  
endfunction
