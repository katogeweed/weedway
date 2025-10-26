FROM ruby:3.2.2

# Node.js, Yarn, PostgreSQLクライアントを追加
RUN apt-get update -qq && apt-get install -y nodejs npm postgresql-client
RUN npm install -g yarn

# 作業ディレクトリ
RUN mkdir /apps
WORKDIR /apps

# Gemfile と Gemfile.lock をコピー
COPY Gemfile Gemfile.lock ./

# Bundler をインストールして Rails を取得
RUN gem install bundler
RUN bundle install

# entrypoint.sh をコピー
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
