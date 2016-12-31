[![Gem Version](https://badge.fury.io/rb/pagemunch.svg)](https://badge.fury.io/rb/pagemunch)

# PageMunch - Link Unfurling

## Introduction

PageMunch is a simple API backed by an intelligent web crawler that lets you extract rich previews, entities and images from any url. Whether you want to grab the best title, description and image for a page, prices, authorship, enable video embeds or more.


## Installation

Add this line to your application's Gemfile:

    gem 'pagemunch'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pagemunch


## Usage

We recommend storing your API key in an environment variable, for security and to
enable using different keys in your staging, development and production environments.

```ruby
Pagemunch.key = ENV.fetch('PAGEMUNCH_API_KEY')
response = Pagemunch.extract 'http://www.youtube.com/watch?v=9bZkp7q19f0'
puts response.body.inspect
```

## More Details

For more information, libraries and documentation check out the **[PageMunch Documentation](https://www.pagemunch.com/docs "PageMunch - Web crawler, metadata extraction")**
