{}:

let
  pinnedSrc = builtins.fetchTarball {
    url = "https://github.com/jraygauthier/pandoc-md-wiki/archive/11cba928401b7c8e436602c719e58424b7baff0b.tar.gz";
    # Get this info from the output of: `nix-prefetch-url --unpack $url` where `url` is the above.
    sha256 = "04257a6acyww30kwmvbmqw44gshs5y2jy9f5yci9kx13xb5r3k3v";
  };
in

pinnedSrc
