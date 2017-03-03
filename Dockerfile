FROM ubuntu:16.04

RUN	apt-get update

RUN	apt-get install -y software-properties-common && \
	apt-get install -y python-software-properties 

RUN 	apt-get install -y python-pip && \
	pip install --upgrade pip && \
	apt-get install -y python-dev 

RUN	apt-get install -y libssl-dev && \
	apt-get install -y libffi-dev && \
	apt-get install -y python3-dev && \
	apt-get install -y python3-venv  && \
	apt-get install -y python3-pip

RUN 	apt-get install -y python-numpy && \
	apt-get install -y python-matplotlib && \
	apt-get install -y python-nose && \
	apt-get install -y python-sphinx && \
	apt-get install -y python-pydot && \
	apt-get install -y ipython && \
	apt-get install -y ipython-notebook 

RUN	apt-get install -y curl && \
	apt-get install -y git && \
	apt-get install -y iptables && \
	apt-get install -y less && \
	apt-get install -y vim && \
	apt-get install -y vim-common && \
	apt-get install -y tar && \
	apt-get install -y zip && \
	apt-get install -y unzip

RUN	apt-get install -y build-essential && \
 	apt-get install -y apt-utils && \
	apt-get install -y automake && \
	apt-get install -y cmake && \
	apt-get install -y gcc && \
	apt-get install -y g++ && \
	apt-get install -y gcc-multilib && \
	apt-get install -y libgomp1 && \
	apt-get install -y pkg-config && \
	apt-get install -y sphinx-common && \
	apt-get install -y gfortran && \
	apt-get install -y libtool 

RUN	apt-get install -y python-scipy && \
	apt-get install -y python-numpy && \
	apt-get install -y python-pandas

RUN	pip install pandas-datareader && \
	pip install cython

RUN     pip install setuptools==33.1.1 && \
	pip install packaging && \
	pip install jupyter 


RUN	apt-get install -y libblas-dev && \	
	mkdir source && \
	cd source && \	
	git clone https://github.com/scikit-learn/scikit-learn.git && \
	cd scikit-learn && \
	python ./setup.py install




	

	






