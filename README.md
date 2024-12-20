# Learning Elixir

- Use [Typespecs](https://hexdocs.pm/elixir/1.12/typespecs.html) for type checking & safety.
- Resources list - [Masters of Elixir](https://github.com/abreujp/masters-of-elixir)
- Master list for everything Elixir - [Awesome Elixir](https://github.com/h4cc/awesome-elixir) <sup><i>See the up-to-date libraries [here](https://awsm-elixir.rubybox.dev)</i></sup>
-  Security in Elixir list on [Reddit](https://www.reddit.com/r/elixir/comments/1hg26n0/comment/m2k7rce/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button)
- [Erlang Ecosystem Foundation Security WG](https://erlef.github.io/security-wg/)

## Important CLI commands
### Create a new project for API without LiveView & HTML
```bash
mix phx.new <project_name> -—app <project_name> -—database postgres -—no-live -—no-assets -—no-html -—binary-id -—no-esbuild -—no-gettext -—no-tailwind
```
> Can use `-—no-mailer` to remove the mailer.


### Create a new schema & migration.
```bash
mix phx.gen.schema User users name:string email:string \
bio:string number_of_pets:integer
```

### Create controller, context, schema, table migrations & tests
```bash
mix phx.gen.json Accounts Account accounts email:string hashed_password:string
```
> Best suitable for controllers which are straightforward crud operations. Customising the tests to work can be a pain.

### Create context, schema, table migrations & tests
```bash
mix phx.gen.context Accounts Account accounts email:string hashed_password:string
```

### Run the migration
```bash
mix ecto.migrate
```
> Mix assumes that we are in the development environment unless we tell it otherwise with `MIX_ENV=prod mix ecto.migrate`.


## Important Libraries
### CORS
- [Corsica](https://hexdocs.pm/corsica/Corsica.html)


### Linting & Code Hygiene
- [Credo](https://github.com/rrrene/credo) is a static code analysis tool for the Elixir language with a focus on teaching and code consistency.

- [Dialyzer](https://www.erlang.org/doc/apps/dialyzer/dialyzer.html)
 is a static analysis tool that identifies software discrepancies, such as definite type errors, code that is unreachable because of programming errors, and unnecessary tests in single Erlang modules or an entire codebase.

 ### LiveView Components
 - [Surface](https://hexdocs.pm/surface/Surface.html)

### ORM
- [Ecto](https://hexdocs.pm/ecto)
> Use [embedded schemas](https://hexdocs.pm/ecto/embedded-schemas.html) for nested data to be stored as json/jsonb/array.

### Telemetry
- [Telemetry](https://hexdocs.pm/telemetry/readme.html)

### Validation
- [Validate](https://hexdocs.pm/validate/readme.html)
- [ExValidator](https://github.com/vic/ex_validator)


## Important Tools
### Admin Console
- [Kaffy](https://github.com/kaffeins/kaffy)
- [Backpex](https://github.com/naymspace/backpex)
- [ExAdmin](https://github.com/smpallen99/ex_admin) <sup><i>Last updated Apr '18</i></sup>

### Profiling & Monitoring
- [Recon](https://ferd.github.io/recon/overview.html)
- [Prometheus](https://hexdocs.pm/prometheus/overview.html)
- [AppSignal](https://docs.appsignal.com/elixir)

## Learning Resources
### Phoenix Guides
- [Phoenix from hexdocs](https://hexdocs.pm/phoenix)

### Profiling & Monitoring
- [Profiling in Elixir Blog](https://pulkitgoyal.in/profiling-in-elixir)

### Testing
- [Testing WebSocket Clients with Mock Server](https://pulkitgoyal.in/testing-websocket-clients-in-elixir-with-a-mock-server)