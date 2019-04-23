# Dockerfile of writing paper by R Markdown

This Dockerfile was developed for the Japanesese R users (So, it contains settings of Japanese environment). English version of this dockerfile is [here](https://cloud.docker.com/repository/docker/ykunisato/paper-r).

これは，RstudioでR Markdownを用いて論文執筆を行う際に便利なパッケージやアドインを含めたDockerファイルのリポジトリです。このDockerファイルにより，[アカデミアのためのRSTUDIO](https://ytake2.github.io/create.manuscript/RStudio_for_Academia.html)にて紹介されているパッケージは大体用意できます(引用文献リスト作成関数は不要と思いましたので，入れていません)。

本Dockerファイルは，rocker/verseをベースにし，antoine-sachet/rocker-MLに記載されている方法を使ってrstanをインストールし，いくつかR Markdown関連のパッケージを追加しています。なお，本Dockerファイルのイメージは2GB程度になります。

作成者は専修大学人間科学部心理学科の国里愛彦です (ykunisato@psy.senshu-u.ac.jp)。

このDockerファイルを使うと、以下のRパッケージが事前にインストールされます。

- devtools
- bayesplot
- brms
- citr
- coda
- caret
- car
- e1071
- Hmisc
- GGally
- ggmcmc
- ggsci
- gridExtra
- ggridges
- glmnet
- lme4
- ltm
- loo
- MASS
- papaja
- pixiedust
- pROC
- projpred
- rstan
- rstanarm
- rstantools
- rticles
- shinystan
- sigr
- stargazer
- stringr
- tidybayes
- tidyverse
- viridis
- psycho
- wordcountaddin
- gramr

## 使用法

Docker Desktopをインストールする

ターミナル（Macユーザー）を開く

ターミナルに以下を打ち込んで、イメージをpullする

docker pull ykunisato/paper-r

ターミナルに以下を打ち込んで、コンテナーをrunする。パスワードとコンテナ名はご自身の好きなように設定ください。
docker run -e PASSWORD=パスワード -p 8787:8787 -v ~:/home/rstudio -d --name コンテナ名 ykunisato/paper-r

ブラウザを開いて，urlバー（アドレスバー）に，http://localhost:8787/ とタイプする

ブラウザ上にRstudioが出てくるので，IDにrstudio，パスに上記で設定したパスワードをいれる。
