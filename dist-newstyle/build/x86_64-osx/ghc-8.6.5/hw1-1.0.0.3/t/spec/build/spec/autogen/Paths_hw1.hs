{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_hw1 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,0,0,3] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/spooky/.cabal/bin"
libdir     = "/Users/spooky/.cabal/lib/x86_64-osx-ghc-8.6.5/hw1-1.0.0.3-inplace-spec"
dynlibdir  = "/Users/spooky/.cabal/lib/x86_64-osx-ghc-8.6.5"
datadir    = "/Users/spooky/.cabal/share/x86_64-osx-ghc-8.6.5/hw1-1.0.0.3"
libexecdir = "/Users/spooky/.cabal/libexec/x86_64-osx-ghc-8.6.5/hw1-1.0.0.3"
sysconfdir = "/Users/spooky/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hw1_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hw1_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "hw1_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "hw1_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hw1_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hw1_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
