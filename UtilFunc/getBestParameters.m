% prints Log Likelihoods from an array of uid's 

function parameters = getBestParameters(uid)
    nUid = length(uid);
    bestp = [];
    parameters =[];
    for iUid=1:nUid
        docu = load_docufile(uid(iUid));
        if isempty(docu.best.res.bp)
            error('no posterior results in docu-file');
        end
        bestp = [iUid, docu.best.res.bp()];
        parameters = [parameters; bestp];       
    end
end