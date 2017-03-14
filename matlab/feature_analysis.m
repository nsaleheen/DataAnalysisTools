

dir = 'C:\Users\nsleheen\DATA\feature_analysis\';
train= importdata([dir 'featureFileNew.csv']);
train_1 = train(find(train(:, end)==1), :);
train_0 = train(find(train(:, end)==0), :);
test= importdata([dir 'test_D_rice.csv']);

% for i=1:36
%     i
%    A=train_1(1:143,i);
%    B=test(:,i);
%    histfit(A);
%    hold on;
%    histfit(B);
%    saveas(gcf,[dir 'fig\hist' int2str(i) '.png']);
%    close(gcf);
% end

for i=1:36
    i
    A1=train_1(:,i);
    A0=train_0(:,i);
    B=test(:,i);

    ksdensity(A0,'npoints',length(unique(A0)));
    hold on;
    ksdensity(A1,'npoints',length(unique(A1)));
    hold on;
%     ksdensity(B,'npoints',length(unique(B)))
    legend('train(puff=0)','train(puff=1)')
    saveas(gcf,[dir 'figNew1\density' int2str(i) '.png']);
    close(gcf);
end

