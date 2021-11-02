function docu = deleteData(uid, nosave)

if ~exist('uid')
    uid_table = uid_lookuptable();
    
    n = length(uid_table);
    docu = load_docufile(n);
else
    if isnumeric(uid)
        n = uid;
        docu = load_docufile(n);
    else
        docu = uid;
    end
end

docu.best.res = [];
docu.post.res = [];
docu.post_from_best = 0;

if ~exist('nosave')
save_docufile(docu);
end
end