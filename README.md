# Permissions template

Template of permissions repository for [data_guru gem](https://github.com/netguru/data_guru)

## Config

You need to create a `config` directory with two files `user.yml` and `project.yml`. In these files you specify attributes for each model and which of the attributes are required.

Currently this is the way to specify required and not required attributes:

```
---
name: true
email: true
github: false
public_key: true
external: false
```

Each attribute specified in config file is available as method on model in the gem. Additional methods are `permitted_attributes` (lists all keys from config) and `required_attributes` (lists only required keys from config).

## Collections

All the users and projects should be under the `users` and `projects` directory, they can be nested in directories if you want.

Each user or project yaml file should look like this:

```
---
name: John Doe
email: john.doe@example.com
github: doe
public_key: 98hjkj45j54jh20dv98cxjb4
external: true
array:
  - one
  - two
  - three
```

The supported types are string, boolean and array. Note that if you add a key that isnt's specified in config to the user or project yaml file, the method on a model won't be created and this information won't be available from the gem.
