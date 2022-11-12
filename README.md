# Minio Client SDK for Ruby [![Slack](https://slack.minio.io/slack?type=svg)](https://slack.minio.io)

NOTICE:
-------------------------------------------
The original Minio Client is archived.
-------------------------------------------

Note: I started messing with this, but then realized that we should really just use the S3 client and point it to a differnet endpoint as they are API compatible.
--------------------------------------------

The Minio Client SDK for Ruby provides simple APIs to access Minio or any Amazon S3 compatible object storage server.

<blockquote>
The Minio Ruby SDK _was_ a work in progress.

It, and this fork seem to work. Use at your own risk?!?
</blockquote>

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'minio_ruby'
```

And then execute to install the deps.

```
bundle
```

Or install it yourself as:

```
gem install minio_ruby
```

## Development

To build the minio gem yourself

```sh
bundle exec rake gems:build
```

Install the built gem file.


## Contributing

[Contributors Guide](https://github.com/minio/minio_ruby/blob/master/CONTRIBUTING.md)
