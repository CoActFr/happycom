mainRouter = express.Router()
mainRouter.use (request, response, next) ->
  console.log '%s MainRouter: %s', request.method, request.url
  next()

# Assets

mainRouter.get '/%styles%/main.css', (request, response) ->
  response.sendFile 'main.css', root: './%styles%'

mainRouter.get '/%scripts%/vendor.js', (request, response) ->
  response.sendFile 'vendor.js', root: './%scripts%'

mainRouter.get '/%scripts%/app.js', (request, response) ->
  response.sendFile 'app.js', root: './%scripts%'

mainRouter.get '/img/:image', (request, response) ->
  response.sendFile request.params.image, root: './img'

mainRouter.get '/fonts/:font', (request, response) ->
  response.sendFile request.params.font, root: './fonts'

mainRouter.get '/favicon.ico', (request, response) ->
  response.sendFile 'favicon.ico', root: '.'

mainRouter.get '/sitemap.xml', (request, response) ->
  response.sendFile 'sitemap.xml', root: '.'

mainRouter.get '/robots.txt', (request, response) ->
  response.sendFile 'robots.txt', root: '.'

# Routes

pagesAccepted = []

mainRouter.get '/', (request, response) ->
  response.render 'main/landing', analytics: IS_PROD

mainRouter.get '/:page', (request, response) ->
  if request.params.page in pagesAccepted
    response.render 'main/' + request.params.page, analytics: IS_PROD
  else
    response.status(404)
    .send 'Not found'

module.exports = mainRouter
