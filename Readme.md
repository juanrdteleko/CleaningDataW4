=========================================================
=========================================================

Study based on the job of Human Activity Recognition Using Smartphones
Dataset Version 1.0
==================================================================

==================================================================

The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six
activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING,
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz. The experiments have been video-recorded to label the data
manually. The obtained dataset has been randomly partitioned into two
sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain. See
‘features\_info.txt’ for more details.

For each record it is provided:
======================================

- a dataset with the mean and standard deviation for some variables described in codebook_average
- A codebook called codebook_average explaning the whole dataset, the meaing of each column and measurements
- From the 561 vector provided, only the sd and mean signals have been taken. Grouped by suject and activity the mean has been done for each variable.
- 79 variable and 180 measurements. The first two columns represents the subject id and the activiy description.

Origin of the data:
===================

-   Triaxial acceleration from the accelerometer (total acceleration)
    and the estimated body acceleration.
-   Triaxial Angular velocity from the gyroscope.
-   A 561-feature vector with time and frequency domain variables.
-   Its activity label.
-   An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

-   ‘README.txt’

-   ‘codebook\_average.md’: Shows information about the variables used
    on the dataset.

-   ‘run\_anlisys.R’: Script to obtain the final dataset

The following files are available for the train and test data. Their
descriptions are equivalent.

-   ‘train/subject\_train.txt’: Each row identifies the subject who
    performed the activity for each window sample. Its range is from 1
    to 30.

-   ‘train/Inertial Signals/total\_acc\_x\_train.txt’: The acceleration
    signal from the smartphone accelerometer X axis in standard gravity
    units ‘g’. Every row shows a 128 element vector. The same
    description applies for the ‘total\_acc\_x\_train.txt’ and
    ‘total\_acc\_z\_train.txt’ files for the Y and Z axis.

-   ‘train/Inertial Signals/body\_acc\_x\_train.txt’: The body
    acceleration signal obtained by subtracting the gravity from the
    total acceleration.

-   ‘train/Inertial Signals/body\_gyro\_x\_train.txt’: The angular
    velocity vector measured by the gyroscope for each window sample.
    The units are radians/second.

Notes:
======

-   Features are normalized and bounded within \[-1,1\].
-   Each feature vector is a row on the text file.

For more information about this dataset contact:
<a href="mailto:activityrecognition@smartlab.ws" class="email">activityrecognition@smartlab.ws</a>

License:
========

Use of this dataset in publications must be acknowledged by referencing
the following publication \[1\]

\[1\] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and
Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a
Multiclass Hardware-Friendly Support Vector Machine. International
Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz,
Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or
explicit can be addressed to the authors or their institutions for its
use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita.
November 2012.

R Markdown
----------

This is an R Markdown document. Markdown is a simple formatting syntax
for authoring HTML, PDF, and MS Word documents. For more details on
using R Markdown see
<a href="http://rmarkdown.rstudio.com" class="uri">http://rmarkdown.rstudio.com</a>.

When you click the **Knit** button a document will be generated that
includes both content as well as the output of any embedded R code
chunks within the document. You can embed an R code chunk like this:

    summary(cars)

    ##      speed           dist       
    ##  Min.   : 4.0   Min.   :  2.00  
    ##  1st Qu.:12.0   1st Qu.: 26.00  
    ##  Median :15.0   Median : 36.00  
    ##  Mean   :15.4   Mean   : 42.98  
    ##  3rd Qu.:19.0   3rd Qu.: 56.00  
    ##  Max.   :25.0   Max.   :120.00

Including Plots
---------------

You can also embed plots, for example:

![](Readme_files/figure-markdown_strict/pressure-1.png)

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.
