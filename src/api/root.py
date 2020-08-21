"""APIs implementation.

Implementing the route's RESTFul API.

  To attach route handlers functions to their routes in the relevant openapi yaml file, use this:
  x-openapi-router-controller: [module path after src].[python module name (without extension)]
  operationId: Route handler function name

  Example:
  x-openapi-router-controller: api.root
  operationId: root
"""


def root() -> str:
    return 'Swagger UI: http://localhost:5000/v1.0/ui/#/'