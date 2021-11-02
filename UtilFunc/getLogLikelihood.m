% prints Log Likelihoods from an array of uid's 

function logLikelihood = getLogLikelihood(uid)
    nUid = length(uid);
    gl = [];
    logLikelihood =[];
    for iUid=1:nUid
        docu = load_docufile(uid(iUid));
        if isempty(docu.best.res.bg)
            error('no posterior results in docu-file');
        end
        gl = [iUid, docu.best.res.bg()];
        logLikelihood = [logLikelihood; gl];       
    end
end