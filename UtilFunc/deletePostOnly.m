function ret = deletePostOnly(uid)
% copies an exisiting docu file to a new one and remove the posterior
% before it is coppied.
% It also sets up a posterior only fitting. 

docu = load_docufile(uid);

docu.post.res=[];
docu.post_from_best = 1;
save_docufile(docu);
ret = docu;
end
