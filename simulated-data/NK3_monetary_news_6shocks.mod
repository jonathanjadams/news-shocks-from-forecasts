%----------------------------------------------------------------
% This Dynare file solves and simulates the 3 equation New Keyensian
% model with unusual information structure featured in Section 5 of
% Adams and Barrett (2022): Shocks to Inflation Expectations
%----------------------------------------------------------------


%define whether periods are monthly or quarterly;  %set to 1 for quarterly, and 0 for monthly

@#ifndef quarterly
@#define quarterly=0					
@#endif


var y           	                    (long_name='output')
	pi          	                    (long_name='inflation')
    i            	                    (long_name='nominal interest rate')
    h           	                    (long_name='AR(1) monetary policy residual process')	
	fy									(long_name='output forecast')
	fpi									(long_name='inflation forecast')
	fi									(long_name='interest rate forecast')
	;

varexo  eps_xnews  					   	(long_name='cost-push news shock')
		eps_x  					   		(long_name='cost-push shock')
        eps_znews       				(long_name='preference news shock')
        eps_z       				    (long_name='preference shock')
		eps_v							(long_name='policy news shock')
		eps_u							(long_name='policy surprise shock')		
		;

parameters alppha       ${\alpha}$      (long_name='capital share')
    betta               ${\beta}$       (long_name='discount factor')
    rho_h       		${\rho_{\nu}}$  (long_name='autocorrelation monetary policy residual')
    siggma              ${\sigma}$      (long_name='inverse EIS')
    varphi              ${\varphi}$     (long_name='inverse Frisch elasticity')
    phi_pi              ${\phi_{\pi}}$  (long_name='inflation feedback Taylor Rule')
    phi_y               ${\phi_{y}}$    (long_name='output feedback Taylor Rule')
    eta                 ${\eta}$        (long_name='semi-elasticity of money demand')
    epsilon             ${\epsilon}$    (long_name='demand elasticity')
    theta               ${\theta}$      (long_name='Calvo parameter')
	piycorr								(long_name='inflation-income sentiment covariance')
	sigma_u 			    			(long_name='std. dev. monetary policy surprise')
	sigma_v 			    			(long_name='std. dev. monetary policy news')	
	sigma_x 			    			(long_name='std. dev. cost-push shock')	
	sigma_z 						    (long_name='std. dev. demand shock')
	sigma_xnews  			    		(long_name='std. dev. cost-push news shock')	
	sigma_znews  						(long_name='std. dev. demand news shock')	
	var_news			    			(long_name='implied news variance')
	var_surprise					    (long_name='implied innovation variance')
    ;
	
%----------------------------------------------------------------
% Parametrization (largely following Gali 2008)
%----------------------------------------------------------------
siggma = 1;
varphi = 1;

% Scale stochastic processes depending on the time frequency:
	@#if quarterly==1
	timescale = 1;			% 1 = quarterly,
	@#else
	timescale = 1/3; 		% 1/3 = monthly
	@#endif

theta=3/4;
rho_h = .2^timescale; %0.5^timescale;
if exist('rho_zeta_value','var')==1
	set_param_value('rho_zeta',rho_zeta_value);  %for looping over rho_zeta values
end
phi_pi = 1.5;
phi_y  = 0;
betta  = 0.99^timescale;
eta  = 3.77; 
alppha=1/3;
epsilon=6;

sigma_u = sqrt(.5); % sqrt(.25);
sigma_v = sqrt(.5); %sqrt(1 - sigma_u^2); %sqrt(.5);
sigma_x = sqrt(2/3);
sigma_z = sqrt(3/4);
sigma_xnews = sqrt(1/3);
sigma_znews = sqrt(1/4);
	

piycorr = -9;
	
%----------------------------------------------------------------
% Equilibrium Conditions
%----------------------------------------------------------------

model(linear); 

//Composite parameters
#Omega=(1-alppha)/(1-alppha+alppha*epsilon);        %defined on Gali page 60
#psi_n_ya=(1+varphi)/(siggma*(1-alppha)+varphi+alppha);   %defined on Gali page 62
#lambda=(1-theta)*(1-betta*theta)/theta*Omega;      %defined on Gali page 61
#kappa=lambda*(siggma+(varphi+alppha)/(1-alppha));     %defined on Gali page 63


	[name='Phillips Curve']
	pi=betta*pi(+1)+kappa*y + eps_x + eps_xnews(-1);	
		
	[name='Taylor Rule']
	i = phi_pi*pi+phi_y*y + h;
		
	[name='Euler Equation']
	0 = siggma*(y-y(+1))+(i-pi(+1)) + eps_z + eps_znews(-1); 

	[name='Monetary policy shock']
	h = rho_h*h(-1)+ eps_u + eps_v(-1);

		
	[name='Inflation Forecast Definition']
	fpi = pi(+1);	
	
	[name='Output Forecast Definition']
	fy = y(+1);	
	
	[name='Interest Rate Forecast Definition']
	fi = i(+1);	

end;

%----------------------------------------------------------------
%  define shock variances
%---------------------------------------------------------------


shocks;
        var eps_x = sigma_x^2; 
		var eps_z = sigma_z^2;
        var eps_xnews = sigma_xnews^2; 
		var eps_znews = sigma_znews^2;		
		var eps_u = sigma_u^2;
		var eps_v = sigma_v^2;
end;

%----------------------------------------------------------------
%  steady states: all 0 due to linear model
%---------------------------------------------------------------
resid(1);
steady;
check;


	stoch_simul(order = 1,irf=15,periods=100000) ;
 
 % for param looping:
 % stoch_simul(order = 1,irf=15,periods=100000,irf_shocks = ( eps_zeta eps_z),nograph) fpi_ann pi y i zeta;
 

