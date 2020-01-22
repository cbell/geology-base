# using latest version as of 11-12-2019
# version description: Major.Minor.Fix
# version 1.0.7 is resolving the inability to plot interactively 
FROM jupyter/datascience-notebook:45f07a14b422


USER root

RUN curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash - && \
    sudo apt-get install -y nodejs

USER jovyan

RUN conda install obspy basemap 
RUN pip install telewavesim && \
    pip install obspyh5 toeplitz rf && \
    pip install git+https://git.pyrocko.org/pyrocko/pyrocko.git && \
    pip install ipympl

RUN jupyter labextension install jupyter-matplotlib
