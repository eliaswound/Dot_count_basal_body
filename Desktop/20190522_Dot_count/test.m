%function one: get length of the tall vector
sz=sum(size(s))-1;
%function two: arrange array values and find median
TotalArea=zeros(1,sz);
for i=1:sz
    TotalArea(1,i)=gather(s(i).Area);
end
meanArea=mean(TotalArea);
stdArea=std(TotalArea);
botMean=mean(TotalArea(floor(sz/2):sz));



