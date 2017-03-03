
The hmmlearn development environment is implemented using Jupyter and Docker.


NOTICE 1: The example script (notebook/hmmlearn_time-series.ipynb) is from 

	[1] http://hmmlearn.readthedocs.io/en/latest/tutorial.html, 
	[2] https://pandas-datareader.readthedocs.io/en/latest/, 
	and [3] scikit-learn /examples/plot_hmm_stock_analysis.py.

NOTICE 2: Warning messages regarding sklearn.gmm will pop up as follows.

	... warnings from sklearn gmm ...

	/usr/local/lib/python2.7/dist-packages/sklearn/utils/deprecation.py:70: DeprecationWarning: Function 	distribute_covar_matrix_to_match_covariance_type is deprecated; The functon 	distribute_covar_matrix_to_match_covariance_typeis deprecated in 0.18 and will be removed in 0.20.
  	warnings.warn(msg, category=DeprecationWarning)
	/usr/local/lib/python2.7/dist-packages/sklearn/utils/deprecation.py:70: DeprecationWarning: Function 	log_multivariate_normal_density is deprecated; The function log_multivariate_normal_density is deprecated in 0.18 and 	will be removed in 0.20.



Please follw the instructions to run the Jupyter notebook (notebook/hmmlearn_time-series.ipynb).
 
[1] Download (or git clone) this source code folder.

[2] cd downloaded-soource-code-folder

[3] sudo make BIND_DIR=.  shell

	wait ... wait ... then a bash shell will be ready (root@5c1a1469a3e3:/#).

[4] root@5c1a1469a3e3:/# cd /home/ml/hmmlearn

[5] root@5c1a1469a3e3:/home/ml/hmmlearn# 

[6] root@5c1a1469a3e3:/home/ml/hmmlearn# python ./setup.py install

[7] root@5c1a1469a3e3:/home/ml/hmmlearn# cd ..

[8] root@5c1a1469a3e3:/home/ml# cd notebook/

[9] root@5c1a1469a3e3:/home/ml/notebook# jupyter notebook --ip=0.0.0.0  --no-browser

    Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://0.0.0.0:8888/?token=840d9f66aaa7bddb150f6c8cc68b69089041cb2779672270

[10] Open a web browser in the local machine and copy/paste the URL (http://0.0.0.0:8888/?token=840d9f66aaa7bddb150f6c8cc68b69089041cb2779672270).

[11] Open the hmmlearn_time-series.ipynb file.

[12] Run the notebook file.
	
	Some warnings regarding sklean gmm will pop up.

[13] To remove the message that says ... warnings from sklearn gmm ..., open /home/ml/hmmlearn/hmmlearn/hmm.py in the local machine (or in Docker) and comment out line #210.

	line #210:  print "\n... warning from sklearn gmm ...\n"

[14] Repeat from the step [6].


The script is as follows.


	import numpy as np

	from hmmlearn import hmm

	import pandas_datareader.data as web

	import datetime

	from sklearn.utils import check_array

	start = datetime.datetime(2010, 1, 1)

	end = datetime.datetime(2013, 1, 27)

	df = web.DataReader("F", 'google', start, end)

	df.head()

	df['Date'] = df.index

	df.head()

	df["Close"]

	df["Volume"]

	volume = df["Volume"].as_matrix()[1:]

	dates = df["Date"].as_matrix()[1:]

	close_v = df["Close"].as_matrix()

	diff = close_v[1:] - close_v[:-1]

	X = np.column_stack([diff, volume])

	print X[0:10]

	print X.shape

	n_components = 5

	model = hmm.GaussianHMM(n_components, covariance_type="diag", n_iter=100)

	model.fit(X)

	hidden_states = model.predict(X)

	print model.transmat_

