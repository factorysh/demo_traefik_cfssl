Traefik demo with a static SSL
==============================

Requirements:
  - docker
  - docker-compose
  - cfssl

Build stuff:

    make docker-build

Start traefik and a backend:

    make up

Launch the client:

    make client