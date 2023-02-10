ARG RUBY_VERSION=3.1.2
FROM ruby:${RUBY_VERSION}
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
# Set the working directory to /myapp
RUN mkdir /app
WORKDIR /app
COPY Gemfile ./
COPY Gemfile.lock ./
RUN bundle install
# Copy the current directory contents into the container at /myapp
COPY . /app
# Add a script to be executed every time the container starts.COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
# Start the main process. 
# Keep reading to see why we commented this line out! 
CMD ["rails", "server", "-b", "0.0.0.0"]