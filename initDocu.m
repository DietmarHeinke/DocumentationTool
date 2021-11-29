function ret = initDocu(uid, nosave)
% 
% ret = init_docu(uid, nosave)
%
% 'uid' - sets which set_uid function in UtilFunc is called.
%
% 'nosave' - if nosave doesn't exsit or is zero the function saves the docu
%        struct in a docufile. Otherwise only the structed is returned.
%

global DOCUDIR


lookuptable = uid_lookuptable();
if uid > length(lookuptable)+1
    error('The uid is too far ahead of the existing docus');
end

func = sprintf('set_uid%d', uid);
if (exist(func) ~= 2)
    error('set uid does not exist');
end

ret = createDocustruct();
ret.uid = uid;

eval(sprintf('ret = %s(ret);', func));


if ~exist('nosave', 'var') || nosave == 0
    res = 'y';
    if exist_docufile(uid)
        res = input('Docu file exists! Do you want to overwrite it (y/n)?','s');
        old = load_docufile(ret.filename);
        save(sprintf('%s%s%s_old',DOCUDIR, filesep, old.filename), '-struct', 'old');

    end
    
    if strcmp(res, 'y')
        save_docufile(ret);
    else
        warning('Not saved');
    end
end

end
