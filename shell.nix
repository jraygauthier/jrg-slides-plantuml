{ nixpkgs ? import ./.nix/pinned-nixpkgs.nix {} }:

with nixpkgs;

let
  pandoc-md-wiki-src = import ./.nix/local-or-pinned-pandoc-md-wiki-src.nix {};
  revealJsSrc = builtins.fetchTarball {
    name = "revealjs-src";
    url = https://github.com/hakimel/reveal.js/archive/3.8.0.tar.gz;
    sha256 = "14cva2hxdv4gxpz2a996qs8xhxffw97a90gkz2mmgdczh1kyn1sc";
  };
in

mkShell rec {
  buildInputs = [
    pandoc
    curl
    wget
    graphviz
    plantuml
    ditaa
    jre
    # diagrams-builder
    coreutils
    (texlive.combine {
      inherit (texlive) scheme-small inconsolata helvetic texinfo fancyvrb cm-super;
    })
  ];

  shellHook = ''
    export REVEAL_JS_SRC="${revealJsSrc}"
    export PANDOC_MD_WIKI_PANDOC_FILTERS="${pandoc-md-wiki-src}/.build-system/pandoc-filters"
    export PANDOC_MD_WIKI_PANDOC_SYNTAX="${pandoc-md-wiki-src}/.build-system/pandoc-syntax"
  '';
}