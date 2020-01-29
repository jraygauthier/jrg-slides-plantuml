{}:

let
  pinnedSrc = builtins.fetchTarball {
    url = "https://github.com/jraygauthier/pandoc-md-wiki/archive/b71523837dc21836d69936022830cbd834d6d8f6.tar.gz";
    # Get this info from the output of: `nix-prefetch-url --unpack $url` where `url` is the above.
    sha256 = "0fdj4raapw2kbhn1nlmhpkp2xkq8j35fjlclhzr4sfz5979kgzgm";
  };
in

pinnedSrc
