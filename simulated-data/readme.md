Currently, all files in this folder correspond to the comporting model: 3 structural shocks, each featuring a surprise component and 1 news horizon.

**Files**

*NK3_monetary_news_6shocks.mod* -- Dynare file to solve and simulate the model.

*simdata_NK3_moneynews_6shocks.csv* -- Simulated time series of endogenous variables.  Each row is an observation.  The columns are ordered: [X', F'] where X' = [*output*, *inflation*, * interest rate*] and F' is the associated vector of 1-period-ahead forecasts.

*simshocks_NK3_moneynews_6shocks.csv* -- Simulated time series of exogenous shocks.  Each row is an observation.  The colums are ordered: [*x_news x_surprise z_news z_surprise v u*] corresponding to the notation of Section 2.  v is monetary policy news, u is monetary policy surprise.

*Cmatrix_NK3_mnews_6shocks.csv* -- Model-implied C matrix.  A (3 x 3) matrix.  Rows correspond to X, i.e. [*output*, *inflation*, * interest rate*]', while columns correspond to [*x_news z_news v*].

*Amatrix_NK3_mnews_6shocks.csv* -- Model-implied A matrix.  A (3 x 3) matrix.  Rows correspond to X, i.e. [*output*, *inflation*, * interest rate*]', while columns correspond to [*x_surprise z_surprise u*].

*irf_y_v.csv* -- IRF of *output* to *v*

*irf_y_u.csv* -- IRF of *output* to *u*

*irf_pi_v.csv* -- IRF of *inflation* to *v*

*irf_pi_u.csv* -- IRF of *inflation* to *u*

*irf_i_v.csv* -- IRF of *interest rate* to *v*

*irf_i_u.csv* -- IRF of *interest rate* to *u*

*irf_y_xnews.csv* -- IRF of *output* to *xnews*

*irf_y_xsurp.csv* -- IRF of *output* to *xsurp*

*irf_pi_xnews.csv* -- IRF of *inflation* to *xnews*

*irf_pi_xsurp.csv* -- IRF of *inflation* to *xsurp*

*irf_i_xnews.csv* -- IRF of *interest rate* to *xnews*

*irf_i_xsurp.csv* -- IRF of *interest rate* to *xsurp*

*irf_y_znews.csv* -- IRF of *output* to *znews*

*irf_y_zsurp.csv* -- IRF of *output* to *zsurp*

*irf_pi_znews.csv* -- IRF of *inflation* to *znews*

*irf_pi_zsurp.csv* -- IRF of *inflation* to *zsurp*

*irf_i_znews.csv* -- IRF of *interest rate* to *znews*

*irf_i_zsurp.csv* -- IRF of *interest rate* to *zsurp*




