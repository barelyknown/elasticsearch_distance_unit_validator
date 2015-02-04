# ElasticsearchDistanceUnitsValidator

[Elasticsearch](http://www.elasticsearch.org) uses [distance units](http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/common-options.html#distance-units) for features such as its [geo distance filter](http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/query-dsl-geo-distance-filter.html).

Examples of Elasticsearch distance units include `10ft` and `44miles`.

Use this validator to validate that a string conforms to the distance unit format.

```ruby
validates :distance, elasticsearch_distance_unit: true
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'elasticsearch_distance_units_validator'
```

## Credits

Originally created by [@barelyknown](https://twitter.com/barelyknown).
