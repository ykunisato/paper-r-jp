FROM rocker/verse
MAINTAINER "Yoshihiko Kunisato" ykunisato@psy.senshu-u.ac.jp
# Installing "rstan" is based on the antoine-sachet/rocker-ML
# Changing environment to Japanese is based on the rocker-jp/verse

# Changing environment to Japanese
ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
RUN sed -i '$d' /etc/locale.gen \
  && echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen \
  && locale-gen ja_JP.UTF-8 \
  && /usr/sbin/update-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja"
RUN /bin/bash -c "source /etc/default/locale"
RUN ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# Using clang as compiler for stan
RUN apt-get update \
&& apt-get install -y --no-install-recommends \
clang

# Install ipaexfont
RUN apt-get update && apt-get install -y fonts-ipaexfont

# install libjpeg & V8 for "psycho"
RUN apt-get install -y libjpeg-dev
RUN apt-get install -y libv8-dev

# Creates a makevars file and installs rstan from source(https://github.com/stan-dev/rstan/wiki/Installing-RStan-on-Linux)
COPY inst_stan.r inst_stan.r
RUN ["r", "inst_stan.r"]

# install devtools & R package from github
RUN install2.r -s --error \
devtools

RUN Rscript -e "devtools::install_github('crsh/papaja')"
RUN Rscript -e "devtools::install_github('rstudio/rticles')"
RUN Rscript -e "devtools::install_github('benmarwick/wordcountaddin', type = 'source', dependencies = TRUE)"
RUN Rscript -e "devtools::install_github('ropenscilabs/gramr')"

# install ipaex font
RUN Rscript -e "tinytex::tlmgr_install('ipaex')"

# install other R packages
RUN install2.r -s --error \
bayesplot \
brms \
citr \
coda \
caret \
car \
e1071 \
Hmisc \
GGally \
ggmcmc \
ggsci \
gridExtra \
ggridges \
glmnet \
lme4 \
ltm \
loo \
MASS \
pixiedust \
pROC \
projpred \
rstanarm \
rstantools \ 
shinystan \
sigr \
stargazer \
stringr \
tidybayes \
viridis \
psycho

# Install Shiny server
RUN export ADD=shiny && bash /etc/cont-init.d/add

CMD ["/init"]