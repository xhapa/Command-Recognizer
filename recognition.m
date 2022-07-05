function recognition(percentages)
[best, pos] = max(percentages);
if best < 0.2
    disp("None")
elseif pos == 1
    disp("Start")
elseif pos == 2
    disp("Stop")
elseif pos == 3
    disp("Left")
elseif pos == 4
    disp("Right")
elseif pos == 5
    disp("Up")
elseif pos == 6
    disp("Down")
elseif pos == 7
    disp("Back")
elseif pos == 8
    disp("Forward")
else 
    disp("Error")
end