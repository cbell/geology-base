# using latest version as of 01-10-2022
# version description: Major.Minor.Fix
# version 1.0.7 is resolving the inability to plot interactively 
# version 2.x.x to be released for research use 
# version 3.0.0 to move security forward and image lifecycle
# version 3.0.1 to add geopandas
# version 3.0.2 to fix issue with matplot crashing the kernel 
# version 3.1.0 to add seispy

FROM jupyter/datascience-notebook:2022-01-10
# latest as of 01-10-2022 - updates to large number of applications. 

USER root

RUN curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash - && \
    sudo apt-get install -y nodejs g++

USER jovyan

RUN conda install obspy basemap 
RUN pip install telewavesim && \
    pip install obspyh5 toeplitz rf 
RUN pip install cartopy

RUN pip install pyrocko && \
    pip install ipympl
RUN pip install lckr-jupyterlab-variableinspector

RUN pip install geopandas python-seispy
