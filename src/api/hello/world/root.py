"""APIs implementation.

Implementing the route's RESTFul API.

  To attach route handlers functions to their routes in the relevant openapi yaml file, use this:
  x-openapi-router-controller: [module path after src].[python module name (without extension)]
  operationId: Route handler function name

  Example:
  x-openapi-router-controller: api.hello.world.root
  operationId: root
"""

from datetime import datetime


def root() -> str:
    now = datetime.now()
    formatted_now = now.strftime('%A, %d %B, %Y at %X')

    content = f"Hello, World! It's {formatted_now}"
    return content