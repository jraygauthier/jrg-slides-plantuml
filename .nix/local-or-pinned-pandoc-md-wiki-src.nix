{}:

let
  localPath = ../../pandoc-md-wiki;
  src =
    if builtins.pathExists (localPath + /shell-external.nix)
    then localPath
    else import ./pinned-pandoc-md-wiki-src.nix {};
in

src