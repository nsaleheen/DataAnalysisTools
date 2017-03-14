
nH=10;
nP=42;
nD = 60;
M=[];
for pid=1:nP
    A=round(normrnd(70, 10, [1 nH*nD*nP*60]));
    B=find(A(:)<56);
    A(B)=A(B)+(20+mod(pid, 15));
    M=[M; A'];
    hist(A)
    csvwrite(['heartRate' int2str(pid) '.csv'],A);    
end
csvwrite('heartRate.csv',M);

