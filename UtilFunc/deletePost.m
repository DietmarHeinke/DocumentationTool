function docu = deletePost(uid, nosave)
% copies an exisiting docu file to a new one and remove the posterior
% before it is coppied.
% It also sets up a posterior only fitting.

if isnumeric(uid)
    docu = load_docufile(uid);
else
    docu = uid;
    uid = docu.uid;
end
% Meta info
docu.descr.parent = 'Created best fits';
docu.descr.curr = 'focus on posterior sampling';
docu.descr.future =' ';

docu.versPointers.parent = uid;


docu.post.res=[];
docu.post_from_best = 1;
docu.uid = length(uid_lookuptable())+1;

% adds a decription to the parent fit
addDescrFuture(docu.versPointers.parent, 'used for posterior sampling');
add_child(docu.data.selector.label, docu.model.name, uid, docu.param_label, docu.param_label, docu.versPointers.parent);

docu.filename = gen_docufilename(docu.model.name, docu.data.selector.label, docu.param_label, docu.uid);
docu.post.demcmc_para.outputfile = gen_demcmcoutputfile(docu.param_label, docu.model.name, docu.data.selector.label, docu.uid, 2);

if ~exist('nosave')
  save_docufile(docu);
end

end
