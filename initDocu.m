function ret = initDocu(uid, nosave, dataUID, setParaFunc)
%
% ret = init_docu(uid, nosave, setParaFunc)
%
% uid - sets which set_uid function in UtilFunc is called.
%
% nosave - if nosave doesn't exsit or is zero the function saves the docu
%        struct in a docufile. Otherwise only the structed is returned.
%
% setParaFunc - @(docu) func(docu, own parameters) if this parameter exists it will get initDocu to call this
% function to set parameter instead of the default set_uid-functions.
%

global DOCUDIR



ret = createDocustruct();
ret.uid = uid;
ret.data.selector = createAllSelectors(dataUID);
ret.model = createAllModels();




if ~exist('setParaFunc','var')
    func = sprintf('set_uid%d', uid);
    if (exist(func) ~= 2)
        error('set uid does not exist');
    end
    func = @(x) feval(func, x);
    ret = func(ret);
else
%   func = @(x) feval(setParaFunc, x);
    ret = setParaFunc(ret,dataUID);
end



folder = strcat(DOCUDIR,filesep,ret.data.selector.dataset,filesep,ret.model.name,filesep);
if ~exist(folder)
    mkdir(folder)
end
lookuptable = uid_lookuptable(folder);
if uid > length(lookuptable)+1
    error('The uid is too far ahead of the existing docus');
end


%ret = func(ret);
%eval(sprintf('ret = %s(ret);', func));


if ~exist('nosave', 'var') || nosave == 0
    res = 'y';
    [flag, filename] = exist_docufile(uid);
    if flag
        res = input('Docu file exists! Do you want to overwrite it (y/n)?','s');

        old = load_docufile(filename);
        save(sprintf('%s%s%s%s%s_old',DOCUDIR, filesep,folder,filesep, old.filename), '-struct', 'old');

    end

    if strcmp(res, 'y')
        save_docufile(ret,folder);
    else
        warning('Not saved');
    end
end

end
