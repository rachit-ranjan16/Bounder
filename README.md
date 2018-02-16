# Bounder
## Faster RCNN
### EEL6953 Big Data Exosystems
#### Programming Assignment 1

## Overview
Object Detection has always been an important problem in Computer Vision. This repo deals with using Faster R-CNN algorithm to detect Images

## Design
- Deployed on Microsoft <a href="https://azuremarketplace.microsoft.com/en-us/marketplace/apps/microsoft-ads.dsvm-deep-learning">Azure</a> **Deep Learning VM**
  - Created a Deep Learning VM from Azure Dashboard with default settings
- Write Once Use Multiple Times Automation scripts for installing all dependencies in the VM
  - `AzureShellBootstrap.sh`
- Config Details stored in `tools`
- Input and Output Images are contained in `input` and `output` respectively
- Followed <a href="design/Programming-Assignment-1-CV.pdf">Assignment Instructions</a>

## References
- <a href="https://github.com/rbgirshick/py-faster-rcnn">Faster RCNN Python Codebase</a>
- <a href="https://chunml.github.io/ChunML.github.io/project/Installing-Caffe-CPU-Only/"> Caffe Installation Tutorials</a>
- <a href="design/Programming-Assignment-1-CV.pdf">Assignment Instructions</a>
- <a href="http://caffe.berkeleyvision.org/">Caffe Documentation</a>
