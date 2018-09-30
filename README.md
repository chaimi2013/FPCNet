# FPCNet
Fully Point-wise Convolutional Neural Network[1]


## Installation
    install caffe master and compile matlab interface

## Folder Structure
    Root
        -data
            Folder containing hazy images
        -models
    	    caffelmodel and deploy file of the FPCNet_DH
	    -results
		    Folder containing dehazed results
	    -utils
		    -fast-guided-filter
			    fast guided filter code[2]
		    -index
			    psnr and ssim code[3]
	    -testDemoFPCNet_DH.m
	    	main body of the demo script
## Quick Start
    testDemoFPCNet_DH.m
        -configure the following variables, 
            -"MatCaffeRoot":, path to the matlab interface of caffe
            -"gpu_mode"；1 for gpu and 0 for cpu
    
    run testDemoFPCNet_DH.m
    
    *you'll get the dehazed results in "./results/"
    
    *The codes have been tested based on the Matlab Interface of CAFFE, which is compiled with Cuda8.0 and Cudnn v5 and Ubuntu 16.04.

## Reference: 

    [1]. Zhang J., Cao Y., Wang Y., Wen C.,  Chen C.W. Fully Point-wise Convolutional Neural Network for Modeling Statistical Regularities in Natural Images. In Proceedings of the 2018 ACM Multimedia Conference. 2018.
    
    [2]. Fast guided filter, [Kaiming He](http://kaiminghe.com/eccv10/index.html)
    
    [3]. A Benchmark for Single Image Dehazing, [RESIDE](https://sites.google.com/view/reside-dehaze-datasets)

## Citation
Please cite our paper in your publications if it helps your research:

    @inproceedings{zhang2018fpcnet,
      title={Fully Point-wise Convolutional Neural Network for Modeling Statistical Regularities in Natural Images},
      author={Zhang, Jing and Cao, Yang and Wang, Yang and Wen, Chenglin and Chen, Chang Wen},
      booktitle={ACM Multimedia Conference},
      year={2018}
    }

## Contact
[Email](zj.winner@163.com)
