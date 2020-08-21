import os
import sys
from pathlib import Path

sys.path.append(os.path.join(sys.path[0], 'src'))

from sdk.infra.app.wsgi import create_connexion_microservice

# Create the microservice and receive its settings

microservice, settings = create_connexion_microservice()

# Modify the settings as required

settings.openapi_spec = Path('src/openapi/openapi.yaml')

# Use the microservice to create the WSGI app instance (with the modified settings)

connexion_app = microservice.create_app()

# For automatic app:app lookup
app = connexion_app.app
