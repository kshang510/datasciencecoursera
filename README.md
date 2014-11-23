---
title: "README.md"
author: "Kay Shang"
date: "November 23, 2014"
output: html_document
---
Synopsis:
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

Work Flow:
1. Download the data from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Unzip/installed data files in working directory
3. Create run_abalysis.R with below steps:
   - Input data files
   - Combine 3 data files into one data frame for test data 
   - Repeat the above step for train data
   - Combind testData & trainData into one dataFrame, mData then extract mean & standard
   - Reshape mData with the average of each variable for each activity and each subject
   - Write the result dataset into a text file

Tests:
   - source in run_analysis.R then execute
   - check the output text file "tidyData.txt" is generated in working directory


