module FPSound.Try.Compile where

import Prelude

import Data.Nullable (Nullable)
import Data.Newtype (unwrap)
import Foreign.Object as Object
import Control.Monad.Except (runExceptT)
import Effect.Aff (launchAff_)
import Data.Either (Either(..))
import Effect (Effect)
import Effect.Class (liftEffect)
import Effect.Exception (Error, error)
import FPSound.Try.Loader (runLoader, Loader, makeLoader)
import FPSound.Try.Types (JS(..))
import FPSound.Try.API as API
import FPSound.Try.Config as Config

loader :: Loader
loader = makeLoader Config.loaderUrl

type CompileSuccess =
  { js :: Object.Object String
  , warnings :: Nullable (Array API.CompileWarning)
  }

compile
  :: String
  -> (Error -> Effect Unit)
  -> (Array API.CompilerError -> Effect Unit)
  -> (CompileSuccess -> Effect Unit)
  -> Effect Unit
compile code errCb cErrCb sucCb = launchAff_ do
  cres <- runExceptT (API.compile Config.compileUrl code)
  case cres of
    Left err -> liftEffect $ errCb (error err)
    Right (Left err) -> liftEffect $ errCb (error err)
    Right (Right (API.CompileFailed cf)) ->
      case cf.error of
        API.OtherError e -> liftEffect $ errCb (error e)
        API.CompilerErrors errs -> liftEffect $ cErrCb errs
    Right (Right (API.CompileSuccess { js, warnings })) -> do
      mbSources <- runExceptT $ runLoader loader (JS js)
      case mbSources of
        Left e -> liftEffect $ errCb (error e)
        Right sources -> do
          let eventData = Object.insert "<file>" (JS js) sources
          liftEffect $ sucCb { warnings, js: map unwrap eventData }

