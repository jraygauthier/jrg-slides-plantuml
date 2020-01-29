
MKF_DIR := $(abspath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
SRC_ROOT_DIR := $(MKF_DIR)
FN_SRC_REL_TO_ROOT = $(shell realpath --relative-to "$(shell dirname "$(SRC_ROOT_DIR)/$(1)")" "$(SRC_ROOT_DIR)")

PMW_FILTER_DIR=$(PANDOC_MD_WIKI_PANDOC_FILTERS)
PMW_SYNTAX_DIR=$(PANDOC_MD_WIKI_PANDOC_SYNTAX)

REVEALJS_DEV_MODE := 0

REVEALJS_ASSETS_DIRNAME=revealjs_assets

ifeq ($(REVEALJS_DEV_MODE), 1)
  REVEALJS_URL=$(REVEAL_JS_SRC)
else
# Bundle mode:
# REVEALJS_URL=./$(REVEALJS_ASSETS_DIRNAME)

  REVEALJS_URL=http://lab.hakim.se/reveal-js
endif


# “default”, “simple”, “sky”, “beige”, “serif”, “solarized”,
# “blood”, “moon”, “night”, “black”, “league” or “white”
#REVEALJS_THEME=default

# REVEALJS_THEME=simple

# Colored
#REVEALJS_THEME=moon # Bluish. Boring.
#REVEALJS_THEME=solarized # Yelloish. Boring.
# REVEALJS_THEME=serif # Yellowish with serif character. Boring.
#REVEALJS_THEME=beige # Yellowish. Boring.

# Grey themes
# REVEALJS_THEME=league

# Clear themes
#REVEALJS_THEME=sky # With tango
#REVEALJS_THEME=white # Paper Printable # With tango

# Black themes
# REVEALJS_THEME=blood # With zenburn
# REVEALJS_THEME=black # With zenburn
REVEALJS_THEME=night # With zenburn

# Chosen themes
# REVEALJS_THEME=white # Paper Printable # With tango
# REVEALJS_THEME=night # With zenburn


# “default”, “tango”, “pygments”, “kate”, “monochrome”,
# “espresso”, “zenburn”, and “haddock”.
# Pass null to prevent syntax highlighting.
ifeq ($(REVEALJS_THEME), white)
  # REVEALJS_HIGHLIGHT=tango
  REVEALJS_HIGHLIGHT=pygments
  # REVEALJS_HIGHLIGHT=kate
else
  REVEALJS_HIGHLIGHT=zenburn # With blood
  #REVEALJS_HIGHLIGHT=espresso
endif
# “default”, “fade”, “slide”, “convex”, “concave”, “zoom” or “none”.
REVEALJS_TRANSITION=fade

# “default”, “fade”, “slide”, “convex”, “concave”, “zoom” or “none”
REVEALJS_BG_TRANSITION=concave

# All presentations have a normal size, that is, the resolution at which they are authored.
# The framework will automatically scale presentations uniformly based on this size to ensure
# that everything fits on any given display or viewport.
REVEALJS_AUTHOR_WIDTH=1920
REVEALJS_AUTHOR_HEIGHT=1080

# Bounds for smallest/largest possible scale to apply to content
REVEALJS_MINSCALE=0.2
REVEALJS_MAXSCALE=2.0


REVEALJS_INCREMENTAL_ARG=--incremental
#REVEALJS_INCREMENTAL_ARG=

ifeq ($(REVEALJS_DEV_MODE), 1)
  REVEALJS_SELF_CONT_ARG=
else
  # Still leaves some refs such as plugins and others. However, the presentation
  # runs fine without it in firefox. The only thing I notive is I no longer can
  # access speaker notes. However chromium does not seem to support the self
  # contained version when unconnected.
  REVEALJS_SELF_CONT_ARG=--self-contained
endif

REVEALJS_TEMPLATE_ARG = --template=./style/revealjs.template

REVEALJS_FILTER_ARGS = \
	--lua-filter="$(PMW_FILTER_DIR)/local-links-abs-to-rel.lua" \
	--lua-filter="$(PMW_FILTER_DIR)/local-links-to-target-ext.lua" \
	--lua-filter="$(PMW_FILTER_DIR)/imports-to-link.lua" \
	--lua-filter="$(PMW_FILTER_DIR)/puml-cb-to-img.lua"

REVEALJS_SYNTAX_ARGS := \
	--highlight-style $(REVEALJS_HIGHLIGHT) \
	--syntax-definition="$(PMW_SYNTAX_DIR)/plantuml.xml"


EXCLUDED_DIR_FIND_ARGS := -not -path '*/.git/*'
SLIDES_FR_SRCS := $(shell \
	find . -mindepth 1 -maxdepth 1 -type f -name '*.fr.md' $(EXCLUDED_DIR_FIND_ARGS) -printf '%P\n' | sort)

.PHONY: all clean slides site revealjs revealjs-and-preview

all: \
	slides \
	site

site: \
	slides \
	index

index: index.md
	pandoc -s -o index.html index.md

slides: revealjs

revealjs: $(SLIDES_FR_SRCS)
	PANDOC_MD_WIKI_REL_PATH_FROM_PAGE_TO_ROOT_DIR="$(call FN_SRC_REL_TO_ROOT,slides.fr.md)" \
	pandoc -s \
		$(REVEALJS_SELF_CONT_ARG) \
		$(REVEALJS_TEMPLATE_ARG) \
		--mathjax $(REVEALJS_INCREMENTAL_ARG) -t revealjs \
		$(REVEALJS_SYNTAX_ARGS) \
		--slide-level=2	\
		--extract-media "./media" \
		--resource-path "." \
		--css "./style/revealjs.css" \
		-V theme=$(REVEALJS_THEME) \
		-V transistion="$(REVEALJS_TRANSITION)" \
		-V backgroundTransition="$(REVEALJS_BG_TRANSITION)" \
		-V revealjs-url="$(REVEALJS_URL)" \
		-V minScale=$(REVEALJS_MINSCALE) \
		-V maxScale=$(REVEALJS_MAXSCALE) \
		-V width=$(REVEALJS_AUTHOR_WIDTH) \
		-V height=$(REVEALJS_AUTHOR_HEIGHT) \
		-V center=false \
		-o slides-revealjs.fr.html \
		$(REVEALJS_FILTER_ARGS) \
		$(SLIDES_FR_SRCS)

revealjs-and-preview: revealjs
	firefox ./slides-revealjs.fr.html

