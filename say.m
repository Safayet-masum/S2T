function d = say(y)
  files = dir('*.wav');
  for i=1:length(files)
    disp(files(i).name);
    [ref,fs]=audioread(files(i).name);
    info=audioinfo(files(i).name);
    x=[info.Title];
    if size(x)==size(y) && x==y
      sound(ref);
      break;
     end
  end
  
endfunction
