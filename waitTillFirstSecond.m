function currentTime = waitTillFirstSecond(delay)
j = 0;
while(j==0)
    t = datetime('now');
    if(t.Second<1&&t.Second>delay)
        currentTime = t
        j = j+1;
        return
    end
end

end