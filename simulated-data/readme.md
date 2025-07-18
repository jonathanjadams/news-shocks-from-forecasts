Currently, all files in this folder correspond to the comporting model: 3 structural shocks, each featuring a surprise component and 1 news horizon.

**Files**

*NK3_monetary_news_6shocks.mod* -- Dynare file to solve and simulate the model.

*simdata_NK3_moneynews_6shocks.csv* -- Simulated time series of endogenous variables.  Each row is an observation.  The columns are ordered: [ F', X'] where X' = [*output*, *inflation*, * interest rate*] and F' is the associated vector of 1-period-ahead forecasts.

*simshocks_NK3_moneynews_6shocks.csv* -- Simulated time series of exogenous shocks.  Each row is an observation.  The colums are ordered: [*x_news x_surprise z_news z_surprise v u*] corresponding to the notation of Section 2.  v is monetary policy news, u is monetary policy surprise.

*Cmatrix_NK3_mnews_6shocks.csv* -- Model-implied C matrix.  A (3 x 3) matrix.  Rows correspond to X, i.e. [*output*, *inflation*, * interest rate*]', while columns correspond to [*x_news z_news v*].

*Amatrix_NK3_mnews_6shocks.csv* -- Model-implied A matrix.  A (3 x 3) matrix.  Rows correspond to X, i.e. [*output*, *inflation*, * interest rate*]', while columns correspond to [*x_surprise z_surprise u*].

*irf_y_allshocks.csv* -- IRF of *output* to [*x_news x_surprise z_news z_surprise v u*]

*irf_pi_allshocks.csv* -- IRF of *inflation* to [*x_news x_surprise z_news z_surprise v u*]

*irf_i_allshocks.csv* -- IRF of *interest rate* to [*x_news x_surprise z_news z_surprise v u*]



