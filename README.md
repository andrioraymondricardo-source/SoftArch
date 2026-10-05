# Event Management and Ticketing System

C4 and data architecture diagrams for the Event Management and Ticketing System (EMS).

## Tool

Structurizr DSL

## Main Architecture File

`workspace.dsl`

## Running Structurizr Local

Run from the repository root:

```bash
docker run -it --rm \
  --name structurizr-local \
  -p 9000:8080 \
  -v "$(pwd)":/usr/local/structurizr \
  structurizr/structurizr local
```

Then open `http://localhost:9000` in a browser.

## ERD

The Entity Relationship Diagram (ERD) is written using Mermaid.

Source file:

```text
diagrams/ems-erd.mmd
```

### Method 1 - Generate SVG Locally

Run from the repository root:

```bash
npx -p @mermaid-js/mermaid-cli mmdc \
  -i diagrams/ems-erd.mmd \
  -o diagrams/ems-erd.svg
```

Then open:

```text
diagrams/ems-erd.svg
```

to view the generated ERD.

### Method 2 - Mermaid Live Editor

1. Open the Mermaid Live Editor: https://mermaid.ai/live
2. Open `diagrams/ems-erd.mmd`.
3. Copy the Mermaid code into the editor.
4. The ERD will be rendered automatically.