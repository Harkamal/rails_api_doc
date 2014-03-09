**Here are the steps to use rails API Doc for generating API documentaion. This engine uses "apidoc(A RESTful web API Documentation Generator) a node application". The main objective of this engine is to provide web interface for generating api documentation using apidoc without taking care of actual syntax of apidoc. The actual syntax can be reviewed from "http://www.apidocjs.com/"**

DEPENDENCY
**Install* -- npm install apidoc -g

Follow these steps:

* Place the engine code in rails app vendor/engines/ directory
* Include engine code as a gem -- gem 'rails_api_doc', path: "vendor/engines/rails_api_doc"

* Mount the engine routes in the application -- mount RailsApiDoc::Engine => "/rails_api_doc"

* Install the migrations -- rake rails_api_doc:install:migrations

* Visit Rails API Doc Url -- ROOT_URL/rails_api_doc
