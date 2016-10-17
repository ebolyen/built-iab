FROM andrewosh/binder-base

MAINTAINER Greg Caporaso <gregcaporaso@gmail.com>

USER root

RUN apt-get update
RUN apt-get install -y xvfb x11-utils xauth

USER main

# Install IAB
RUN /bin/bash -c "source activate python3 && conda install --yes -c biocore pip numpy scipy matplotlib nose scikit-bio=0.4.2 jupyter seaborn pandas markdown2 networkx 'pyqt<5.0.0'"
RUN /bin/bash -c "source activate python3 && pip install https://github.com/gregcaporaso/An-Introduction-To-Applied-Bioinformatics/archive/master.zip"

ENTRYPOINT xvfb-run --
