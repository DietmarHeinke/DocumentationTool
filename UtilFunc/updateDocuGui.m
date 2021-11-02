function newDocu = updateDocuGui(hObject, currDocu)

guihandle = guihandles(hObject);
newDocu = init_defaults('JB', model_id, set(guihandle.edit5, 'String'), uid);


% NEW UID needed
newDocu.uid = next_uid;
newDocu.model.name = set(guihandle.text9, 'String');


newDocu.descr.title = set(guihandle.edit4, 'String');
newDocu.descr.future = set(guihandle.edit1,'String');
newDocu.descr.curr = set(guihandle.edit2, 'String');

newDocu.descr.parent = currDocu.uid;
newDocu.descr.parent_param_label = currDocu.param_label;

newDocu.children=[];
newDocu.children_param_label={};

newDocu.best_parent_param_label = '';
newDocu.best_parent = 0;

% Something missing
%set(guihandle.edit3, 'String', newDocu.descr.parent);
currDocu.children = [currDoc.children 
nChildren = length(newDocu.children);
if nChildren >0
    docuFiles = uid_lookuptable();
    for i=1:nChildren
        tempDocu = load_docufile(newDocu.children(i));
        list{i} = tempDocu.param_label;
    end
    set(guihandle.listbox2, 'String', list);
else
    set(guihandle.listbox2, 'String', '<empty>');
end

if isfield(newDocu.post, 'nfigure')
    n = length(newDocu.post.nfigure);
    if n > 0
        file = sprintf('./Figures/fig%d_%d', newDocu.uid, n);
        h = openfig(file, 'invisible');
        copyobj(get(h,'Children'),guihandle.uipanel2)

    end
end
end
