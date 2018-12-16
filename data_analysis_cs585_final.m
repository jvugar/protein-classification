clc; clear all; close all;

% image=imread('000a6c98-bb9b-11e8-b2b9-ac1f6b6435d0_blue.png');

predicted_labels_orig=importdata('training_predicted.csv');

pred_label=zeros(size(predicted_labels_orig.data,1),size(predicted_labels_orig.data,2));

pred_label(predicted_labels_orig.data == 1)=1;
pred_label(predicted_labels_orig.data ~= 1)=0;

a=sum(sum(pred_label));

true_labels_orig=importdata('train_true.csv');

b=sum(sum(true_labels_orig.data));


matching_labels(true_labels_orig.data==pred_label & true_labels_orig.data==1 )=1;

matching_labels_zeros(true_labels_orig.data==pred_label & true_labels_orig.data==0 )=1;

true_pos=sum(sum(matching_labels));

true_neg=sum(sum(matching_labels_zeros));

false_pos=a-true_pos;

false_neg=b-true_pos;


CCR=(true_pos+true_neg)/(true_pos+true_neg+false_pos+false_neg);

precision=true_pos/(true_pos+false_pos);

recall=true_pos/(true_pos+false_neg);

F_1_score= 2*precision*recall/(precision+recall);