function ret = delete_docufile(data)
% flag zero means not checking

global DOCUDIR

if isnumeric(data)
    data = load_docufile(data);
end

eval(sprintf('delete(''%s%s%s.mat'')',DOCUDIR, filesep, data.filename));


end
