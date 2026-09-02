# Urban Marathon Management System

C4 architecture diagrams for the Urban Marathon Management System.

## Tool

Structurizr DSL

## Main Architecture File

`workspace.dsl`

## Running Structurizr Local

Run from the repository root:

docker run -it --rm \
  --name structurizr-local \
  -p 9000:8080 \
  -v "$(pwd)":/usr/local/structurizr \
  structurizr/structurizr local

Then open localhost:9000 in a browser.