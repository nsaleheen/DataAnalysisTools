dir = 'C:\Users\sakther\DATA\puffmarker_feature_files\featureFilePuffMarker03202017\';

% train= csvread([dir 'featureFile_puffmarker_031017_yaw.csv'], 1);
fFile = importdata([dir 'featureFile_puffmarker_032017.csv']);
train= fFile.data;
featureNames = fFile.textdata;
train_1 = train(find(train(:, end)==1), :);
train_0 = train(find(train(:, end)==0), :);

for i=1:length(featureNames)
    i
    A1=train_1(:,i);
    A0=train_0(:,i);
   
%     ksdensity(A0,'npoints',length(unique(A0)));
    X=A0;
    [xi,f]=ksdensity(X);

%     plot(f,xi);
    plot(f, xi,'color','r' ); 

    hold on;
    ksdensity(A1,'npoints',length(unique(A1)));
    hold on;

    legend('train(puff=0)','train(puff=1)')
    title(['Feature(' num2str(i) '): ' featureNames{i} ]);
    set(findall(gcf,'type','text'),'FontSize',16,'fontWeight','bold');
    set(gca,'FontSize',16,'fontWeight','bold');
    saveas(gcf,[dir 'featuresDistribution\density' int2str(i) '__' featureNames{i} '.png']);
    close(gcf);
end

pitch_0 = train_0(:, 23);
roll_0 = train_0(:, 29);
yaw_0 = train_0(:, 35);

pitch_1 = train_1(:, 23);
roll_1 = train_1(:, 29);
yaw_1 = train_1(:, 35);

plot(roll_0, pitch_0, '.b'); hold on;
plot( roll_1, pitch_1,'.r');

plot(yaw_0, pitch_0, '*b'); hold on;
plot( yaw_1, pitch_1,'*r');


plot(pitch_0, roll_0, '.b'); hold on;
plot(pitch_1, roll_1, '.r');

