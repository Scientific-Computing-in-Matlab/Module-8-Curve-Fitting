function firingRate = neuralResponse(stimulus,varargin)
% Calculate the (noisy) response of a simulated neuron to a sensory input.
% 
% INPUT
% stimulus = The stimulus strength  [0 1]
% The other inputs are parm/value pairs:
% 'noise'   - The noise level
% 'spontaneous' - the spontaneous firing rate
% 'model'  - The relation between stimulus and rate that we're modeling.
% OUTPUT
% firingRate - One value per stimulus
% 
 p=inputParser;
 p.addParameter('noise',0,@isnumeric);
 
 p.addParameter('spontaneous',10,@isnumeric);
 p.addParameter('model','increase',@ischar);
 p.parse(varargin{:});
 
 nrStimuli = numel(stimulus);
 nrNoise   = numel(p.Results.noise);
stimulus = repmat(stimulus(:),[1 nrNoise]);
noise  =  repmat(p.Results.noise(:)',[nrStimuli 1]);

 switch upper(p.Results.model)
     case 'INCREASE'
        firingRate = stimulus  + p.Results.spontaneous+ +noise.*randn(nrStimuli,nrNoise); 
        
     case 'DECREASE'
        firingRate = -stimulus  + p.Results.spontaneous+ +noise.*randn(nrStimuli,nrNoise); 
     case 'TUNED'
         firingRate = -5*(0.5-stimulus).^2  + p.Results.spontaneous+ +noise.*randn(nrStimuli,nrNoise); 
     case 'SIGMOID'
         firingRate = (1-exp(-(stimulus-0.5)/.05))./(1+exp(-(stimulus-0.5)/.05))  + p.Results.spontaneous+ +noise.*randn(nrStimuli,nrNoise); 
     otherwise
         error(['Unknown Model: ' p.Results.model])
 end
 
 firingRate(firingRate<0) = 0;