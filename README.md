# AddSymbolicNames [![Build Status](https://travis-ci.org/avvo/add_symbolic_names.png?branch=master)](https://travis-ci.org/avvo/add_symbolic_names)

ActiveRecord plugin for creating constants from a domain table

## Motivation

You have foreign keys in your database that are actually constants.

## Usage

In your Gemfile:

```
gem 'add_symbolic_names'
```

In your ActiveRecord model:

```
class SomeDomain < ActiveRecord::Base
  add_symbolic_names
end
```

## Configuration

The `add_symbolic_names` method takes an options hash with 3 possible values:

* `symbolic_name_attrib` - the name of the column/attribute to use when defining the constant name
* `value_attrib` - the name of the column/attribute to use for the value of the constant
* `store` - how to load the data

## Stores

There are 2 data stores available

### ActiveRecord

ActiveRecord is the default data store.  It loads all records, iterating through and defining constants with a name of the `symbolic_name_attrib` option with a value of the `value_attrib` option.

```
…
add_symbolic_names store: :active_record, 
                   symbolic_name_attrib: :some_column, 
                   value_attrib: :another_column
```

### Yaml

Yaml store loads from your db/domain folder a yaml file with the pluralized, demodulized class name. (User => users.yml)

```
…
add_symbolic_names store: :yaml
```

## Example

Let's say you keep track of how you create users on your site.  You have a `user_creation_methods` table that looks something like:

| id | symbolic_name |
|----|---------------|
|  1 |         EMAIL |
|  2 |      REGISTER |
|  3 |        IMPORT |

```
class UserCreationMethod < ActiveRecord::Base
  add_symbolic_names
end
```

You now have access to some namespaced constants:

* `UserCreationMethod::EMAIL` => 1
* `UserCreationMethod::REGISTER` => 2
* `UserCreationMethod::IMPORT` => 3

```
class User < ActiveRecord::Base
  belongs_to :user_creation_method
  
  scope :imported, -> { where(user_creation_method_id: UserCreationMethod::IMPORT) }
end
```

## Credit

[bvandenbos](http://github.com/bvandenbos) actually wrote this 6+ years ago. We think this could be useful for others.