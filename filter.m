%Filtering the audio to find significant changes only
%First goes through a High band pass to reduce noise
%Then through a Moving average filter so no noice dominates

function d = filter(y)
  
  %Converting to time domain for high pass filter
  aud=ifft(y);
  
  %High pass cap 0.0001
  for(j=1:1:8000)
  
    %Vanishing bellow certain point;
    if aud(j)<0.0001 
      aud(j)=0;
    end
  end
  
  %Copy to store result
  aud2=aud;
  %Moving average filter Window size 40
  for(j=62:1:8000-62)
  
    %Sum of window
    bit=0;
    
    for(i=j-60:1:j+60)
      bit+=aud(i);
    end
    
    %Average
    bit/=120;
    
    aud2(j)=bit;
    
  end
  
  
  %Converting to freq domain
  d=fft(aud2);
  
  
endfunction
