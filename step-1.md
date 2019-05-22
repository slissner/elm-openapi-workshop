# Step 1: Settings up a api.json OpenAPI 3 file

## Getting started

First set up your workspace in the source folder.

```bash
cd src
mkdir client
```

Make sure you stay in `src` throughout the workshop. (Note: my final results are committed into `src-example`)

## Setting up the server with swagger (npm)

```bash
npm install -g swagger
swagger project create server
```

When asked for framework, let's choose `express`, as I assume it is widespread to be know by almost everybody.

Now run `swagger project edit` to open the interactive swagger editor:

```bash
cd server
swagger project start # terminal 1
swagger project edit # terminal 2
```

* **Swagger Editor** lets you edit OpenAPI specifications in YAML inside your browser and to preview documentations in real time.
* **Swagger UI** is a collection of HTML, Javascript, and CSS assets that dynamically generate beautiful documentation from an OAS-compliant API.

## OpenAPI 2.0/3.0

The swagger npm package still uses version 2.0 of OpenAPI. There already exists also a version 3.0. But for demo purposes, this should be fair enough.

Quick introduction for those who are not yet familiar with OpenAPI:

_"OpenAPI Specification (formerly Swagger Specification) is an API description format for REST APIs. An OpenAPI file allows you to describe your entire API, including:"_

(See https://swagger.io/docs/specification/about/)

# A word on the history of Swagger/OpenAPI

The magnitude of concepts may be confusing in the beginning. Some remarks on the history of swagger/openAPI:

* First rule of thumb: "Swagger is older than OpenAPI"
* In 2015 since SmartBear Software donated the "Swagger Specification" to the OpenAPI Initiative – and renamed it from to "OpenAPI specification".
* Second rule of thumb:
  * **OpenAPI** = Specification
  * **Swagger** = Tools for implementing the specification
* Moreover, the **OpenAPI Initiative** involves more the 30 organizations from different areas of the tech world — including Microsoft, Google, IBM, and CapitalOne. Smartbear Software, which is the company that leads the development of the Swagger tools, is also a member of the OpenAPI Initiative, helping lead the evolution of the specification.
* Finally, there are has been a community fork in 2018 of `Swagger Codegen` – which is called `OpenAPI Generator`. The latter we will use in this workshop. Note: The elm client code generator is actively developed for `OpenAPI Generator`, while `Swagger Codegen` has not seen any activity for about a year (as of May 2019).

See also:
* https://swagger.io/blog/api-strategy/difference-between-swagger-and-openapi/
* https://angular.schule/blog/2018-06-swagger-codegen-is-now-openapi-generator

## (Go to step 2)[step-2.md]
