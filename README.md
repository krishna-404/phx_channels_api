# Learning Elixir

- Use [Typespecs](https://hexdocs.pm/elixir/1.12/typespecs.html) for type checking & safety.
- Resources list - [Masters of Elixir](https://github.com/abreujp/masters-of-elixir)
- Master list for everything Elixir - [Awesome Elixir](https://github.com/h4cc/awesome-elixir)
> See the up-to-date libraries from Awesome Elixir [here](https://awsm-elixir.rubybox.dev)

## Important CLI commands

## Create a new project for API without LiveView & HTML
```bash
mix phx.new <project_name> -—app <project_name> -—database postgres -—no-live -—no-assets -—no-html -—binary-id -—no-esbuild -—no-gettext -—no-tailwind
```
> Can use `-—no-mailer` to remove the mailer.

## Create a new schema & migration.
```bash
mix phx.gen.schema User users name:string email:string \
```

## Create context, schema, table migrations & tests
```
mix phx.gen.json Accounts Account accounts email:string hashed_password:string
```
> Best suitable for controllers which are straightforward crud operations. Customising the tests to work can be a pain.

## Run the migration
```bash
mix ecto.migrate
```
> Mix assumes that we are in the development environment unless we tell it otherwise with `MIX_ENV=prod mix ecto.migrate`.

## Important Libraries

### CORS
[Corsica](https://hexdocs.pm/corsica/Corsica.html)

### Linting & Code Hygiene

Credo is a static code analysis tool for the Elixir language with a focus on teaching and code consistency.
[Credo](https://github.com/rrrene/credo)

Linter for Elixir.
Dialyzer is a static analysis tool that identifies software discrepancies, such as definite type errors, code that is unreachable because of programming errors, and unnecessary tests in single Erlang modules or an entire codebase.
[Dialyzer](https://www.erlang.org/doc/apps/dialyzer/dialyzer.html)

### Validation

[Validate](https://hexdocs.pm/validate/readme.html)
[ExValidator](https://github.com/vic/ex_validator)

## Important Tools

### Admin Console

[Kaffy](https://github.com/kaffeins/kaffy)
[Backpex](https://github.com/naymspace/backpex)
[ExAdmin](https://github.com/smpallen99/ex_admin) <sup><i>Last updated Apr '18</i></sup>

## Learning Resources

### Phoenix Guides

[Phoenix from hexdocs](https://hexdocs.pm/phoenix)