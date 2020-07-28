# Railsコンテナ用Dockerfile

# イメージのベースラインにRuby2.5.1を指定
FROM ruby:2.6.3
# Railsに必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y build-essential nodejs
# ルートディレクトリを作成
RUN mkdir /project #/app
# 作業ディレクトリを指定
WORKDIR /project
# ローカルのGemfileとGemfile.lockをコピー

#COPY src/Gemfile /app/Gemfile
COPY Gemfile /project/Gemfile
#COPY src/Gemfile.lock /app/Gemfile.lock
COPY Gemfile.lock /project/Gemfile.lock

# Gemのインストール実行
RUN bundle install
# ローカルのsrcをコピー
COPY . /project
