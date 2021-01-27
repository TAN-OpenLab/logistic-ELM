# logistic-ELM
A fast fault diagnosis method for rolling bearings, based on extreme learning machine (ELM) and logistic mapping.
## Introduction

Considering both accuracy and the real-time requirement, we propose a novel fast fault diagnosis method for rolling bearings.

## Function Description

**Extrat14Features.m**: extrat 14 features from the sample data.

**FeatureSelection.m**: select features which have best performance for fault diagnosis by the sequential forward selection (SFS), and combine into the feature matrix.

**FeatureExtractor.m**: extrat the feature matrix from the sample data.

**LogisticMap.m**     : generate the input weights of ELM by Logistic Mapping.

**Logistic_ELM.m**    : diagnose fault type from the feature matrix.

**MainLogisticELM.m** : the main funcion, diagnose fault type from the sample data.

## Dataset

We use the rolling bearing vibration signal dataset prepared by the Case Western Reserve University (CWRU) Bearing Data Centre, and you can get if from http://csegroups.case.edu/bearingdatacenter/home.

We also upload the preprocessed data files here as examples, named **Data_File**.
