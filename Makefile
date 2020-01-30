
MKF_DIR := $(abspath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
SRC_ROOT_DIR := $(MKF_DIR)
FN_SRC_REL_TO_ROOT = $(shell realpath --relative-to "$(shell dirname "$(SRC_ROOT_DIR)/$(1)")" "$(SRC_ROOT_DIR)")

PMW_FILTER_DIR=$(PANDOC_MD_WIKI_PANDOC_FILTERS)
PMW_SYNTAX_DIR=$(PANDOC_MD_WIKI_PANDOC_SYNTAX)

REVEALJS_DEV_MODE := 0

REVEALJS_ASSETS_DIRNAME=revealjs-assets

ifeq ($(REVEALJS_DEV_MODE), 1)
  # REVEALJS_URL=$(REVEAL_JS_SRC)
  REVEALJS_URL=./$(REVEALJS_ASSETS_DIRNAME)
else
  # Bundle mode:
  REVEALJS_URL=./$(REVEALJS_ASSETS_DIRNAME)

  # REVEALJS_URL=https://lab.hakim.se/reveal-js
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
  REVEALJS_SELF_CONT_ARG=
  # Still leaves some refs such as plugins and others. However, the presentation
  # runs fine without it in firefox. The only thing I notive is I no longer can
  # access speaker notes. However chromium does not seem to support the self
  # contained version when unconnected.
  # REVEALJS_SELF_CONT_ARG=--self-contained
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

.PHONY: \
	clean \
	all \
	clean-published-site \
	publish-site \
	clean-published-slides \
	publish-slides \
	publish-slides-current \
	clean-slides \
	slides \
	clean-revealjs \
	revealjs \
	revealjs-and-preview \
	preview-revealjs \
	clean-revealjs-local-assets
	revealjs-local-assets \

all: \
	slides

clean: \
	clean-slides

clean-published-site: \
	clean-published-slides

publish-site: \
	publish-slides

clean-published-slides:
	rm -rf ./docs/revealjs-assets
	rm -rf ./docs/media
	rm -rf ./docs/css
	rm -f ./docs/*.fr.html

publish-slides: | slides publish-slides-current

publish-slides-current: | clean-published-slides
	mkdir -p ./docs
	cp --no-preserve=mode -r -H ./revealjs-assets ./docs/revealjs-assets
	cp -r ./media ./docs/media
	cp -r ./css ./docs/css
	cp ./slides-revealjs.fr.html ./docs/slides-revealjs.fr.html

clean-slides: \
	clean-revealjs

slides: revealjs

clean-revealjs: clean-revealjs-local-assets
	rm -rf ./media
	rm slides-revealjs.fr.html

revealjs: revealjs-local-assets $(SLIDES_FR_SRCS)
	PANDOC_MD_WIKI_REL_PATH_FROM_PAGE_TO_ROOT_DIR="$(call FN_SRC_REL_TO_ROOT,slides.fr.md)" \
	pandoc -s \
		$(REVEALJS_SELF_CONT_ARG) \
		$(REVEALJS_TEMPLATE_ARG) \
		--mathjax $(REVEALJS_INCREMENTAL_ARG) -t revealjs \
		$(REVEALJS_SYNTAX_ARGS) \
		--slide-level=2	\
		--extract-media "./media" \
		--resource-path "." \
		--css "./css/revealjs.css" \
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


revealjs-and-preview: | revealjs preview-revealjs

preview-revealjs:
	firefox ./slides-revealjs.fr.html

clean-revealjs-local-assets:
	! test -e ./$(REVEALJS_ASSETS_DIRNAME) || unlink ./$(REVEALJS_ASSETS_DIRNAME)

revealjs-local-assets:
	ln -fsT "$(REVEAL_JS_SRC)" ./$(REVEALJS_ASSETS_DIRNAME)

