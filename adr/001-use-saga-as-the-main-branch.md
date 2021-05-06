# ADR 001: Use saga as the name for the main branch

Historically, Git and other software use terms such as `master/slave`,
`whitelist/blacklist`, which are based on racial concepts. Their continued use
maintains the racial stereotypes they depict. Better alternatives in meaning and
technical correctness exist, like `leader/follower`, `blocklist/allowlist`.

In the Nordic mythology, a `saga` is a long, continuous recollection of stories
about the history of humans, legends, and Gods. The term `saga` reflects very
well what happens in a Git repository. Changes happen in branches (some teams
tie them to _User Stories_, which are sometimes directly or loosely coupled to
the main branch). Once the changes are finalized, they get added to the main
branch, or get appended in the case of a rebase. The mental model of a big book
of stories fits this process very well.

Therefore, the main branch in this project is named `saga`. `master` must not be
used.
