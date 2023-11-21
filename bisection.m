% COPYRIGHT (C) 2023; SAAD ISLAM AMEI ALL RIGHTS RESERVED.
% 
% REDISTRIBUTION AND USE IN SOURCE AND BINARY FORMS, WITH OR WITHOUT MODIFI
% CATION, ARE PERMITTED PROVIDED THAT THE FOLLOWING CONDITIONS ARE MET:
% 
%    *   REDISTRIBUTIONS OF SOURCE CODE MUST RETAIN THE ABOVE COPYRIGHT NOT
%        ICE, THIS LIST OF CONDITIONS AND THE FOLLOWING DISCLAIMER.
%    *   REDISTRIBUTIONS IN BINARY FORM MUST REPRODUCE THE ABOVE COPYRIGHT  
%        NOTICE, THIS LIST OF CONDITIONS AND THE FOLLOWING DISCLAIMER IN TH
%        E DOCUMENTATION AND/OR OTHER MATERIALS PROVIDED WITH THE DISTRIBUT
%        ION.
% 
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS I
% S" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, 
% THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PU
% RPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUT
% ORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, O
% R CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SU
% BSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS IN
% TERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CON
% TRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARIS
% ING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE PO
% SSIBILITY OF SUCH DAMAGE.

function [out] = bisection(func, a, b, TOL, N0)
% This functions finds a solution to f (x) = 0 given the continuous function 
% f on the interval [a, b], where f (a) and f (b) have opposite signs
% INPUT endpoints a, b; tolerance TOL; maximum number of iterations N0.
% OUTPUT approximate solution p or message of failure.

% Step 1 Set i = 1;
%   FA = f (a).
i = 1;
FA = func(a);
% Step 2 While i ≤ N0 do Steps 3–6.
while i < N0
    % Step 3 Set p = a + (b − a)/2; (Compute pi.)
    %   FP = f(p).
    p = a+(b-a)/2;
    FP = func(p);
    % Step 4 If FP = 0 or (b − a)/2 < TOL then
    %   OUTPUT (p); (Procedure completed successfully.)
    %   STOP.
    if FP == 0 || (b-a)/2 < TOL
        out = p; 
        return; 
    end
    % Step 5 Set i = i + 1.
    i=i+1;
    % Step 6 If FA · FP > 0 then set a = p; (Compute ai, bi.)
    %                           FA = FP
    %                       else set b = p. (FA is unchanged.)
    if FA*FP > 0
        a = p;
    else
        b = p;
    end
end
% Step 7 OUTPUT (‘Method failed after N0 iterations, N0 =’, N0);
% (The procedure was unsuccessful.)
% STOP.
fprintf('Method failed after N0 iterations, N0 = %d\n', N0);
return;
end