# Enhancing the server with OpenAPI

## Exercises

1. Under `server/api/controllers` add a new `insurances.js` controller. You can simply copy  `hello_world.js` as a template, if you like.
2. Add a first endpoint to that controller: `POST /insurances` that receives an insurance request of that form (e.g.):

```json
{
  "insuranceType": "property",
  "provider": "Capitol Versicherung AG"
}
```

Store the data you receive in-memory in a list.

3. Add a second endpoint to that controller: `GET /insurances` that returns the insurances stored in-memory.

Some help:
* Keep in mind that we use OAS 2.0 with node swagger package (not the newer version 3.0!)
* Don't forget to save your swagger.yaml file frequently to disk (!!)
* Start the server with `DEBUG=swagger-tools* swagger project start` for debugging
* To set up the controller
  * https://github.com/swagger-api/swagger-node/blob/HEAD/docs/README.md
  * https://github.com/swagger-api/swagger-node/blob/c13156bcfd9fbb52c2d07d265718caf8ffb09cb6/docs/controllers.md
* To edit swagger.yaml
  * https://swagger.io/docs/specification/2-0/basic-structure/
  * https://swagger.io/docs/specification/2-0/describing-request-body/
  * https://swagger.io/docs/specification/2-0/describing-responses/

## Continue

[Go to step 4](step-4.md)
