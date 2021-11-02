
function initDocuTool()

% paths to ModelFitting_Skeleton
home = fileparts(mfilename('fullpath'));
addpath(fullfile(home, 'UtilFunc'));


% paths local 
addpath(fullfile(pwd, 'Models'));
%addpath(fullfile(pwd, 'Models/Priors'));
addpath(fullfile(pwd, 'Data/ReadData'));
addpath(fullfile(pwd, 'SetParaFunc'));
addpath(fullfile(pwd, 'AnaResults'));

addpath(fullfile(pwd, 'LocalUtil'));
addpath(fullfile(pwd, 'GraphicsFunc'));




global DOCUDIR
global FIGUREDIR

DOCUDIR = fullfile(pwd, 'Docus');
FIGUREDIR = fullfile(pwd, 'Docus/Figures');

global versMajor
versMajor = 3;

global versMinor
versMinor = 0;


if ~exist('all_models.mat', 'file')
    error('all_models file does not exist');
end

if ~exist('all_selectors.mat', 'file')
    error('all_selectors file does not exist');
end
