# What Is

What the hell is this gem for? To put simply, this library enables us (developers) to define a given word. Think "dictionary". It uses the Merriam-Webster's API as the reference for giving the definitions.

# Setup

Register an account on http://www.dictionaryapi.com/ and make sure you request an api key for 
Collegiate Dictionary and Collegiate Thesaurus. These are the two references that this library supports for now.

After registration, you should already have two api keys; one for the dictionary and other is for the thesaurus 
version.

## Installation

Add this line to your application's Gemfile:

    gem 'what_is'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install what_is

## Usage

    x = WhatIs::Define.new("<insert word to define>")
    x.go! # returns the meaning of the word

## Contributing

1. Fork it ( http://github.com/<my-github-username>what_is/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
