function data = load_subject_data(cfg,subject)
%% LOAD_SUBJECT_DATA
% -------------------------------------------------------------------------
% David Lopez-Garcia
% dlopez@ugr.es
% CIMCYC - University of granada
% -------------------------------------------------------------------------
%
%  This function returns the eeglab data structure for the specified
%  subject.

fprintf(['\n<strong> > Loading subject: ' subject.id '</strong>\n\n']);

% Search the .vhdr file:
file = dir([subject.dir filesep 'sub*.vhdr']);

% If vhdr file is found, load subject data:
if size(file,1)
    
    % Load subject data:
    first_sample_to_read = 1;
    data = pop_loadbv(subject.dir, file(1).name, first_sample_to_read,...
        cfg.chantoload);
    
else
    
    % Search .set file:
    file = dir([subject.dir filesep 'sub*.set']);
    
    if size(file,1)
        % Load subject data:
        data = pop_loadset('filename',file(1).name,...
            'filepath',subject.dir);
    else
        % Send warning:
        exit([subject.id ' - File not found!']);
    end
    
end

%% Import location

if cfg.importchanloc
    
    fprintf('\n<strong> > Importing channel locations...</strong>\n\n');
    
    chanlocs = readtable('chanlocs_ced.txt');
    tableloc = struct2table(data.chanlocs);
    tableloc{:,3:10} = num2cell(chanlocs{:,4:11});
    data.chanlocs = table2struct(tableloc);
    data = pop_select(data, 'nochannel', [30]);
end

%% Add subject information to data structure:

[~,file,~] = fileparts(file(1).name);
subject.filename = file;
data.subject = subject;

%% Rename events if needed:
if cfg.rename; data.event = prep_rename_events(data.event); end


end

