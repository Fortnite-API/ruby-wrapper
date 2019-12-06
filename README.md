<div align="center">

# Ruby wrapper for [Fortnite-API.com](https://fortnite-api.com)

</div>

This repository offers an request API around the endpoints of [fortnite-api.com](https://fortnite-api.com).

## Installation

To install this gem, simply type into your terminal:  
```gem install fortniteapi```

## Example

```ruby
require 'fortniteapi'

fortnite_api = FortniteAPI.new(apikey=X-API-KEY-HERE)
cosmetics = fortnite_api.search_cosmetic('Renegade')
puts cosmetics.id
=> cid_013_athena_commando_f
```

## Documentation

To see the full documentation for this gem, please visit the [wiki](https://github.com/Fortnite-API/ruby-wrapper/wiki)

## License

Fortnite-API (MIT) [License](https://github.com/Fortnite-API/ruby-wrapper/blob/master/LICENSE "MIT License")

API developed by [Fortnite-API.com](https://fortnite-api.com/about)
