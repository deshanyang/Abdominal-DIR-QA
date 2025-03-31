# Abdominal DIR Validation
Dataset of abdominal CT image pairs with labeled blood vessel bifurcations for deformable image registration (DIR) quality assurance.

<img src="https://github.com/user-attachments/assets/7afabfcd-d8b2-4118-89d2-454137d1df53" width="350">
<img src="https://github.com/user-attachments/assets/89b192b8-b370-42e9-af8b-99d6b8aee7e4" width="350">

## Dataset Overview
This dataset contains 30 different cases of abdominal CT image pairs, with a high number of vessel bifurcation landmark pairs identified in each case. This datsaet is the first of its kind in the abdomen, and the landmarks can be used for DIR algorithm validation and quality assurance. By comparing the distance between landmarks in the fixed and deformed moving image after registration, researchers can calculate the target registration error (TRE) of their algorithm. Images are obtained from several publicly available image repositories as well as clinical scans from Barnes Jewish Hospital.

* The presented dataset comprises 30 pairs of intra-patient abdominal-pelvis CT images with various clinical quality.
* Across the 30 cases, a total of 1895 landmark pairs were labeled, averaging ~63 pairs per case
* Landmark identification and pairing accuracy underwent rigorous qauntitative analysis and manual validation.

We hope to publish the results of this study in a dataset article. Due to the size of the image files, the full dataset is saved on our publicly available Zenodo repository at . However, one example image pair with landmarks is included within this Github repository, along with a tutorial in loading and processing this data, to assist researchers in getting started with the dataset. Please see the tutorial folder in this GitHub for more information.

We have published similar datasets in the lung and in the liver. If interested, please see

https://github.com/deshanyang/Lung-DIR-QA

and

https://github.com/deshanyang/Liver-DIR-QA

Some of the image data in the liver dataset overlaps with this dataset. The following table links the case numbers from this dataset to those in our liver dataset. Using both of these in tandem will prove useful to researchers trying to get a comprehensive view on their algorithm accuracy.


| **Abdomen index** | **Liver index** |
|-------------------|-------------|
| Case 1            | Case 4      |
| Case 3            | Case 5      |
| Case 4            | Case 6      |
| Case 5            | Case 7      |
| Case 6            | Case 8      |
| Case 7            | Case 9      |
| Case 8            | Case 11     |
| Case 9            | Case 12     |
| Case 10           | Case 32     |
| Case 11           | Case 33     |
| Case 12           | Case 14     |
| Case 13           | Case 34     |
| Case 14           | Case 17     |
| Case 15           | Case 18     |
| Case 16           | Case 19     |
| Case 17           | Case 20     |
| Case 18           | Case 36     |
| Case 19           | Case 37     |
| Case 20           | Case 24     |
| Case 21           | Case 26     |
| Case 22           | Case 27     |
| Case 24           | Case 28     |
| Case 27           | Case 29     |
| Case 28           | Case 30     |
| Case 30           | Case 40     |


## Dataset Generation
![image](https://github.com/user-attachments/assets/01e9fb3a-d7af-48da-ae57-54f83e0056a1)


The full details of this pathway will be described in the dataset article we hope to publish. In steps of this pathway, we utilized FFDNet, TotalSegmentator, and PTVReg, publicly available tools that are cited at the bottom of this document. 

## Dataset Use
The landmark pairs in this dataset can be used to calculate the target registration error of a DIR algorithm.

### Dataset Organization
The full dataset, available on zenodo, is organized into two formats. The first is a folder containing 30 .mat files. In each of these files is the imaging data for both CT images in a pair, the landmark locations for each image, and the voxelsizes for each image. The imaging data in the .mat files is organized in the dimensions [coronal, sagittal, axial], with the order of the slices in accordance with DICOM formatting [anterior:posterior,right:left,inferior:superior]. Landmark locations are saved as 3 columns of pixel indices, with each column corresponding to the dimensions of the image, in the same order. Image intensity values are saved as Hounsfield units shifted by 1000.

The second format is a folder containing the imaging data in the NIfTI file format, with the landmarks stored in a text file. Each image and its landmarks are stored in its own file, and are labeled by each case. Imaging and landmark data dimensions are in the order [sagittal, coronal, axial], with slice order also in accordance with the DICOM coordinate system [right:left,anterior:posteriorinferior:superior]. Landmark locations are saved as 3 columns of pixel indices, with each column corresponding to the dimensions of the image, in the same order. The NIfTI landmarks are shifted to start at an origin of [0,0,0] instead of the MATLAB standard of [1,1,1]. Image intensity values are still Hounsfield units shifted by 1000.

Below is a table summarizing each image case, its resolution, and the number of landmark pairs. Flagged landmark pairs are those that are not refined but considered to be accurate pairs. For more details, please reference our paper.
| #  | Num of Landmark Pairs (Normal, Flagged) | Image 1 Size       | Image 1 Slice Thickness (mm) | Image 1 In-plane resolution (mm) | Image 2 Size       | Image 2 Slice Thickness (mm) | Image 2 In-plane resolution (mm) |
|----|----------------------------------------|--------------------|------------------------------|-----------------------------------|--------------------|------------------------------|-----------------------------------|
| 1  | 52 (5)                                 | 512, 512, 97       | 2.5                          | 0.82                              | 512, 512, 101      | 2.5                          | 0.82                              |
| 2  | 58 (2)                                 | 512, 512, 111      | 2.5                          | 0.82                              | 512, 512, 113      | 2.5                          | 0.82                              |
| 3  | 52 (5)                                 | 512, 512, 87       | 2.5                          | 0.82                              | 512, 512, 101      | 2.5                          | 0.82                              |
| 4  | 51 (6)                                 | 512, 512, 107      | 2.5                          | 0.70                              | 512, 512, 109      | 2.5                          | 0.70                              |
| 5  | 73 (6)                                 | 512, 512, 129      | 2.5                          | 0.78                              | 512, 512, 292      | 2.5                          | 0.78                              |
| 6  | 47 (7)                                 | 512, 512, 197      | 1.25                         | 0.70                              | 512, 512, 105      | 2.5                          | 0.70                              |
| 7  | 56 (4)                                 | 512, 512, 107      | 2.5                          | 0.78                              | 512, 512, 119      | 2.5                          | 0.78                              |
| 8  | 64 (5)                                 | 512, 512, 103      | 2.5                          | 0.78                              | 512, 512, 117      | 2.5                          | 0.78                              |
| 9  | 114 (8)                                | 512, 512, 129      | 2.5                          | 0.82                              | 512, 512, 113      | 2.5                          | 0.82                              |
| 10 | 42 (1)                                 | 512, 512, 97       | 2.5                          | 0.74                              | 512, 512, 93       | 2.5                          | 0.74                              |
| 11 | 60 (4)                                 | 512, 512, 111      | 2.5                          | 0.86                              | 512, 512, 117      | 2.5                          | 0.86                              |
| 12 | 82 (3)                                 | 512, 512, 107      | 2.5                          | 0.86                              | 512, 512, 121      | 2.5                          | 0.86                              |
| 13 | 50 (6)                                 | 512, 512, 115      | 2.5                          | 0.94                              | 512, 512, 111      | 2.5                          | 0.94                              |
| 14 | 53 (3)                                 | 512, 512, 109      | 2.5                          | 0.70                              | 512, 512, 109      | 2.5                          | 0.70                              |
| 15 | 114 (3)                                | 512, 512, 129      | 2.5                          | 0.78                              | 512, 512, 209      | 2.5                          | 0.78                              |
| 16 | 44 (3)                                 | 512, 512, 181      | 2.5                          | 0.78                              | 512, 512, 115      | 2.5                          | 0.78                              |
| 17 | 72 (6)                                 | 512, 512, 97       | 2.5                          | 0.86                              | 512, 512, 99       | 2.5                          | 0.86                              |
| 18 | 86 (4)                                 | 512, 512, 117      | 2.5                          | 0.90                              | 512, 512, 105      | 2.5                          | 0.90                              |
| 19 | 77 (2)                                 | 512, 512, 101      | 2.5                          | 0.70                              | 512, 512, 109      | 2.5                          | 0.70                              |
| 20 | 62 (2)                                 | 512, 512, 99       | 2.5                          | 0.86                              | 512, 512, 97       | 2.5                          | 0.86                              |
| 21 | 65 (0)                                 | 512, 512, 460      | 1.00                         | 0.98                              | 512, 512, 245      | 2.00                         | 0.87                              |
| 22 | 90 (3)                                 | 512, 512, 221      | 3.00                         | 0.87                              | 512, 512, 227      | 3.00                         | 0.96                              |
| 23 | 58 (2)                                 | 512, 512, 232      | 2.00                         | 0.69                              | 512, 512, 205      | 3.00                         | 0.80                              |
| 24 | 30 (0)                                 | 512, 512, 208      | 2.00                         | 0.68                              | 512, 512, 222      | 2.00                         | 0.66                              |
| 25 | 43 (2)                                 | 512, 512, 158      | 3.00                         | 0.84                              | 512, 512, 167      | 3.00                         | 0.89                              |
| 26 | 56 (3)                                 | 512, 512, 244      | 2.00                         | 0.94                              | 512, 512, 244      | 2.00                         | 0.89                              |
| 27 | 60 (2)                                 | 512, 512, 233      | 2.00                         | 0.75                              | 512, 512, 246      | 2.00                         | 0.73                              |
| 28 | 74 (4)                                 | 512, 512, 324      | 2.00                         | 0.66                              | 512, 512, 319      | 2.00                         | 0.66                              |
| 29 | 71 (1)                                 | 512, 512, 232      | 2.00                         | 0.79                              | 512, 512, 232      | 2.00                         | 0.74                              |
| 30 | 39 (5)                                 | 512, 512, 361      | 3.00                         | 0.78                              | 512, 512, 230      | 3.00                         | 0.76                              |


### Visualizing Landmarks
For those interested in looking at the landmark pairs available in this dataset, we recommend the use of MatchGui (Deshan Yang, 2017). MatchGui is a Matlab based tool, and allows the user to load in both CT images as well as the landmark locations for each image. In this way, users can visualize each landmark pair invidually, with upsampling tools that can help inform the user if the dataset is right for their purposes. There are also functions allowing the user to flag certain landmarks and adjust them if they feel necessary.

![image](https://github.com/user-attachments/assets/30b79ea3-8aab-43d2-a0ee-2ee1b95c74d0)


A screenshot from the MatchGUI interface showing a landmark pair from this dataset.

For more extensive instructions on how to use matchgui, please refer to the tutorial folder in our Github.

## Citing
The image and landmark pair data in this work are publicly available for use in DIR algorithm verification. If you used our work in any way, please cite our Github or our paper.

If you have any further questions about the dataset, please reach out to us at teddy.criscuolo@duke.edu. Thank you!

## Works Cited
TotalSegmentator- https://github.com/wasserth/TotalSegmentator

FFDNet- https://arxiv.org/abs/1710.04026

PTVReg - https://doi.org/10.1109/TMI.2016.2610583

Wasserthal, J., Breit, H.-C., Meyer, M.T., Pradella, M., Hinck, D., Sauter, A.W., Heye, T., Boll, D., Cyriac, J., Yang, S., Bach, M., Segeroth, M., 2023. TotalSegmentator: Robust Segmentation of 104 Anatomic Structures in CT Images. Radiology: Artificial Intelligence. https://doi.org/10.1148/ryai.230024

Isensee, F., Jaeger, P.F., Kohl, S.A.A. et al. nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation. Nat Methods 18, 203–211 (2021). https://doi.org/10.1038/s41592-020-01008-z
V. Vishnevskiy, T. Gass, G. Szekely, C. Tanner and O. Goksel, "Isotropic Total Variation Regularization of Displacements in Parametric Image Registration," in IEEE Transactions on Medical Imaging, vol. 36, no. 2, pp. 385-395, Feb. 2017, doi: 10.1109/TMI.2016.2610583.
