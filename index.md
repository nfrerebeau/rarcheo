--- 
title: "R pour l'archéologue"
subtitle: "Exploration, visualisation et analyse de données"
author:
- Nicolas Frerebeau
- Ben Marwick
date: "2022-06-13"
site: bookdown::bookdown_site
documentclass: scrbook
bibliography: [book.bib, packages.bib]
url: https://rstats.archaeo.science
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

Ce livre s'adresse aux personnes qui souhaitent analyser, visualiser et modéliser des données archéologiques à l'aide du [langage R](https://www.r-project.org/) [@R-base]. Cet ouvrage doit vous permettre d'acquérir les connaissances et les compétences nécessaires pour aborder un large éventail de problèmes dans le cadre des sciences archéologiques. Par science archéologique, nous entendons ici une recherche systématique, objective et empirique sur les comportements humains et les sociétés du passé, à partir de données issues de vestiges et de traces matérielles.

**Ce livre est en cours de rédaction.**



## Que contient ce livre ? {-}

Le but n'est pas d'être exhaustif, mais de se concentrer sur ce que nous pensons être les compétences essentielles à tout archéologue souhaitant utiliser R. Certains archéologues utilisent déjà R de manière *ad hoc*, pour un tracer un graphique par-ci, ou ajuster un modèle linéaire par-là. Si vous êtes l'une de ces personnes, vous serrez sans doute déjà familier de certains aspects développés dans ce livre. Notre objectif est que vous y trouviez également, quelque soit votre pratique, de nouvelles idées en vous montrant comment R peut être au centre de votre travail de recherche, de l'acquisition des données brutes jusqu'à la finalisation de votre thèse, rapport ou manuscrit.

Bien que des notions élémentaires soient rappelées au fil de l'ouvrage, ce livre n'est pas un manuel de statistiques. Il ne contient pas (ou peu) de discussions détaillées sur la théorie statistique, et le lecteur sera invité à consulter à d'autres textes concernant les détails techniques des algorithmes, etc. Le lecteur trouvera ainsi des [suggestions de lecture](#ressources-complémentaires) complémentaires à la fin de l'introduction générale et au début de chaque partie du livre^[L'ensemble des références citées dans cet ouvrage est disponible sous la forme d'une [bibliographie Zotero](https://www.zotero.org/groups/4507200/rarcheo/library)].

Ce livre se veut une introduction pratique au langage R pour la réalisation efficaces de tâches courantes en archéologie. Sa lecture doit servir de tremplin vers une utilisation de R plus avancée. Les principaux sujets abordés dans ce livre sont les suivants :

* Le chapitre XX vous permettra de vous familiariser avec le langage R et d'acquérir les notions élémentaires qui vous permettrons de progresser dans la lecture de l'ouvrage. Ce premier chapitre constitue également un aide-mémoire, vers lequel vous tourner au cours de la lecture des différents chapitres.
* Le chapitre XX expose les motivations et modalités conduisant à mettre en œuvre une recherche ouverte et reproductible en archéologie (une bonne pratique pour la science en général, et pour votre productivité individuelle en particulier).
* Le chapitre XX propose un certain nombre de recommandations quant à l'organisation de votre travail en amont de l'analyse pour en faciliter la réalisation.
* Le chapitre X doit vous permettre de travailler avec des structures de données courantes en archéologie, les lire avec R et les manipuler pour les préparer en vue d'être analysées.
* Le chapitre XX
* Le chapitre XX
* Le chapitre XX Travailler avec des données de comptage d'artéfacts ou de restes de faune ou de flore.
* Le chapitre XX : biométrie.
* Le chapitre XX vous guidera dans l'univers très contraint de l'analyse des données de composition.
* Le chapitre XX détaille comment travailler avec des données chronologiques (relatives et absolues) en analysant des données stratigraphiques, en réalisant des sériations, et en calibrant, analysant et visualisant des datation radiocarbone.
* Le chapitre XX est une introduction à l'analyse de données spatiales et à la cartographie.
* Le chapitre XX : simplifier la recherche collaborative grâce au contrôle de version.

## Pour qui ce livre est-il écrit ? {-}

Ce livre s'adresse à tout étudiant, doctorant, post-doctorant ou archéologue professionnel souhaitant découvrir le langage R et s'y initier pour l'analyse de données archéologiques. Il s'adresse ainsi aux archéologues désireux d'élargir leurs horizons analytiques et d'accéder à de nouvelles méthodes et à des moyens plus efficaces d'organiser leur processus de recherche. 

Il est écrit pour des utilisateurs débutants et aucune connaissance préalable de R, de l'informatique ou de la programmation n'est attendue. Cependant, un peu de curiosité pour les statistiques sera nécessaire, ainsi que la volonté de lire au-delà de ce livre, pour prendre judicieusement des décisions quant à la pertinence d'une méthode statistique au regard d'un problème spécifique.

La plupart des méthodes présentées ici sont destinées à des données tabulaires, c'est-à-dire des données qui sont généralement saisies dans des feuilles de calcul et des bases de données. Plus précisément, le livre s'adresse aux archéologues qui utilisent des données organisées en lignes (c'est-à-dire des variables) et en colonnes (c'est-à-dire des spécimens, des échantillons ou des observations). De nombreux jeux de données archéologiques sont organisés différemment, comme les images ou les textes. Bien que R soit également utile pour ces derniers, nous ne les abordons pas en détail ici. Les données tabulaires sont la forme la plus courante en archéologie, comme dans de nombreux autres domaines, c'est pourquoi nous nous concentrons sur celles-ci ici.

Ce livre se veut utile pour les archéologues travaillant avec des données de petite taille (c'est-à-dire des tableaux de moins de 1 million de lignes, et de moins de 2 Go par fichier) qui peuvent être stockées sur votre ordinateur (plutôt que sur un serveur distant). De notre expérience, la majorité des archéologues travaillent avec des données à cette échelle, les méthodes présentées ici devraient donc être utiles à la majorité des applications archéologiques. Si vos données sont plus grandes que cela, vous faites probablement quelque chose de très spécialisé et vous aurez des défis particuliers à relever pour rendre votre recherche reproductible. Cependant, vous pourrez toujours utiliser R et les méthodes décrites ici pour travailler sur des sous-ensembles de votre grand jeu de données.

## Licence {-}

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Licence Creative Commons" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a>

Ce livre est mis à disposition selon les termes de la <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">licence Creative Commons Attribution - Pas d'Utilisation Commerciale - Partage dans les Mêmes Conditions 4.0 International</a>^[Cela signifie que vous êtes libre de copier, distribuer et communiquer ce livre par tous moyens et sous tous formats, de modifier, transformer et créer à partir du matériel de ce livre. En contrepartie, vous devez créditer la source d'origine en précisant si vous l'avez modifiée, vous devez partager sous la même licence et vous ne pouvez pas en faire un usage commercial.].

Le code contenu dans ce livre est simultanément disponible sous la [licence MIT](https://opensource.org/licenses/MIT)^[Cela signifie que vous êtes libre de l'utiliser dans vos propres projets, à condition de citer la source.].

Une entrée BibTeX pour citer ce document :


```
@Book{rarcheo,
  title = {R pour l'archéologue: Exploration, visualisation et analyse de données},
  author = {Nicolas Frerebeau and Ben Marwick},
  year = {2021},
  publisher = {Université Bordeaux Montaigne},
  address = {Pessac, France},
  url = {https://rstats.archaeo.science},
}
```

## Contributions {-}

Le [code source](https://github.com/nfrerebeau/rarcheo) de ce livre est disponible sur [GitHub](https://github.com/). N'hésitez pas à y [ouvrir un ticket](https://github.com/nfrerebeau/rarcheo/issues) pour signaler toutes les erreurs que vous pourrez constater ou proposer des modifications.

## Conventions d'écriture {-}

Par la suite, on écrira `foo()` pour désigner une fonction, `bar` pour désigner les variables et les paramètres des fonctions et `baz/` pour désigner les chemins. Les noms de *packages* sont indiqués en italique.

Les commentaires dans le code sont précédés par le signe `#`. Les blocs de code alternent l'entrée et la sortie. La sortie est commentée (précédée par `#>` pour la distinguer des commentaires standards) de sorte que vous pouvez facilement copier et coller les exemples dans R.

## Reproductibilité {-}

Ce livre a été écrit dans [RStudio](http://www.rstudio.com/ide/) avec le package [*bookdown*](http://bookdown.org/) [@bookdown2016]. Le site web est hébergé par [GitHub Pages](https://pages.github.com/) et automatiquement mis à jour après chaque commit par [GitHub Actions](https://github.com/nfrerebeau/rarcheo/actions) (cette version a été compilée le 13 Jun 2022).

Les données utilisées dans les exemples sont issues des packages *datasets* [@R-base] et [*folio*](https://packages.tesselle.org/folio/) [@R-folio]. Les exemples reposant sur la génération de nombre aléatoires sont reproductibles en utilisant `set.seed(12345)`.

Cette version du livre a été réalisée avec R version 4.2.0 (2022-04-22) et [pandoc](https://pandoc.org/) version 2.14.2. Les packages R utilisés sont résumés dans le tableau \@ref(tab:packages).


Table: (\#tab:packages)Liste des packages utilisés.

|Package       |Version |Source         |Référence        |
|:-------------|:-------|:--------------|:----------------|
|bookdown      |0.26    |CRAN (R 4.2.0) |@R-bookdown      |
|bslib         |0.3.1   |CRAN (R 4.2.0) |@R-bslib         |
|car           |3.0-13  |CRAN (R 4.2.0) |@R-car           |
|desc          |1.4.1   |CRAN (R 4.2.0) |@R-desc          |
|DiagrammeR    |1.0.9   |CRAN (R 4.2.0) |@R-DiagrammeR    |
|downlit       |0.4.0   |CRAN (R 4.2.0) |@R-downlit       |
|folio         |1.1.0   |CRAN (R 4.2.0) |@R-folio         |
|ggplot2       |3.3.6   |CRAN (R 4.2.0) |@R-ggplot2       |
|ggraph        |2.0.5   |CRAN (R 4.2.0) |@R-ggraph        |
|kableExtra    |1.3.4   |CRAN (R 4.2.0) |@R-kableExtra    |
|knitr         |1.39    |CRAN (R 4.2.0) |@R-knitr         |
|markdown      |1.1     |CRAN (R 4.2.0) |@R-markdown      |
|MASS          |7.3-57  |CRAN (R 4.2.0) |@R-MASS          |
|mime          |0.12    |CRAN (R 4.2.0) |@R-mime          |
|miniCRAN      |0.2.16  |CRAN (R 4.2.0) |@R-miniCRAN      |
|rcarbon       |1.4.3   |CRAN (R 4.2.0) |@R-rcarbon       |
|rmarkdown     |2.14    |CRAN (R 4.2.0) |@R-rmarkdown     |
|scatterplot3d |0.3-41  |CRAN (R 4.2.0) |@R-scatterplot3d |
|sessioninfo   |1.2.2   |CRAN (R 4.2.0) |@R-sessioninfo   |
|shape         |1.4.6   |CRAN (R 4.2.0) |@R-shape         |
|tidygraph     |1.2.1   |CRAN (R 4.2.0) |@R-tidygraph     |
|webshot       |0.5.3   |CRAN (R 4.2.0) |@R-webshot       |
|xml2          |1.3.3   |CRAN (R 4.2.0) |@R-xml2          |
