function ret = setModel(ret, modelId)

if ischar(modelId)
    h1 = ret.model;
    modelId = find(strcmp({h1(:).name}, modelId) == 1);
end

if isempty(modelId)
    error('unknown model name.')
end

ret.model = ret.model(modelId);

end