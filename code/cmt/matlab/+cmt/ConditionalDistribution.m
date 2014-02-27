classdef (Abstract) ConditionalDistribution < cmt.MexInterface
    properties (Dependent, SetAccess = private)
        dimIn;
        dimOut;
    end
    
    methods
        function self = ConditionalDistribution(varargin)
            self@cmt.MexInterface(varargin{:});
        end
        
        
        function v = get.dimIn(self)
            v = self.mexEval('dimIn');
        end
        
        function v = get.dimOut(self)
            v = self.mexEval('dimOut');
        end
        
        
        function value = sample(self, input)
            value = self.mexEval('sample', input);
        end
        
        function value = predict(self, input)
            value = self.mexEval('predict', input);
        end
        
        function value = logLikelihood(self, input, output)
            value = self.mexEval('logLikelihood', input, output);
        end
            
        function loglikelihood = evaluate(self, input, output)
            loglikelihood = self.mexEval('train', input, output);
        end
    end
end