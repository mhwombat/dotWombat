{-# LANGUAGE DeriveDataTypeable #-}

import           Control.Monad
    (when)
import           Data.List
    (sort)
import           Data.Time
    (defaultTimeLocale, formatTime, getZonedTime)
import           System.Console.CmdArgs.Implicit
    ( Data
    , Typeable
    , cmdArgs
    , def
    , help
    , opt
    , program
    , summary
    , typ
    , typDir
    , (&=)
    )
import           System.Directory
    ( createDirectoryIfMissing
    , doesDirectoryExist
    , doesFileExist
    , getDirectoryContents
    , getHomeDirectory
    )
import           System.FilePath
    (combine, splitFileName)
import           System.Process
    (runCommand, waitForProcess)

data Command = Command {dir :: FilePath, print_ :: Bool, text :: String}
              deriving (Show, Data, Typeable)

command :: Command
command = Command
  { dir = def &= help "Directory for jotted notes (default: ~/.jot)" &= typDir,
    print_ = def &= help "Print contents of all notes",
    text = def &= opt "" &= help "Text to record (omit to use editor)" &= typ "STRING" }
    &= help "Quickly record and retrieve notes" &= program "jot" &= summary "Jot v1.2"

jot :: Command -> IO ()
jot (Command "" l t) = do
  home <- getHomeDirectory
  jot (Command (combine home ".jot") l t)
jot (Command d True _) = do
  e <- doesDirectoryExist d
  when e $ mapM_ printNote =<< getFileList d
jot (Command d _ t) = do
  createDirectoryIfMissing True d
  filename <- genFileName d
  putStrLn $ "Saving your brilliant thought as " ++ filename
  write filename t

getFileList :: FilePath -> IO [FilePath]
getFileList d = do
    fs <- getDirectoryContents d
    return $ map (combine d) $ sort $ filter (`notElem` [".", ".."]) fs

printNote :: FilePath -> IO ()
printNote f = do
  let (_, f') = splitFileName f
  putStrLn $ "--- " ++ f' ++ " ---"
  s <- readFile f
  putStrLn s

write :: FilePath -> String -> IO ()
write f "" = do
  p <- runCommand ("nano " ++ f)
  _ <- waitForProcess p
  return ()
write f t = writeFile f t

genFileName :: FilePath -> IO FilePath
genFileName d = do
  timestamp <- fmap (formatTime defaultTimeLocale "%y%m%d%H%M%S%z") getZonedTime
  makeUnique $ combine d $ "jot" ++ '_':timestamp

makeUnique :: FilePath -> IO FilePath
makeUnique f = do
  e <- doesFileExist f
  if e then makeUnique (f ++ ".1") else return f

main :: IO ()
main = jot =<< cmdArgs command
