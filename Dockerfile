FROM ruby:alpine

WORKDIR /minikube-ruby-app

COPY ./Gemfile .
RUN bundle install

COPY . .

CMD [ "bundle", "exec", "rackup", "-o", "0.0.0.0", "-p", "8080" ]