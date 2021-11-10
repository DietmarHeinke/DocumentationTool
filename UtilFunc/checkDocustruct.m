function ret = checkDocustruct(docu)

ret = true;
docufields = fieldnames(docu);
docallowedfields = listDocufields();

if exist('localListDocufield')
    docallowedfields = [localListDocufield() docallowedfields];
end


if length(docufields) > length(docallowedfields)
    warning('not allowed fields in this docu strct');
    ret = false;
else
    if all(isfield(docu, docallowedfields)) ~= 1
        warning('incomplete docu struct')
        ret = false;
    end
    
end

[versMajor, versMinor] = getVersion();

if isfield(docu, 'vers')
    if versMajor > docu.vers.major
        warning('docu file contains struct from an old major version')
        ret = false;
    end
    
    if versMajor ==  docu.vers.major && versMinor > docu.vers.minor
        warning('docu file contains struct from an old Minor version')
        ret = false;
    end
else
    warning('no version info available')
    ret = false;
end


