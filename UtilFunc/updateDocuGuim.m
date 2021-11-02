function updateGuiDocu(hObject, currDocu)

guihandle = guihandles(hObject);
set(guihandle.text12, 'String', sprintf('%d', currDocu.uid));
set(guihandle.text9, 'String', currDocu.model.name);
set(guihandle.edit5, 'String', currDocu.param_label);
set(guihandle.edit4, 'String', currDocu.descr.title);
set(guihandle.edit1,'String', currDocu.descr.future);
set(guihandle.edit2, 'String', currDocu.descr.curr);
set(guihandle.edit3, 'String', currDocu.descr.parent);

nChildren = length(currDocu.children);
if nChildren >0
    docuFiles = uid_lookuptable();
    for i=1:nChildren
        tempDocu = load_docufile(currDocu.children(i));
        list{i} = tempDocu.param_label;
    end
    set(guihandle.listbox2, 'String', list);
else
    set(guihandle.listbox2, 'String', '<empty>');
end

if isfield(currDocu.post, 'nfigure')
    n = length(currDocu.post.nfigure);
    if n > 0
        file = sprintf('./Figures/fig%d_%d', currDocu.uid, n);
        h = openfig(file, 'invisible');
        copyobj(get(h,'Children'),guihandle.uipanel2)

    end
end
end
