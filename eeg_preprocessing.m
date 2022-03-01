%% ELECTROENCEPHALOGRAPHY PREPROCESSING - (eeg_preproc.m)
% -------------------------------------------------------------------------
% David Lopez-Garcia
% dlopez@ugr.es
% CIMCYC - University of granada
% -------------------------------------------------------------------------
%
%% Notes:
%
% - Run this script section-by-section.
% - EEGLAB should be installed and running to execute this script.
% - Amplifier's online cut-off frecuencies: [0.016-250]Hz
% - Lower cut-off frecuency [s]: Time constant = 10s - fc = 1/2*pi*t
% - See Brain Vision documentation for more details.

%% Automatic EEG preprocessing steps: -
%
% * Preprocessing steps before computing Idependent Component Analysis:
%
%   -  1. Rename events.
%   -  2. Change sampling rate.
%   -  3. Filter data.
%   -  4. Generate epoched dataset
%
% * Independent Component Analysis:
%
%   -  5. Compute ICA.
%   -  6. Delete bad components.
%
% * Rest of the preprocessing pipeline:
%
%   -  7. Automatic trial rejection.
%   -  8. Electrodes interpolation.
%   -  9. Recover reference electrode.
%   - 10. Compute re-reference.
%   - 11. Extract conditions.
%

%% 1. Pre-ICA routine:

clear; clc;
run config
path(path,'src');


% Get the list of subjects to load:
subject_list = get_subject_list(cfg);

for sub = 1 : length(subject_list)
    
    % 0. Select subject id:
    subject = subject_list(sub);
    
    % 1. Load subject data:
    subject_data = load_subject_data(cfg,subject);
    
    % 2. Resample data:
    subject_data = prep_resample(cfg,subject_data);
    
    % 3. Filter data:
    subject_data = prep_filter(cfg,subject_data);
    
    % 4. Generate epochs:
    subject_data = prep_epochdata(cfg,subject_data);
    
end

%% Compute Independent Component Analysis:

clear; clc;
run config

% Get the list of subjects to load:
subject_list = get_subject_list(cfg);

for sub = 1 : length(subject_list)
    
    % 1. Compute ICA:
    prep_computeica(cfg,subject_list(sub));
    
end

%% Delete bad components:
%  Once the ICA analysis is complete you should manually check and indicate
%  in the configuration file the artifactual components to remove or bad
%  channels to interpolate.

clear; clc;
run config

% Get the list of subjects to load:
subject_list = get_subject_list(cfg);

for sub = 1 : length(subject_list)
    
    % 1. Remove bad components:
    prep_remove_components(cfg,subject_list(sub));
    
end

%% Post-ICA routine:

clear; clc;
run config

% Get the list of subjects to load:
subject_list = get_subject_list(cfg);

for sub = 1 : length(subject_list)
    
    % 1. Automatic trial rejection:
    [subject_data,reports.trirej{sub}] = prep_trial_rejection(...
        cfg,subject_list(sub));
    
    % 2. Electrode interpolation:
    subject_data = prep_electrode_interpol(cfg,subject_data);
    
    % 3. Data re-reference:
    subject_data = prep_rereference(cfg,subject_data);
    
    % 4. Extract conditions:
    reports.conditions(sub,:) = prep_extract_conditions(cfg,subject_data);
    
end

% Generate reports:
prep_reports(cfg,reports);


