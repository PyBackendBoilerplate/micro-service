"""APIs implementation.

Implementing the route's RESTFul API.

  To attach route handlers functions to their routes in the relevant openapi yaml file, use this:
  x-openapi-router-controller: [module path after src].[python module name (without extension)]
  operationId: Route handler function name

  Example:
  x-openapi-router-controller: api.hello.world.greeting.greeting
  operationId: greeting
"""

from api.hello.world.root import root


def greeting() -> str:
    return root().replace('Hello, World', 'Greetings')
