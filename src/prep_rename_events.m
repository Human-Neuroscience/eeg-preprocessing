function events = prep_rename_events (events)
%% RENAME_EVENTS
% -------------------------------------------------------------------------
% David Lopez-Garcia
% dlopez@ugr.es
% CIMCYC - University of granada
% -------------------------------------------------------------------------
%
%  This function returns the renamed events:

fprintf('\n<strong> > Renaming events...</strong>\n\n');

for i = 1 : length(events)
    
    str = [];
    
    event_code = events(i).code;
    event_id = events(i).type;
    
    if strcmp(event_code,'Stimulus')
        
        % First digit:
        
        if strcmp(event_id(1),'1')
            str = [str 'manmade'];
        end
        
        if strcmp(event_id(1),'2')
            str = [str 'natural'];
        end
        
        % Second digit:
        
        if strcmp(event_id(2),'0')
            str = [str '-new'];
        end
        
        if strcmp(event_id(2),'1')
            str = [str '-old'];
        end
        
        % Thrid digit:
        
        if strcmp(event_id(3),'1')
            str = [str '-hit'];
        end
        
        if strcmp(event_id(3),'2')
            str = [str '-miss'];
        end
        
        if strcmp(event_id(3),'3')
            str = [str '-false'];
        end
        
        if strcmp(event_id(3),'4')
            str = [str '-correct'];
        end
        
        if strcmp(event_id(3),'9')
            str = [str '-na'];
        end
        
        % Fourth digit:
        
        if strcmp(event_id(4),'0')
            str = [str '-for'];
        end
        
        if strcmp(event_id(4),'1')
            str = [str '-rem'];
        end
        
        if strcmp(event_id(4),'9')
            str = [str '-na'];
        end 
        
        events(i).type = str;
    end
    
end

end