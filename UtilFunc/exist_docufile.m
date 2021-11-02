function ret = exist_docufile(filename)
%
% ret = exist_docufile(file_identifier)
%
global DOCUDIR

if isnumeric(filename)
    n_uid = uid_lookuptable();
    if filename > length(n_uid) || isempty(n_uid{filename}) 
        ret = 0;
    else
        ret = 2;
    end
else
    
    ret = exist(sprintf('%s%s%s.mat',DOCUDIR, filesep, filename), 'file');
    
end