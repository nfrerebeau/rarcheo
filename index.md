--- 
title: "R pour l'archéologue"
author:
- Nicolas Frerebeau
date: "2021-11-02"
site: bookdown::bookdown_site
documentclass: scrbook
bibliography: [book.bib, packages.bib]
# url: your book url like https://bookdown.org/yihui/bookdown
# cover-image: path to the social sharing image like images/cover.jpg
description: |
  Ce livre s'adresse aux personnes qui souhaitent analyser, visualiser et 
  modéliser des données archéologiques à l'aide du langage R. Cet ouvrage vous 
  permet d'acquérir les connaissances et les compétences nécessaires pour 
  aborder un large éventail de problèmes liés aux données archéologiques.
biblio-style: apa
csl: chicago-fullnote-bibliography.csl
lang: fr
---



# Avant propos {-}

Ce livre s'adresse aux personnes qui souhaitent analyser, visualiser et modéliser des données archéologiques à l'aide du [langage R](https://www.r-project.org/). Cet ouvrage vous permet d'acquérir les connaissances et les compétences nécessaires pour aborder un large éventail de problèmes liés aux données archéologiques.

Bien qu'il soit initialement conçu pour les étudiants du master mention *Archéologie, sciences pour l'archéologie* de l'[Université Bordeaux Montaigne](https://www.u-bordeaux-montaigne.fr/), ce livre s'adresse à tout étudiant, doctorant, post-doctorant ou archéologue professionnel souhaitant découvrir le langage R et s'y initier pour l'analyse de données archéologiques.

Ce livre s'adresse à des utilisateurs débutants, il ne demande aucun prérequis en programmation. Bien que des notions élémentaires soient rappelées au fil de l'ouvrage, ce livre n'est pas un manuel de statistiques. Le lecteur trouvera des [suggestions de lecture](#ressources-complémentaires) complémentaires à la fin de l'introduction.

## Licence {-}

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Licence Creative Commons" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a>

Ce livre est mis à disposition selon les termes de la <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">licence Creative Commons Attribution - Pas d'Utilisation Commerciale - Partage dans les Mêmes Conditions 4.0 International</a>^[Cela signifie que vous êtes libre de copier, distribuer et communiquer ce livre par tous moyens et sous tous formats, de modifier, transformer et créer à partir du matériel de ce livre. En contrepartie, vous devez créditer la source d'origine en précisant si vous l'avez modifiée, vous devez partager sous la même licence et vous ne pouvez pas en faire un usage commercial.].

Le code contenu dans ce livre est simultanément disponible sous la [licence MIT](https://opensource.org/licenses/MIT)^[Cela signifie que vous êtes libre de l'utiliser dans vos propres projets, à condition de citer la source.].

## Contributions {-}

Le [code source](https://github.com/nfrerebeau/rarcheo) de ce livre est disponible sur [GitHub](https://github.com/). N'hésitez pas à y [ouvrir un ticket](https://github.com/nfrerebeau/rarcheo/issues) pour signaler toutes les erreurs que vous pourrez constater ou proposer des modifications.

## Exemples {-}

Les données utilisées dans les exemples sont issues des packages *datasets* [@R-base] et [*folio*](https://packages.tesselle.org/folio/) [@R-folio].

Les exemples reposant sur la génération de nombre aléatoires sont reproductibles en utilisant `set.seed(12345)`.

## Colophon {-}

Ce livre a été écrit dans [RStudio](http://www.rstudio.com/ide/) avec le package R [bookdown](http://bookdown.org/) [@bookdown2016]. Le site web est hébergé par [GitHub Pages](https://pages.github.com/) et automatiquement mis à jour après chaque commit.

Cette version du livre a été réalisée avec R version 4.1.2 (2021-11-01), les packages utilisés sont résumés dans le tableau \@ref(tab:packages).


Table: (\#tab:packages)Liste des packages utilisés.

|Package     |Version |Source         |Référence      |
|:-----------|:-------|:--------------|:--------------|
|bookdown    |0.24    |CRAN (R 4.1.2) |@R-bookdown    |
|bslib       |0.3.1   |CRAN (R 4.1.2) |@R-bslib       |
|desc        |1.4.0   |CRAN (R 4.1.2) |@R-desc        |
|DiagrammeR  |1.0.6.1 |CRAN (R 4.1.2) |@R-DiagrammeR  |
|downlit     |0.2.1   |CRAN (R 4.1.2) |@R-downlit     |
|folio       |1.0.0   |CRAN (R 4.1.2) |@R-folio       |
|knitr       |1.36    |CRAN (R 4.1.2) |@R-knitr       |
|markdown    |1.1     |CRAN (R 4.1.2) |@R-markdown    |
|mime        |0.12    |CRAN (R 4.1.2) |@R-mime        |
|rmarkdown   |2.11    |CRAN (R 4.1.2) |@R-rmarkdown   |
|sessioninfo |1.1.1   |CRAN (R 4.1.2) |@R-sessioninfo |
|webshot     |NA      |NA             |@R-webshot     |
|xml2        |1.3.2   |CRAN (R 4.1.2) |@R-xml2        |
