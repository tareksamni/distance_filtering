# Customer filtering based on their distance from office

We have some customer records in a text file (customers.json) -- one customer per line, JSON-encoded.

We want to invite any customer within 100km of our office for some food and drinks on us. Write a program that will read the full list of customers and output the names and user ids of matching customers (within 100km), sorted by User ID (ascending).

The GPS coordinates for our office are 53.3393,-6.2576841.

You can find the Customer list [here](https://raw.githubusercontent.com/tareksamni/distance_filtering/master/fixtures/customer.json).


+ [`Filters`][8] should implement `accept?` method that will decide if a record is included/accepted or not based on the filter criteria.

+ [`Inputs`][9] should implement `read` method that will return an array of records. It's mainly used to input different type of inputs to the app.

+ [`Presenters`][10] should implement `format` method to return the data in a format to be presented after applying required sorts and maps. The final returned value could be : `String`, `JSON`, `XML`, etc.

+ [`Customer`][11] is data container for customer details.

This project is following `TDD` so [specs][12] are always set before feature coding.

# Setup & Run

This project is using:

+ ruby 2.4.1
+ bundler gem to install all required gems that are listed in [Gemfile][2].
+ rspec gem as the tests framework. Config can be found in [.rspec][3].
+ rubocop gem as a main coding style guide. Config can be found in [.rubocop.yml][4].
+ [Docker][5] to run the application without any dependencies using docker engine.

## Using Docker (Build from soruce)

[Install Docker Engine][6] on your machine to be able to follow these steps.

run `docker --version` to make sure that docker is installed and running successfully. You should get a message like `Docker version 17.06.2-ce, build cec0b72`. Now you follow these steps:

+ Build docker image from source
```shell
docker build . -t distance_filtering:latest_git_commit_sha
```
where `latest_git_commit_sha` is the git current checked out git commit SHA.

+ Run the application on a docker container
```shell
docker run -it distance_filtering:latest_git_commit_sha "ruby runner.rb"
```

+ Run tests on a docker container
```shell
docker run -it distance_filtering:latest_git_commit_sha "rspec"
```

## Using Docker (Pull from docker hub)

[Install Docker Engine][6] on your machine to be able to follow these steps.

run `docker --version` to make sure that docker is installed and running successfully. You should get a message like `Docker version 17.06.2-ce, build cec0b72`. Now you follow these steps:

+ Run the application on a docker container

```shell
docker run -it tareksamni/distance_filtering:0dcc8c271b94699889dce5ed2d6777b54562f622 "ruby runner.rb"
```

+ Run tests on a docker container
```shell
docker run -it tareksamni/distance_filtering:0dcc8c271b94699889dce5ed2d6777b54562f622 "rspec"
```

## Without Docker

You need to install the dependencies first, follow these steps to install all required dependencies using [`RVM`][7]:

+ Install RVM
```shell
$ curl -sSL https://get.rvm.io | bash -s stable
```

+ Install/Use ruby 2.4.1 and create a gemset for this project
```shell
$ rvm use ruby-2.4.1@distance_filtering --create
```

+ Install bundler gem
```shell
$ gem install bundler
```

+ Install gems listed in Gemfile
```shell
$ bundle install
```

+ Run application
```shell
$ ruby runner.rb
```
+ Run tests
```shell
$ rspec
```

[1]: https://gist.github.com/soulnafein/8ee4e60def4e5468df2f
[2]: https://github.com/tareksamni/distance_filtering/blob/master/Gemfile
[3]: https://github.com/tareksamni/distance_filtering/blob/master/.rspec
[4]: https://github.com/tareksamni/distance_filtering/blob/master/.rubocop.yml
[5]: https://github.com/tareksamni/distance_filtering/blob/master/Dockerfile
[6]: https://docs.docker.com/engine/installation/
[7]: https://rvm.io/
[8]: https://github.com/tareksamni/distance_filtering/tree/master/app/filters
[9]: https://github.com/tareksamni/distance_filtering/tree/master/app/inputs
[10]: https://github.com/tareksamni/distance_filtering/tree/master/app/presenters
[11]: https://github.com/tareksamni/distance_filtering/blob/master/app/customer.rb
[12]: https://github.com/tareksamni/distance_filtering/tree/master/spec