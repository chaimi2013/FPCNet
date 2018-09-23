%testDemoFPCNet_DH
close all; clear; clc;
addpath(genpath('./utils/'));

%--------------------------parameters configuration--------------------------------
cfg = struct;
cfg.gpu_mode = 1;
cfg.MatCaffeRoot = '/home/user/jingzhang/caffe-master/matlab/';
cfg.deployFile = './models/deploy.prototxt';
cfg.model = './models/FPCNet_DH.caffemodel';
cfg.dataRoot = './data/';
cfg.imgFormat = 'png';
cfg.resultsRoot = './results/';

cfg.resizeHeight = 320;
cfg.FastGF.r = 32;
cfg.FastGF.epsilon = 1e-3;
cfg.FastGF.downScaleFactorGF = 4;
cfg.isWriteImgs = 1;

%------------------------network configuration-------------------------------
addpath(cfg.MatCaffeRoot);
if cfg.gpu_mode
    caffe.set_mode_gpu();
    caffe.set_device(0);
else
    caffe.set_mode_cpu();
end
net = caffe.Net(cfg.deployFile, cfg.model, 'test');
%------------------------matlab-------------------------------

if ~exist(cfg.resultsRoot, 'dir')
    mkdir(cfg.resultsRoot);
end

HazyImagePathList = dir(strcat(cfg.dataRoot,'*.', cfg.imgFormat ));
HazyImageNum = length(HazyImagePathList);
if HazyImageNum == 0
    error('Check your data root.');
end

timeCost = zeros(1, HazyImageNum);
for hazyImgIter = 1:HazyImageNum
    disp(['Currently processing ', num2str(hazyImgIter), 'th img...']);
    
    HazyImageName = HazyImagePathList(hazyImgIter).name;
    imgHazy = im2single(imread([cfg.dataRoot,HazyImageName]));
    [hei,wid,c] = size(imgHazy);
    
    imgGray = rgb2gray(imgHazy);
    imgR = imresize(imgHazy, [cfg.resizeHeight, cfg.resizeHeight]);
    
    net.blobs('data').reshape([cfg.resizeHeight,cfg.resizeHeight,3,1]);
    net.reshape();
    
    tic;
    im_forward = net.forward({imgR - 0.5});
    timeCost(1,hazyImgIter) = toc;
    
    tR = im_forward{1,1};
    t = imresize(tR, [hei, wid]);
    
    %----estimate A----------
    tSort = sort(t(:), 'ascend');
    t0Idx = max(round(0.01 * length(tSort)), 1);
    t0 = tSort(t0Idx);
    idxCand = find(t <= t0);
    BrightPxls = imgGray(idxCand);
    iBright = (BrightPxls >= max(BrightPxls));
    idxAirPxls = idxCand(iBright);
    Itemp = reshape(imgHazy, hei*wid, c);
    A = mean(Itemp(idxAirPxls, :),1);
    A = reshape(A,1,1,3);
    A = repmat(A, [hei,wid,1]);
    
    %filter and recover
    tGF = fastguidedfilter(imgGray, t, cfg.FastGF.r, cfg.FastGF.epsilon, cfg.FastGF.downScaleFactorGF);
    DehazedImage = (imgHazy - A) ./ (max(0.1, repmat(tGF, [1 1 3]))) + A;
    timeCost(1,hazyImgIter) = toc;
    
    if cfg.isWriteImgs
        imgSaveName = [cfg.resultsRoot, HazyImageName];
        imwrite(uint8(DehazedImage*255), strrep(imgSaveName, '.jpg', '.png'));
    end
    
end
timeCostMu = mean(timeCost(2:end));

log = struct;
log.cfg = cfg;
log.timeCostMu = timeCostMu;

saveName = [cfg.resultsRoot, 'log.mat'];
save(saveName, 'log');

