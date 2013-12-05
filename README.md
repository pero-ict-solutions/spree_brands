SpreeBrands
===========

Add's a dedicated Brand model in your shop.

Installation
------------

Add spree_brands to your Gemfile:

```ruby
gem "spree_brands", :github => 'pero-ict-solutions/spree_brands', :branch => "2-1-stable"
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_brands:install
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_brands/factories'
```

Copyright (c) 2013 PeRo ICT Solutions, released under the New BSD License
