function y = flujo(x)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
if x<0
    y=max(1-abs(x), 0);
else y=1;
end

