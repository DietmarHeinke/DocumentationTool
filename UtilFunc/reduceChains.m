function docu = reduceChains(uid, remainingChain, nosave)

if ~exist('uid')
    uid_table = uid_lookuptable();
    
    n = length(uid_table);
else
    
    if isnumeric(uid)
        n = uid;
        docu = load_docufile(n);
    else
        docu = uid;
    end
end
[nChain, nParam] = size(docu.best.res.finalPop);
iChain = randi(nChain, remainingChain,1);
docu.best.res.finalPop = docu.best.res.finalPop(iChain,:);
docu.best.res.finalgof = docu.best.res.finalgof(iChain);

if ~exit('nosave')
    save_docufile(docu);
end
end