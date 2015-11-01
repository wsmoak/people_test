# PeopleTest

Example project to reproduce the problem discussed in
https://groups.google.com/forum/#!topic/elixir-ecto/WritDu9He-s

To start your Phoenix app:

  1. Install dependencies with `mix deps.get`
  2. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  3. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

To reproduce the issue:

  1. Visit http://localhost:4000/people
  2. Add two people
  3. Visit http://localhost:4000/couples
  4. Enter the IDs (probably 1 and 2) and submit the form

Result:  Error, but with no messages.  Check the log for the output of `IO.inspect`ing various things -- the changeset is invalid, but has no errors.
