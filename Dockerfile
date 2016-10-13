FROM andrewosh/binder-base

MAINTAINER Greg Caporaso <gregcaporaso@gmail.com>

USER root

RUN apt-get install -y Xvfb x11-utils

USER main

# Install IAB
RUN /bin/bash -c "source activate python3 && conda install --yes -c biocore -c etetoolkit ete3 ete3_external_apps python=3.5 pip numpy scipy matplotlib nose scikit-bio jupyter seaborn pandas markdown2 networkx pyqt"
RUN /bin/bash -c "source activate python3 && pip install https://github.com/gregcaporaso/An-Introduction-To-Applied-Bioinformatics/archive/master.zip"

ENTRYPOINT xvfb-run
