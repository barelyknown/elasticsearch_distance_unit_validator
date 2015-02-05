# ElasticsearchDistanceUnitValidator

[Elasticsearch](http://www.elasticsearch.org) uses [distance units](http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/common-options.html#distance-units) for features such as its [geo distance filter](http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/query-dsl-geo-distance-filter.html).

Examples of Elasticsearch distance units include `10ft` and `44miles`.

Use this validator to validate that a string conforms to the distance unit format.

```ruby
validates :distance, elasticsearch_distance_unit: true
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'elasticsearch_distance_unit_validator'
```

## Quality
[ ![Codeship Status for barelyknown/elasticsearch_distance_unit_validator](https://codeship.com/projects/9bddf450-8efa-0132-e9e0-5ef1dd5f157a/status?branch=master)](https://codeship.com/projects/61122)
[![Code Climate](https://codeclimate.com/github/barelyknown/elasticsearch_distance_unit_validator/badges/gpa.svg)](https://codeclimate.com/github/barelyknown/elasticsearch_distance_unit_validator)
[![Test Coverage](https://codeclimate.com/github/barelyknown/elasticsearch_distance_unit_validator/badges/coverage.svg)](https://codeclimate.com/github/barelyknown/elasticsearch_distance_unit_validator)

## Credits

Originally created by [@barelyknown](https://twitter.com/barelyknown).
