FROM andrewosh/binder-python-3.5

MAINTAINER Greg Caporaso <gregcaporaso@gmail.com>

USER root

RUN apt-get update
RUN apt-get install -y Xvfb x11-utils

USER main

# Install IAB
RUN /bin/bash -c "conda install --yes -c biocore -c etetoolkit ete3 ete3_external_apps scikit-bio jupyter seaborn pandas markdown2 networkx pyqt<5.0.0"
RUN /bin/bash -c "pip install https://github.com/gregcaporaso/An-Introduction-To-Applied-Bioinformatics/archive/master.zip"

ENTRYPOINT xvfb-run
