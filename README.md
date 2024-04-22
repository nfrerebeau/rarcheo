# R pour l'archéologue

[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)

Ce livre s'adresse aux personnes qui souhaitent analyser, visualiser et modéliser des données archéologiques à l'aide du [langage R](https://www.r-project.org/). Cet ouvrage vous permet d'acquérir les connaissances et les compétences nécessaires pour aborder un large éventail de problèmes liés aux données archéologiques.

Bien qu'il soit initialement conçu pour les étudiants du master mention *Archéologie, sciences pour l'archéologie* de l'[Université Bordeaux Montaigne](https://www.u-bordeaux-montaigne.fr/), ce livre s'adresse à tout étudiant, doctorant, post-doctorant ou archéologue professionnel souhaitant découvrir le langage R et s'y initier pour l'analyse de données archéologiques.

## Contribuer

Ce livre a été écrit dans [RStudio](http://www.rstudio.com/ide/) avec [Quarto](https://quarto.org/). Le code source peut être forké puis cloné depuis [GitHub](https://github.com/nfrerebeau/rarcheo) :

``` r
# install.packages("usethis")
usethis::create_from_github("nfrerebeau/rarcheo")
```

Pour être le plus portable et reproductible possible, ce livre utilise le package [**renv**](https://rstudio.github.io/renv/) pour gérer les packages utilisés. L'ouverture du projet avec RStudio doit déclencher l'installation de **renv**, les packages nécessaires peuvent ensuite être installés avec :

``` r
renv::restore()
```

## Code de conduite

Ce projet est publié avec un [code de conduite du contributeur](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). En contribuant à ce projet, vous acceptez de vous conformer à ses termes.
