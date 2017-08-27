FROM debian:9

RUN mkdir -p /root/.config/nvim/ /app/

COPY ./init.vim /root/.config/nvim/init.vim
COPY ./test.js /app/test.js

RUN apt-get update && apt-get install -y \
      neovim \
      curl \
      gnupg \
      apt-transport-https \
      git

# Intall yarn, node and standarjs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
      echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y yarn
RUN yarn global add standard
RUN ln -s /usr/bin/nodejs /usr/bin/node

# Add vim plug
RUN curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN vim +PlugInstall +q +q

WORKDIR /app/
