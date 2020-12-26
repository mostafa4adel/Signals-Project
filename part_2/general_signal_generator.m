clc; clear all;  close all;
frequency_sample=input("Enter frequency sample\t:\t");

start_time=input("Enter Start Time\t:\t");

end_time = input("Enter End Time\t:\t");

number_of_bp=input("Enter Number of Break-Points\t:\t");
break_points=[end_time];
k=0;

Output_Signal_X_axis=linspace(start_time,end_time,(end_time-start_time)*frequency_sample);
Output_Signal_Y_axis=[];

for i=1:number_of_bp
  k=k+1;
  fprintf("Enter break-point #%d \t:\t",k);
  break_points(k)=input("");
endfor


for i=0:number_of_bp
  fprintf("\t#%d Signal\t:\t\n",i+1);
  fprintf("Enter \n'a' for DC signal.\n'b' for Ramp Signal.\n'c' for General Order Polynomial Signal.\n'd' for Eponential Signal.\n'e' for Sinusoidal Signal.\n");
  wanted_signal=input("","s");
  good_input=1;
  operating_on_this_signal=[];
  begin_pt=0;
  end_pt=0;
  if (i==0)
    operating_on_this_signal=ones(1,(break_points(1)-start_time)*frequency_sample);
    begin_pt=start_time;
    end_pt=break_points(1);
    elseif(i==number_of_bp)
    operating_on_this_signal= ones(1,(end_time-break_points(i))*frequency_sample);
    begin_pt=break_points(i)
    end_pt=end_time;
  else
    operating_on_this_signal= ones(1,(break_points(i+1)-break_points(i))*frequency_sample);
    begin_pt=break_points(i);
    end_pt=break_points(i+1);
    
  endif
  
  
  
  while(good_input)
  
  switch (wanted_signal)
    case 'a'
      amp=input("Enter Amplitude\t:\t");
      operating_on_this_signal=operating_on_this_signal.*amp;
      good_input=0;
      break;
      
      
    case 'b'
      slope=input("Enter Slope of Signal\t:\t");
      intercept=input("Enter Intercept\t:\t");
      operating_on_this_signal=(linspace(begin_pt,end_pt,frequency_sample*(end_pt-begin_pt)))*slope+intercept;
      
      good_input=0;
      break;
      
      
      
    case 'c' 
      order_of_polynomial=input("Enter Order\t:\t");
      coofecients_of_polynomial=[];
      for i_1=0:order_of_polynomial
        coofecients_of_polynomial(i_1+1)=input("Enter Coofecients from the Highest Order\t:\t");
      endfor
      operating_on_this_signal=polyval(coofecients_of_polynomial,linspace(begin_pt,end_pt,frequency_sample*(end_pt-begin_pt)));
      
      good_input=0;
      break;
      
      
    case 'd'
      amp=input("Enter Amplitude\t:\t");
      exponent_of_signal=input("Enter the Exponent\t:\t");
      operating_on_this_signal=amp*exp(exponent_of_signal*(linspace(begin_pt,end_pt,frequency_sample*(end_pt-begin_pt)))); 
      
      good_input=0;
      break;
    case 'e'
      fprintf("!!!Note input in radians!!!\n");
      amp=input("Enter Amplitude\t:\t");
      f=input("Enter Frequency of the Sinusoidal\t:\t");
      p=input("Enter phase of the Sinusoidal\t:\t");
      operating_on_this_signal=amp*sin(2*pi*f*(linspace(begin_pt,end_pt,frequency_sample*(end_pt-begin_pt)))+p);
      
      
      
      good_input=0;
      break;
  otherwise
    fprintf("!!!!!!!!!!!!!!!!!!UnKown Input!!!!!!!!!!!!!\n");
    wanted_signal=input("Enter Proper Input\t:\t","s");
endswitch

endwhile

Output_Signal_Y_axis=horzcat(Output_Signal_Y_axis ,operating_on_this_signal);

endfor



plot(Output_Signal_X_axis,Output_Signal_Y_axis);
fprintf('Program paused. Press enter to continue.\n');
pause;

operate_on_output=input("Enter Y to operate on the signal and N to skip\t:\t","s");
good_input=1;
good_input_1=1;
while(good_input)

switch (operate_on_output)
case 'Y'
fprintf("Enter \n'a' for Amplitude Scaling.\n'b' for Time reversal.\n'c' for Time shift.\n'd' for Expanding the signal.\n'e' for Compressing the signal.\n'f' for None.");
operation_wanted=input("","s");
good_input=1;

while(good_input_1)

switch (operation_wanted)
  case'a'
  amp=input("Enter Amplitude");
  Output_Signal_Y_axis=Output_Signal_Y_axis*amp;
   good_input_1=0;
  break;
case 'b'
  Output_Signal_X_axis=-Output_Signal_X_axis;
   good_input_1=0;
  break;
case 'c'
   shift_value=input("Enter the Shift value and sign");
   Output_Signal_X_axis=Output_Signal_X_axis-shift_value;
   good_input_1=0;
  break;
case 'd'
  expansion_value=input("Enter the value to Expand the signal");
  Output_Signal_X_axis=expansion_value*Output_Signal_X_axis;
   good_input_1=0;
  break;
case 'e'
    compression_value=input("Enter the value to Compress the signal");
  Output_Signal_X_axis=Output_Signal_X_axis/compression_value;
   good_input_1=0;
  break;
case 'f'
  
  good_input_1=0;
  break;
otherwise
fprintf("!!!!!!!!!!!!!!!!!!UnKown Input!!!!!!!!!!!!!\n");
operation_wanted=input("Enter Proper Input\t:\t","s");



endswitch
endwhile




break;
case 'N'
good_input=0;
break;
otherwise
fprintf("!!!!!!!!!!!!!!!!!!UnKown Input!!!!!!!!!!!!!\n");
operate_on_output=input("Enter Proper Input\t:\t","s");

endswitch
endwhile
















