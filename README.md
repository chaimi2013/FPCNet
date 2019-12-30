# FPCNet
[Fully Point-wise Convolutional Neural Network](https://chaimi2013.github.io/Research/FPC/index.html)


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
			    fast guided filter code[1]
		    -index
			    psnr and ssim code[2]
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
    
[1]. Fast guided filter, [Kaiming He](http://kaiminghe.com/eccv10/index.html)
    
[2]. A Benchmark for Single Image Dehazing, [RESIDE](https://sites.google.com/view/reside-dehaze-datasets)

## Citation
Please cite our paper in your publications if it helps your research:

    @inproceedings{zhang2018fpcnet,
      title={Fully Point-wise Convolutional Neural Network for Modeling Statistical Regularities in Natural Images},
      author={Zhang, Jing and Cao, Yang and Wang, Yang and Wen, Chenglin and Chen, Chang Wen},
      booktitle={ACM Multimedia Conference},
      year={2018}
    }

## Related Work
[1]. FAMED-Net: A Fast and Accurate Multi-scale End-to-end Dehazing Network. [FAMED-Net: Project, ](https://chaimi2013.github.io/Research/FAMED-Net/)
    [FAMED-Net: github](https://github.com/chaimi2013/FAMED-Net)
    
[2]. Fully Point-wise Convolutional Neural Network for Modeling Statistical Regularities in Natural Images. [FPC-Net: Project, ](https://chaimi2013.github.io/Research/FPC/index.html)
    [FPC-Net: github](https://github.com/chaimi2013/FPCNet)
    
[3]. Fast Haze Removal for Nighttime Image Using Maximum Reflectance Prior. [MRP_CVPR: Project,](https://chaimi2013.github.io/Research/NighttimeDehazing/index.html)
    [MRP_CVPR: github](https://github.com/chaimi2013/MRP)

## Contact
[Email](zj.winner@163.com)
