module Express (
  AppM,
  Request,
  Express,
  Handler,
  Route,
  makeExpress,
  httpGet,
  listen,
  runApp) where
  
import Prelude hiding (apply)
import Effect (Effect)

-- FFI-related types - Begin
-- Opaque types to interact with JavaScript
foreign import data Request :: Type
foreign import data Express :: Type

-- JavaScript functions
foreign import makeExpress :: Effect Express
foreign import _get :: Express -> Route -> Handler -> Effect Unit
foreign import _listen :: Express -> Int -> Effect Unit
-- FFI-related types - End

-- Type aliases
type Handler = Request -> String
type Route = String

-- The monad representing an Express application
data AppM a = AppM (Express -> Effect a)

-- Effectful functions
httpGet :: Route -> Handler -> AppM Unit
httpGet route handler = AppM \express ->
  _get express route handler

listen :: Int -> AppM Unit
listen port = AppM \express ->
  _listen express port

-- Runs the Express application
runApp :: AppM Unit -> Effect Express -> Effect Unit
runApp (AppM f) e = do
  express <- e
  f express

-- Class instance to let AppM concatenate (used in 'do' form)
instance bindAppM :: Bind AppM where
  bind (AppM h) f = AppM \express -> do
    res <- h express
    case f res of
      AppM g -> g express

-- Class instance needed by Bind
instance applyAppM :: Apply AppM where
  apply (AppM f) (AppM h) = AppM \express -> do
    trans <- f express
    res <- h express
    pure $ trans res

-- Class instance needed by Apply
instance functorAppM :: Functor AppM where
  map f (AppM h) = AppM \express -> do
    res <- h express
    pure $ f res

