function updateGuiDocu(hObject, currDocu)

global FIGUREDIR


guihandle = guihandles(hObject);
set(guihandle.text12, 'String', sprintf('%d', currDocu.uid));

set(guihandle.text20, 'String',  currDocu.modTimes{1});
set(guihandle.text22, 'String', currDocu.modTimes{end});

set(guihandle.edit5, 'String', currDocu.param_label);
set(guihandle.edit5, 'enable', 'off');

set(guihandle.edit4, 'String', currDocu.descr.title);
set(guihandle.edit4, 'enable', 'off');

set(guihandle.edit1,'String', currDocu.descr.future);
set(guihandle.edit1, 'enable', 'off');

set(guihandle.edit2, 'String', currDocu.descr.curr);
set(guihandle.edit2, 'enable', 'off');

set(guihandle.edit3, 'String', currDocu.descr.parent);
set(guihandle.edit3, 'enable', 'off');

set(guihandle.uitable1, 'enable', 'off');
set(guihandle.pushbutton2, 'enable', 'off')
set(guihandle.edit1, 'enable', 'on');

set(guihandle.edit7, 'String', currDocu.model.docu);
set(guihandle.edit7, 'enable', 'off');

if ~isempty(currDocu.post.res)
    set(guihandle.pushbutton1, 'enable', 'on');
end

% Format bounds table
set(guihandle.uitable1, 'ColumnName', {'Lower', 'Upper'});
set(guihandle.uitable1, 'RowName', currDocu.model.variableName);
set(guihandle.uitable1, 'Data', currDocu.best.bounds.values');
set(guihandle.uitable1, 'ColumnEditable', logical(1));
set(guihandle.uitable1, 'Enable', 'on');


nChildren = length(currDocu.versPointers.children);
if ~isempty(nChildren) && nChildren >0
    docuFiles = uid_lookuptable();
    for i=1:nChildren
        tempDocu = load_docufile(currDocu.versPointers.children(i));
        list{i} = tempDocu.param_label;
    end
    set(guihandle.listbox2, 'String', list);
    set(guihandle.listbox2, 'Value', nChildren);
    
else
    set(guihandle.listbox2, 'String', '<empty>');
    set(guihandle.listbox2, 'Value', 1);
    
end


delete(get(guihandle.uipanel2, 'Children'));

if isfield(currDocu.post, 'nfigure')
    n = length(currDocu.post.nfigure);
    if n > 0
        file = sprintf('%s%s%s',FIGUREDIR, filesep,currDocu.post.nfigure{end}.figureFilename);
        h = openfig(file, 'invisible');
        copyobj(get(h,'Children'),guihandle.uipanel2)
        set(guihandle.uipanel2, 'HandleVisibility','on');
        
    end
% else
end

end


