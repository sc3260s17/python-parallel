SHELL := /bin/bash

# creates the new conda environment
env: 
	conda create -n $(MY_CONDA_ENV) environment.yml;

# Installs any pip only packages
install:

# Tests that the install proceeded correctly
test:
	python test.py;

# Removes the created environment
clean:
	conda remove -n $(MY_CONDA_ENV) --all;
