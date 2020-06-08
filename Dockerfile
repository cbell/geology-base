# using latest version as of 04-07-2020
# version description: Major.Minor.Fix
# version 1.0.7 is resolving the inability to plot interactively 
# version 2.x.x to be released for research use 
FROM jupyter/datascience-notebook:76402a27fd13
# latest as of 6-8-20

USER root

RUN curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash - && \
    sudo apt-get install -y nodejs

USER jovyan

RUN conda install obspy basemap 
RUN pip install telewavesim && \
    pip install obspyh5 toeplitz rf && \
    pip install git+https://github.com/SciTools/cartopy.git@5e624fe9e9 && \
    pip install git+https://git.pyrocko.org/pyrocko/pyrocko.git && \
    pip install ipympl

RUN jupyter labextension install jupyter-matplotlib && \
    jupyter labextension install @lckr/jupyterlab_variableinspector

