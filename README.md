# eeg-preprocessing
This repository contains a set of preprocessing routines for EEG signals. 

**Notes:** 
 - EEGLAB should be installed and running to execute this script.
 - BVA-io plug-in for EEGLAB should be installed in order to load Brain Vision Analyzer EEG data files.

# Automatic EEG preprocessing steps:

### Preprocessing steps before computing Idependent Component Analysis:

 - Rename events.
 - Change sampling rate.
 - Filter data.
 - Generate epoched dataset

### Independent Component Analysis:

 - Compute ICA.
 - Delete bad components.

### Rest of the preprocessing pipeline:

 - Automatic trial rejection.
 - Electrodes interpolation.
 - Recover reference electrode.
 - Compute re-reference.
 - Extract conditions.
