function prep_reports(cfg,data)
%% PREP_REPORTS
%  Summary of this function goes here

%% Condition extraction report:
%  Generate a CSV file containing information about the number of trial
%  extracted for each condition and subject:

if cfg.conditions.flag && cfg.conditions.report
    
    % Generate table:
    sub = table(cfg.subjects','VariableNames',{'Subjects'});
    con = array2table(data.conditions,'VariableNames',cfg.conditions.names);
    table_conditions = [sub con];
    table_conditions.total = sum(table_conditions{:,2:end},2);
    total = ['Total',num2cell(sum(table_conditions{:,2:end},1),1)];
    table_conditions = [table_conditions;total];
    
    % Save report:
    save_dir = [cfg.datapath filesep 'derivatives' filesep  ...
        cfg.conditions.sdir filesep 'conditions_report.csv'];
    
    writetable(table_conditions,save_dir);
    
end

%% Trial rejection report:
%  Generate a CSV file containing information about the number of trial
%  rejected for each trial rejection procedure and subject:

if cfg.trialrej.report
    
    % Total rejected
    for sub = 1 : length(data.trirej)
        subject = data.trirej{sub}.total;
        field_names = fieldnames(subject);
        
        for field = 1 : length(field_names)
            rejected{sub,field} = subject.(field_names{field})';
        end
    end
    
    % Generate table
    sub = table(cfg.subjects','VariableNames',{'Subjects'});
    trial = array2table(rejected,'VariableNames',field_names);
    table_rejected = [sub, trial];
    
    % Save report:
    save_dir = [cfg.datapath filesep 'derivatives' filesep  ...
        cfg.trialrej.sdir];
    
    writetable(table_rejected,[save_dir filesep 'trirej_report.csv']);
    
    % Save indexes:
    idxs = data.trirej;
    save([save_dir filesep 'trirej_idxs.mat'],'idxs');
    
end
end

