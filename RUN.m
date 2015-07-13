%% This code is reffered
%% "Image Generation Using Bidirectional Integral Feature for Face Recognition with a Single Sample per Person."
%% Lee YG, Lee MS and Choi SI (2015), Plos One
%% Specification for parameters
% MeanInim.mat : Mean Face of Training Set
% Feature_sub.mat : Bidirectional Integral Features

clc; clear all; close all;
addpath('features')
addpath('source')
addpath('testImgs')

load MeanInim.mat
load Feature_sub.mat

r = 80; c = 80;     % size of image

%% Bidirectional Integral Features
figure(1)
MeanSet = [];
BIF = [];
for i = 1 : size(Feature,3)
    if i ~= 4
        MeanSet = [MeanSet B(:,:,i)];
        BIF = [BIF normal(Feature(:,:,i))];
    end
end
subplot(2,1,1);imshow(MeanSet);title('Average Bidirectional Integral Images','fontweight','bold','fontsize', 12); hold on
subplot(2,1,2);imshow(BIF);title('Bidirectional Integral Features','fontweight','bold','fontsize', 12); hold on

%% Images Generation
figure(2)
img_str = 'test1.bmp'; % test1.bmp or test2.bmp
test_img = double(imread(img_str));

GenImg = [];
HistGenImg = [];
for i = 1 : 7
    tmp_GenImg = test_img .* Feature(:,:,i);
    GenImg = [GenImg uint8(tmp_GenImg)];
    HistGenImg = [HistGenImg histeq(uint8(tmp_GenImg))];
end
subplot(2,1,1);imshow(GenImg);title('Generated Images','fontweight','bold','fontsize', 12); hold on
subplot(2,1,2);imshow(HistGenImg);title('Histogram Equalization Result for Generated Images','fontweight','bold','fontsize', 12); hold on