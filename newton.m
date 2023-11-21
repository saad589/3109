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

function [out] = newton(func, funcprime, p0, TOL, N0)
% This functions finds a solution to f (x) = 0 given an initial approximation p0:
% INPUT initial approximation p0; tolerance TOL; maximum number of iterations N0.
% OUTPUT approximate solution p or message of failure.

% Step 1 Set i = 1.
i = 1; 

% Step 2 While i ≤ N0 do Steps 3–6.
while i < N0
    % Step 3 Set p = p0 − f(p0)/f'(p0). (Compute pi.)
    p = p0 - func(p0)/funcprime(p0);
    % Step 4 If | p − p0| < TOL then
    % OUTPUT (p); (The procedure was successful.)
    % STOP.
    if abs(p-p0) < TOL
        out = p; 
        return;
    end
    % Step 5 Set i = i + 1.
    i = i + 1;
    % Step 6 Set p0 = p. (Update p0.)
    p0 = p;
end
% Step 7 OUTPUT (‘The method failed after N0 iterations, N0 =’, N0);
% (The procedure was unsuccessful.)
% STOP.
fprintf('Method failed after N0 iterations, N0 = %d\n', N0);
return;
end