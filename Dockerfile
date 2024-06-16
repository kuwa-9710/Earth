# ベースイメージとして公式のRubyイメージを使用
FROM ruby:3.2.0

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client

# 作業ディレクトリを設定
WORKDIR /myapp

# GemfileとGemfile.lockをコピー
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Bundlerをインストールし、Gemをインストール
RUN bundle install

# アプリケーションのソースコードをコピー
COPY . /myapp
