# PhoenixRoutesJs  [![Hex.pm](https://img.shields.io/hexpm/v/plug.svg)](https://hex.pm/packages/phoenix_routes_js) [![Build Status](https://travis-ci.org/khusnetdinov/phoenix_routes_js.svg?branch=master)](https://travis-ci.org/khusnetdinov/phoenix_routes_js)
## Phoenix routes helpers in JavaScript code

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `phoenix_routes_js` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:phoenix_routes_js, "~> 0.1.0"}]
end
```

## Usage

### Two steps configuration:

1) Add possibility to use view helper by adding `use PhoenixRoutesJs.View` in templates in `web/views/layout_view.ex` file:

```elixir
defmodule Project.LayoutView do
  ...
  import PhoenixRoutesJs.View
  ...
end

```

2) Add helper `render_routes_script` to you layout in `/web/templates/layout/app.html.eex` before main javascript file:

```elixir
  ...
  <%= render_routes_script(@conn) %>
  <script src="<%= static_path(@conn, "/js/app.js") %>"></script>
  ...
```

Now you can read phoenix variables in browser console and javascript code.

### JavaScript

#### Helpers
```
   user_path   GET      /users            UserController :index    Routes.user_path('index')
   user_path   GET      /users/:id/edit   UserController :edit     Routes.user_path('edit', ':id')
   user_path   GET      /users/new        UserController :new      Routes.user_path('new')
   user_path   GET      /users/:id        UserController :show     Routes.user_path('show', ':id')
   user_path   POST     /users            UserController :create   Routes.user_path('create')
   user_path   PATCH    /users/:id        UserController :update   Routes.user_path('update', ':id')
               PUT      /users/:id        UserController :update   
   user_path   DELETE   /users/:id        UserController :delete   Routes.user_path('delete', ':id')
```

Routes object is kept in `window`.

#### Browser

Now you can access to you helpers in console:

```javascript
// browser console

Routes.user_path('edit', 1)

//=> /users/1
```

#### JavaScript assets

```JavaScript
// Somewhere in javascript modules

window.Routes.user_path('edit', 1)

//=> /users/1
```

#### JavaScript options:

Routes options:

  - `format` - Add '.format' to request path string.
  - `params` - Add query string to request path.
  
```JavaScript
Routes.user_path('index', {format: 'json', params: {filter: 'query', sort: 'acs'}})

//=> "/users.json?filter=query&sort=acs"
```

## License

The library is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
