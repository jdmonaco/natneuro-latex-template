## LaTeX Template for Scientific Manuscript

There are many LaTeX templates for scientific manuscripts out there (see the
[writeLaTeX template gallery](https://www.writelatex.com/templates)), but
this template is based on a recent manuscript that I put together for [Nature
Neuroscience](http://www.nature.com/neuro/index.html). The requirements were
annoying and the document ended up being quite complex. My previously helpful
manuscript template ballooned with complexity and corresponding hacks and
kludges. This template is my attempt at distilling out the hackiness and
including nice features that I wish I had had while writing, such as mirroring
the supplementary figure captions at the end of the main manuscript, making
the figures appear correctly at scale, and handling citations correctly across
sections.

### File organization

One of the goals here was a modular document, so most of the content is
contained in `\include`'d files. You can change what gets rendered using the
`\includeonly` command in the preamble, and I have a bunch of precooked ones
there already (but commented out). (An unfortunate quirk I found is that
`latexdiff` looks for `\includeonly` commands but doesn't recognize if they
are commented out, so I also obfuscated them by inserting asterisks.) I have
a script ([git-ldiff.sh](https://github.com/jdmonaco/git-latexdiff-wrapper))
for compiling diffs between git revisions using `latexdiff`, but a current
version of `latexdiff` is necessary to allow recursive `\include`s. Figures
are currently assumed to be PNG images named `figures/Figures_<key>.png` or
`figures/SuppFigures_<key>.png`. There are additional notes in the comments of
`main.tex` that document how most things work
