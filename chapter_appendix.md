\appendix

# (PART) Annexes {-}

# Bonnes pratiques {#bonnes-pratiques}

## Travailler par projets {#projets}

Une bonne pratique liée à l'utilisation de R consiste à [organiser l'ensemble de son analyse en un projet](https://rstats.wtf/project-oriented-workflow.html), c'est à dire un dossier autonome contenant l'ensemble des fichiers nécessaires à l'analyse (dont les données brutes et le fichiers générés). Une telle organisation doit permettre de déplacer le dossier sur son ordinateur ou sur un autre ordinateur, tout en maintenant le bon fonctionnement du code (absence de liens brisés, de dépendances manquantes...).

Ce dossier, ou répertoire de travail (*working directory*), peut être défini ou retrouvé à l'aide des fonctions `setwd()` et `getwd()`, respectivement :


```r
# Définition du répertoire de travail
setwd("/chemin/vers/mon/dossier")
```

Une fois le répertoire de travail défini, toute référence à un fichier en utilisant un simple nom de fichier ou un chemin relatif sera interprétée relativement au répertoire de travail.

Cependant, le risque est de se retrouver dans la situation suivante :


```r
# Définition du répertoire de travail
setwd("/chemin/uniquement/valide/sur/mon/ordinateur")
```

Pour pallier ce problème qui rend difficilement déplaçable un dossier de projet, il existe différentes solutions parmi lesquelles :

* L'utilisation du package [*here*](https://here.r-lib.org/),
* L'utilisation de la gestion de projet dans RStudio.

RStudio dispose d'un mécanisme permettant de [créer facilement de tels projets](https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects). Un projet est reconnaissable par la présence d'un fichier `.Rproj`. Ce fichier marque le dossier de plus haut niveau au sein d'un projet (répertoire de travail), à partir duquel des chemins d'accès relatifs peuvent être utilisés pour lire ou écrire des fichiers.

Il est possible de créer un projet dans RStudio à partir du menu déroulant situé en haut à droite de l'interface ou en cliquant sur *New Project...* depuis le menu *File*. Le projet peut alors être créé soit dans un nouveau dossier, soit en transformant un dossier existant (fig. \@ref(fig:rstudio-project)).

\begin{figure}

{\centering \includegraphics[width=0.7\linewidth]{images/rstudio-project} 

}

\caption{Création d'un projet avec RStudio.}(\#fig:rstudio-project)
\end{figure}

L'organisation des fichiers et des sous-dossiers au sein d'un projet relève des habitudes de travail de chacun. S'il n'existe pas de consensus sur la manière d'organiser un projet, il peut être avantageux de suivre certaines conventions, comme celles utilisées par le package [*rrtools*](https://github.com/benmarwick/rrtools).

## Structurer ses données {#tidy-data}

Lors de l'acquisition puis lors de la préparation de vos données en vue d'une étude, toutes vos actions doivent être guidées par un impératif : structurer au mieux vos jeux de données pour en faciliter l'analyse [@wickham2014]. Les principes régissant cette étape de structuration (*data tidying*) ont été exposés par @wickham2014, qui propose ainsi une approche pour lier "la structure d'un jeu de données (sa mise en forme) avec sa dimension sémantique (sa signification)."

Des jeux de données bien structurés se présentent sous la forme de tableaux à deux dimensions (lignes et colonnes) contenant des valeurs. Chaque valeur correspond à une observation d'une variable particulière, en conséquence :

* Chaque variable doit correspondre à une colonne du tableau.
* Chaque observation doit correspondre à une ligne du tableau.
* Un tableau doit correspondre à une unique unité d'observation^[On reconnait ici la troisième forme normale, dans le cas des bases de données relationnelles.].

::: {.rmdtip}
Une fois vos données correctement structurées, choisissez un format de fichier adapté pour les archiver, les diffuser ou les réutiliser. Dans le cas de données tabulaires, conservez vos données dans un [fichier texte](https://fr.wikipedia.org/wiki/Fichier_texte), idéalement au format <abbr title="comma-separated values">CSV</abbr>.
:::

## Limiter les dépendances {#dependances}

Si les packages de base de R offrent de nombreuses possibilités, il est courant d'avoir besoin de fonctionnalités supplémentaires au cours d'une étude. Pour une analyse spécifique, il est très probable qu'il existe déjà un ou plusieurs packages offrant les fonctionnalités recherchées et installable depuis le CRAN. Cette offre pléthorique a cependant un revers : à chaque package supplémentaire utilisé dans votre projet, vous augmentez le risque de voir apparaître des problèmes liés à ces dépendances^[Sur le sujet, voir les billets regroupés sur le site du [tinyverse](https://www.tinyverse.org/).].

Par exemple, [*FactoMineR*](http://factominer.free.fr/) est sans doute le package le plus utilisé pour l'analyse de données multivariées. *FactoMineR* possède 15 dépendances directes : d'autres packages dont il utilise les fonctionnalités. Cependant, chacune de ces dépendances est susceptible d'avoir elle même des dépendances, et ainsi de suite, si bien que *FactoMineR* a en réalité une longue chaîne de 103 (!) dépendances (fig. \@ref(fig:factominer-dependency)).

(ref:factominer-dependency) Réseau des dépendances du package *FactoMineR* (hors packages de base). Les noms des packages ont été omis pour faciliter la lecture (*FactoMineR* est représenté par un triangle noir, les autres packages sont représentés par des points gris).

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{chapter_appendix_files/figure-latex/factominer-dependency-1} 

}

\caption{(ref:factominer-dependency)}(\#fig:factominer-dependency)
\end{figure}

Qu'arrivera-t-il alors si une seule des ces dépendances change drastiquement, arrête de fonctionner ou disparaît tout simplement (fig. \@ref(fig:xkcd-dependency)) ? Pour réduire ce risque et sortir de cet enfer des dépendances :

* Évitez d'utiliser un package particulier quand la même tâche peut être réalisée en R basique (écrivez vos propres fonctions !).
* Quand cela est possible, préférez les packages qui n'ont pas (ou peu) de dépendances.
* N'utilisez pas la version de développement d'un package, mais installez toujours la version stable depuis le CRAN.

(ref:xkcd-dependency) Dependency. "Someday ImageMagick will finally break for good and we'll have a long period of scrambling as we try to reassemble civilization from the rubble." [CC BY-NC 2.0 @munroe2020].

\begin{figure}

{\centering \includegraphics[width=0.7\linewidth]{images/xkcd_dependency} 

}

\caption{(ref:xkcd-dependency)}(\#fig:xkcd-dependency)
\end{figure}

## Écrire des exemples reproductibles {#reprex}

https://stackoverflow.com/questions/5963269/how-to-make-a-great-r-reproducible-example

https://reprex.tidyverse.org/

# Style de programmation {#style}

Cette section propose un style de programmation destiné à accompagner les utilisatrices et utilisateurs débutants. Ce style regroupe des recommandations pour l'écriture du code et permet d'en faciliter la lecture et la compréhension. Ce style est dérivé du [*tidyverse style guide*](https://style.tidyverse.org) et du livre [*rOpenSci Packages*](https://devguide.ropensci.org).

## Dénominations {#style-naming}

En règle générale, les abréviations doivent être évitées lors de la dénomination de fichiers ou d'objets.

### Nommer les fichiers

Les noms de fichiers doivent utiliser l'extension `.R`.


```r
# GOOD
plot.R

# BAD
plot
```

Les noms de fichiers doivent être parlants.


```r
# GOOD
plot.R

# BAD
Untitled1.R
```

Les noms de fichiers ne doivent pas contenir de `/` et d'espaces. À la place, utilisez un tiret (`-`) ou un trait de soulignement (`_`).


```r
# GOOD
read_csv.R
plot-methods.R

# BAD
read csv.R
```

Les noms de fichiers doivent utiliser des lettres du latin de base, et non du supplément latin-1, et doivent être en minuscules.


```r
# GOOD
plot.R

# BAD
Plot.R
données.R
```

Utilisez des verbes signifiants pour les noms de fichiers.


```r
# GOOD
fit_model.R

# BAD
addition.R
```

Si le fichier ne contient qu'une seule fonction, nommez-le par le nom de la fonction.

### Nommer les variables

Les noms des variables doivent être aussi courts que possible.

Les noms des variables doivent être des substantifs évocateurs.

Les noms de variables doivent être en minuscules.

Ne séparez jamais les mots à l'intérieur du nom par `.` (réservé pour les méthodes S3) et n'écrivez pas en PascalCase (réservé pour les définitions de classes S4). Utilisez plutôt un trait de soulignement (`_`).


```r
# GOOD
std_dev <- 3

# BAD
std.dev <- 3
StdDev <- 3
```

N'utilisez pas les noms de fonctions et de variables existantes (en particulier celles qui sont propres à R).


```r
# GOOD
std_dev <- 3

# BAD
T <- 1
c <- 2 * 2
mean <- 10
```

### Nommer les fonctions

Les noms de fonction doivent contenir un verbe qui fait référence à l'action principale de la fonction.

Les noms de fonction doivent être en snake_case. N'utilisez `.` que pour le dispatching des méthodes S3.

Le schéma de nommage `object_verb()` doit être préféré aussi souvent que possible. Ce schéma est facile à lire et à compléter automatiquement.


```r
# GOOD
peak_detect()

# BAD
addition()
readFile()
```

Évitez de réemployer des noms de fonctions déjà utilisés par les packages de base ou d'autres packages populaires.

### Nommer les classes S4

Les noms des classes doivent être des substantifs en PascalCase avec une majuscule initiale et la première lettre de chaque mot concaténé en majuscule.

## Syntaxe {#style-syntax}

### Longueur de ligne

La longueur maximale des lignes est limitée à 80 caractères.

Ne mettez pas plus d'une déclaration par ligne. N'utilisez pas de point-virgule pour terminer la commande.


```r
# GOOD
x <- 1
x <- x + 1

# BAD 
x <- 1; x <- x + 1
```

### Appel de fonction {#style-fonction}

Dans un appel de fonction, spécifiez les arguments par leur nom. Ne spécifiez jamais les arguments par un nom partiel et ne mélangez jamais la position et le nom complet.


```r
# GOOD
mean(x, na.rm = TRUE)

# BAD
mean(x, na = TRUE)
```

Les arguments obligatoires doivent être placés en premier, suivis des arguments facultatifs.


```r
# GOOD
raise_to_power(x, power = 2.7)

# BAD
raise_to_power(power = 2.7, x)
```

L'argument `...` doit se trouver soit au début, soit à la fin.


```r
# GOOD
standardize(..., scale = TRUE, center = TRUE)

# BAD
standardize(scale = TRUE, ..., center = TRUE)
```

Définissez les arguments par défaut à l'intérieur de la fonction en utilisant l'idiome `NULL`, et évitez la dépendance entre les arguments.

Validez toujours les arguments dans une fonction.

### Affectation

Utilisez `<-` au lieu de `=` pour l'affectation.


```r
# GOOD
x <- 1

# BAD
x = 1
1 -> x
```

### Espaces

Mettez des espaces autour de tous les opérateurs binaires infixes (`=`, `+`, `*`, `==`, `&&`, `<-`, `%*%`, etc.).


```r
# GOOD 
x == y
z <- 2 + 1

# BAD
x==y
z<-2+1
```

Mettez des espaces autour de `=` dans les appels de fonction.


```r
# GOOD 
mean(x = c(1, 2, 3), na.rm = TRUE)

# BAD
mean(x=c(1, 2, NA), na.rm=TRUE)
```

Ne placez pas d'espace pour obtenir des sous-ensembles (`$` et `@`), pour la manipulation des espaces de noms (`::` et `:::`) et pour la génération de séquences (`:`).


```r
# GOOD
car$cyl
dplyr::select()
1:10

# BAD
car $cyl
dplyr:: select()
1: 10
```

Mettez un espace après une virgule.


```r
# GOOD 
mtcars[1, ]
mean(x = c(1, NA, 2), na.rm = TRUE)

# BAD
mtcars[1 ,]
mean(x = c(1,NA,2),na.rm = TRUE)
```

Utilisez un espace avant les parenthèses ouvrantes, sauf dans un appel de fonction.


```r
# GOOD 
for (element in element_list)
if (total == 5)
sum(1:10)

# BAD
for(element in element_list)
if(total == 5)
sum (1:10)
```

Ne mettez pas d'espaces autour du code entre parenthèses ou entre crochets.


```r
# GOOD 
if (is_true) message("Hello!")
species["tiger", ]

# BAD
if ( is_true ) message("Hello!")
species[ "tiger" ,]
```

### Accolade

Une accolade ouvrante ne doit jamais être placée sur sa propre ligne et doit toujours être suivie d'une nouvelle ligne.


```r
# GOOD 
if (is_true) {
  # do something
}

if (is_true) {
  # do something
} else {
  # do something else
}
    
# BAD
if (is_true)
{
  # do something
}
    
if (is_true) { # do something }
else { # do something else }
```

Une accolade fermante doit toujours être placée sur sa propre ligne, sauf si elle est suivie de `else`.


```r
# GOOD 
if (is_true) {
  # do something
} else {
  # do something else
}

# BAD
if (is_true) {
  # do something
}
else {
  # do something else 
}
```

Indentez toujours le code à l'intérieur des accolades.


```r
# GOOD 
if (is_true) {
  # do something
  # and then something else
}

# BAD
if (is_true) {
  # do something
  # and then something else
}
```

Les accolades et les nouvelles lignes peuvent être évitées, si une déclaration après `if` est très courte.


```r
# OK 
if (is_true) return(value)
```

### Indentation

N'utilisez pas de tabulations ou de mélanges de tabulations et d'espaces pour l'indentation.

Utilisez deux espaces pour l'indentation.

### Nouvelle ligne

Dans une définition ou un appel de fonction, les arguments excessifs doivent être indentés sur la ligne de la parenthèse fermante, si deux lignes suffisent.


```r
# GOOD
long_function_name <- function(arg1, arg2, arg3, arg4, 
                               long_argument_name1 = TRUE)
  
plot(table(rpois(100, 5)), type = "h", col = "red", lwd = 10, 
     main = "rpois(100, lambda = 5)")
```

Sinon, chaque argument peut aller sur une ligne séparée, en commençant par une nouvelle ligne après la parenthèse ouvrante.


```r
# GOOD
long_function_name <- function(long_argument_name1 = c("value1", "value2"),
                               long_argument_name2 = TRUE,
                               long_argument_name3 = NULL,
                               long_argument_name4 = FALSE)
  
list(
  mean = mean(x),
  sd = sd(x),
  var = var(x),
  min = min(x),
  max = max(x),
  median = median(x)
)
```

Si la condition dans l'instruction `if` s'étend sur plusieurs lignes, alors chaque condition doit se terminer par un opérateur logique, et non commencer par lui.


```r
# GOOD
if (some_very_long_name_1 == 1 &&
    some_very_long_name_2 == 1 ||
    some_very_long_name_3 %in% some_very_long_name_4)
  
# BAD
if (some_very_long_name_1 == 1
    && some_very_long_name_2 == 1
    || some_very_long_name_3 %in% some_very_long_name_4)
```

Si l'instruction qui contient des opérateurs s'étend sur plusieurs lignes, chaque ligne doit se terminer par un opérateur et non commencer par lui.


```r
# GOOD 
normal_pdf <- 1 / sqrt(2 * pi * d_sigma ^ 2) *
  exp(-(x - d_mean) ^ 2 / 2 / s ^ 2)

# BAD
normal_pdf <- 1 / sqrt(2 * pi * d_sigma ^ 2)
* exp(-(x - d_mean) ^ 2 / 2 / d_sigma ^ 2)
```

Chaque appel de `dplyr` (après `%>%` ou `|>`) ou de `ggplot2` (après `+`) doit commencer sur une nouvelle ligne.

## Commentaires

Il est recommandé d'écrire les commentaires en anglais.

Les commentaires commencent par `#` suivi d'un espace et du texte du commentaire.


```r
# This is a comment.
```

Les commentaires doivent expliquer le pourquoi, et non le comment. Les commentaires doivent expliquer l'intention générale de la commande.


```r
# GOOD
# define iterator
i <- 1

# BAD
# set i to 1
i <- 1
```

De courts commentaires peuvent être placés sur la même ligne que le code code.


```r
plot(price, weight) # Plot a scatter chart of price and weight
```

Il peut être utile de diviser le code source en morceaux logiques par un commentaire suivi de `-` ou `=`.


```r
# Read data -------------------------------------------------------------

# Clean data ------------------------------------------------------------
```

Les descriptions des fonctions et des objets doivent respecter les directives de [*roxygen2*] (https://roxygen2.r-lib.org/).


```r
#' Add Together Two Numbers
#' 
#' @param x A number.
#' @param y A number.
#' @return The sum of x and y.
#' @examples
#' add(1, 1)
#' add(10, 1)
add <- function(x, y) {
  # general comment
  x + y # inline comment
}
```
