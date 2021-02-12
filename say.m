function d = say(y)
  files = dir('*.wav');
  done=0;
  for i=1:length(files)
    disp(files(i).name);
    [ref,fs]=audioread(files(i).name);
    info=audioinfo(files(i).name);
    x=[info.Title];
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
