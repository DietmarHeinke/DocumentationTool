
function installFitting()


mkdir('Models');
path = fullfile(pwd, 'Models');
mkdir(path, 'Priors');

mkdir('Data');
path = fullfile(pwd, 'Data');
mkdir(path, 'ReadData');

mkdir('SetParaFunc');
mkdir('AnaResults');
mkdir('AnaModels');
mkdir('LocalUtil');
mkdir('GraphicsFunc');
mkdir('Outputs')

mkdir('Docus');
path = fullfile(pwd, 'Docus');
mkdir(path, 'Figures');

%mkdir('DEMCMC_Outputs');
global modelling_tools_path
h1 = sprintf('%s%s%s%s%s',modelling_tools_path,filesep, 'DocumentationTool',filesep,'initFittingTemp.m');
copyfile(h1, "initFitting.m")
initFitting
end