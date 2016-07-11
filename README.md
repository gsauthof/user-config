This repository contains dotfiles, i.e. configuration files
usually located in the home directory.

2016, Georg Sauthoff <mail@georg.so>

## Rationale

The overall objectve is to include useful and convenient
stuff. Of course, the files are for a diverse range of
applications, however, a few general themes can be derived:

- Configure Vi-like key bindings as much as possible
- Enable history where necessary (usually written to `~/.cache/program_history`)
- Enable colors and completion where it makes sense

The config files don't contain personal information like
hardcoded user names, email addresses, though.

Where it is supported and makes sense, the config file thus
(optionally) source an local addendum. For example, `.gitconfig`
includes `.gitconfig.local` at the end where a user can add truly
user specific configuration like the username and email address
that should be used by the program.


