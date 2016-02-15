module Paths_haskell_hello (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/bella/Projects/haskell-hello/.cabal-sandbox/bin"
libdir     = "/Users/bella/Projects/haskell-hello/.cabal-sandbox/lib/x86_64-osx-ghc-7.10.2/haskell-hello-0.1.0.0-AxMUcsX9XvaLRp3JiPdJS7"
datadir    = "/Users/bella/Projects/haskell-hello/.cabal-sandbox/share/x86_64-osx-ghc-7.10.2/haskell-hello-0.1.0.0"
libexecdir = "/Users/bella/Projects/haskell-hello/.cabal-sandbox/libexec"
sysconfdir = "/Users/bella/Projects/haskell-hello/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haskell_hello_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskell_hello_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "haskell_hello_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskell_hello_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haskell_hello_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
