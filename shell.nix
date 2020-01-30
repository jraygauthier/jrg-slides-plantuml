{ nixpkgs ? import ./.nix/pinned-nixpkgs.nix {} }:

with nixpkgs;

let
  pandoc-md-wiki-src = import ./.nix/local-or-pinned-pandoc-md-wiki-src.nix {};
  revealjs-assets = builtins.fetchTarball {
    name = "revealjs-assets";
    url = https://github.com/hakimel/reveal.js/archive/3.8.0.tar.gz;
    sha256 = "14cva2hxdv4gxpz2a996qs8xhxffw97a90gkz2mmgdczh1kyn1sc";
  };
  revealjs-toolbar-assets = builtins.fetchTarball {
    name = "revealjs-toolbar-assets";
    url = https://github.com/denehyg/reveal.js-toolbar/archive/0.2.1.tar.gz;
    sha256 = "0b4m9yhfmjv3wj209xki58lfxz997a9is9xa9zfgk6kc2wwp4icv";
  };
  revealjs-menu-assets = builtins.fetchTarball {
    name = "revealjs-menu-assets";
    url = https://github.com/denehyg/reveal.js-menu/archive/1.2.0.tar.gz;
    sha256 = "16kcwjxlq6ksqayks6d2wnmn316jwzg6prz1xyhcqpakwdlkdpkq";
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
    export REVEALJS_ASSETS="${revealjs-assets}"
    export REVEALJS_TOOLBAR_ASSETS="${revealjs-toolbar-assets}"
    export REVEALJS_MENU_ASSETS="${revealjs-menu-assets}"
    export PANDOC_MD_WIKI_PANDOC_FILTERS="${pandoc-md-wiki-src}/.build-system/pandoc-filters"
    export PANDOC_MD_WIKI_PANDOC_SYNTAX="${pandoc-md-wiki-src}/.build-system/pandoc-syntax"
  '';
}