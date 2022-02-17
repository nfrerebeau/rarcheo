# (PART) Premiers pas avec R {-}

# Prise en main
## Invite de commande

R se présente sous la forme d'une [interface en ligne de commande](https://fr.wikipedia.org/wiki/Interface_en_ligne_de_commande), permettant de donner des instructions à l'ordinateur. Dans RStudio, cette interface est accessible dans l'onglet *Console*.

Lorsque R est en cours d'exécution, l'interface signifie qu'elle est prête à recevoir des instructions par une invite de commande (*prompt*) indiquée par un chevron `>`.

Il est alors possible d'entrer une **expression**, qui va être **évaluée** par R avant d'en retourner le résultat :


```r
1 + 1
#> [1] 2
```

Sans surprise, le résultat de l'addition est 2. R donne une information supplémentaire, le `[1]` devant `2` précise qu'il s'agit du premier (dans le cas présent, du seul) élément retourné. Certaines commandes peuvent retourner plusieurs valeurs. Par exemple, l'[opérateur](#operateurs) `:` (deux-points) permet de construire des [séquences](#sequences) de nombres entiers :


```r
0:100
#>   [1]   0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15
#>  [17]  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31
#>  [33]  32  33  34  35  36  37  38  39  40  41  42  43  44  45  46  47
#>  [49]  48  49  50  51  52  53  54  55  56  57  58  59  60  61  62  63
#>  [65]  64  65  66  67  68  69  70  71  72  73  74  75  76  77  78  79
#>  [81]  80  81  82  83  84  85  86  87  88  89  90  91  92  93  94  95
#>  [97]  96  97  98  99 100
```

La commande `0:100` retourne 101 valeurs qui sont affichées sur plusieurs lignes : le nombre entre crochet indique l'**indice** de la valeur par laquelle débute chacune des lignes (la deuxième ligne commence à la 17^e^ valeur, etc.).

::: {.rmdimportant}
Contrairement à [Python](https://www.python.org/), dans R les [indices commencent à 1](#extraction) et non à 0.
:::

Si une commande incomplète est transmise, l'invite de commande signale par un `+` que la suite des instructions peut être saisie : 


```r
1 -
1
#> [1] 0
```

::: {.rmdtip}
Il est possible d'interrompre la saisie ou d'annuler une commande avec `ctrl/cmd + c`.
:::

Si une commande erronée est transmise, R s'interrompt et retourne un message d'erreur (plus ou moins explicite) :


```r
x
#> Error in eval(expr, envir, enclos): object 'x' not found
```

::: {.rmdtip}
Il est possible de naviguer dans l'historique des commandes précédemment exécutées à l'aide des flèches `haut` et `bas` du clavier.
:::

## Objets {#objets}

Il est possible d'associer un nom à une valeur et ainsi de créer des **variables** (au sens informatique) qui peuvent ensuite être appelées dans l'invite de commande. Une variables n'est rien d'autre qu'un emplacement de la mémoire de l'ordinateur, réservé pour stocker une valeur. 

Cette **affectation** (ou assignation, par anglicisme) est réalisée à l'aide de l'opérateur `<-` :


```r
x <- 1
x
#> [1] 1
```

Il est possible d'affecter plusieurs variables en même temps :


```r
y <- z <- 1
```

Les variables ainsi crées peuvent être réutilisées :


```r
x + 1
#> [1] 2
y + z
#> [1] 2
```

La réutilisation d'un nom de variable existant entraîne le remplacement de la valeur précédente (sans avertissement) :


```r
i <- 1
i
#> [1] 1

i <- 2
i
#> [1] 2
```

::: {.rmdimportant}
* Un nom de variable peut uniquement être composé de lettres, de chiffres et des caractères `.` ou `_`.
* Un nom de variable doit toujours commencer par une lettre (ou par un point suivi d'une lettre).
* Les noms de variables sont sensibles à la casse (`x` et `X` sont deux variables différentes).
* Il existe des mots réservés qui ne peuvent être utilisés comme nom de variable.
:::

Dans R les variables stockent des **objets**^[En informatique, un objet est une représentation d'une entité du monde réel et de ses attributs, auxquels sont associés des traitements particuliers.]. Ainsi, le code `x <- 1` peut se lire "créer un objet nommé *x* dont la valeur est 1"^[Il s'agit cependant d'une simplification, voir la section "[Binding basics](https://adv-r.hadley.nz/names-values.html#binding-basics)" dans @wickham2019 pour plus de détails.].

Un objet possède un type et une structure de données particulière. Le type d'un objet est lié au type d'information qu'il contient et à la façon dont il est stocké dans la mémoire^[Votre système d'exploitation alloue la mémoire en fonction du type de donnée et décide de ce qui peut être stocké dans la mémoire réservée lors de la création d'une variable.]. La structure de données d'un objet correspond à la manière dont sont organisées les données.

## Fonctions {#fonctions}

Il existe des objets particuliers, qui permettent d'agir sur d'autres objets : les **fonctions**. Ces fonctions peuvent accepter une ou plusieurs valeurs (ou objets) en entrée, appelés **arguments**, et retournent un objet au terme de leur exécution. Les arguments permettent de modifier le comportement d'une fonction. R fournit de très nombreuses fonctions, pour réaliser des taches très spécifiques il est possible d'[écrire ses propres fonctions](#) ou d'[installer des packages](#packages) supplémentaires.

Par exemple, la fonction `round()` permet d'arrondir une valeur numérique au nombre de décimales spécifié. Par défaut, la fonction `round()` réalise un arrondi à zéro chiffre après la virgule :


```r
round(3.141593)
#> [1] 3
```

La fonction `args()` permet de connaitre les différents arguments d'une fonction et les valeurs par défaut qui peuvent leur être associées :


```r
args(round)
#> function (x, digits = 0) 
#> NULL
```

La fonction `round()` accepte ainsi deux arguments, la valeur à arrondir et le nombre de décimales à conserver (0 par défaut).

::: {.rmdnote}
Les arguments qui possèdent une valeur par défaut sont des **arguments facultatifs** : ils peuvent être omis lorsque la fonction est appelée (la valeur par défaut sera utilisée). À l'inverse, les arguments sans valeurs par défaut doivent être spécifiés : ce sont des **arguments obligatoires**.
:::

Les différents arguments d'une fonction sont séparés par une virgule et sont nommés. Lors de l'appel d'une fonction, si les arguments ne sont pas spécifiés par leur nom, R va associer les valeurs correspondantes dans l'ordre. Dans l'exemple suivant, la valeur `2` est associée au second argument (`digits`) :


```r
round(3.141593, 2)
#> [1] 3.14
```

Pour éviter les erreurs et pour [faciliter la lecture du code](#style-fonction), dans un appel de fonction, spécifiez toujours les arguments par leur nom (à l'exception du premier argument). Les arguments obligatoires doivent être placés en premier, suivis des arguments facultatifs :


```r
round(3.141593, digits = 2)
#> [1] 3.14
```

::: {.rmdtip}
Le nom des arguments d'une fonction, leurs rôles et leurs éventuelles valeurs par défaut sont détaillés dans l'[aide](#aide).
:::

## Packages {#packages}

Lors d'une première installation de R, un premier ensemble de packages contenant les [fonctions](#fonctions) fondamentales est installé :

* Les packages essentiels : `base`, `compiler`, `datasets`, `graphics`, `grDevices`, `grid`, `methods`, `parallel`, `splines`, `stats`, `stats4`, `tcltk`, `tools`, `translations`, `utils`.
* Les packages recommandés : `boot`, `class`, `cluster`, `codetools`, `foreign`, `KernSmooth`, `lattice`, `MASS`, `Matrix`, `mgcv`, `nlme`, `nnet`, `rpart`, `spatial`, `survival`.

L'installation d'un package permet de bénéficier de fonctionnalités supplémentaires, généralement dédiées à une tâche bien spécifique. Pour ne pas se perdre dans la multitude de ressources disponibles, le CRAN propose des [répertoires de packages](https://cran.r-project.org/web/views/) par domaine (*Task Views*) pour faciliter le choix des packages pour une analyse spécifique. Il existe ainsi des répertoires pour les [sciences sociales](https://cran.r-project.org/web/views/SocialSciences.html), l'analyse de [données environnementales](https://cran.r-project.org/web/views/Environmetrics.html) ou encore l'analyse de [données spatiales](https://cran.r-project.org/web/views/Spatial.html). Pour l'archéologie, il existe une [*Task View* non officielle](https://github.com/benmarwick/ctv-archaeology), maintenue par Ben Marwick.

::: {.rmdtip}
Une bonne pratique consiste à toujours chercher à [limiter les dépendances](#dependances).
:::

Lorsqu'un package est disponible sur le CRAN, il peut aisément être installé à l'aide de la fonction `install.packages()`^[`install.packages()` permet également d'installer des packages publiés sur d'[autres dépôts](#packages-depots) que le CRAN.].

La commande suivante permet d'installer le package [*folio*](https://packages.tesselle.org/folio/) qui contient les jeux de données utilisés par la suite :


```r
install.packages("folio")
```

::: {.rmdtip}
La plupart des packages publiés sur le CRAN font l'objet de mises à jour régulières. Pour maintenir à jour les packages installés sur votre ordinateur, la fonction `old.packages()` permet de lister les packages pour lesquels il existe une nouvelle version et `update.packages()` permet de télécharger et d'installer les nouvelles versions.
:::

Installer un nouveau package est une condition nécessaire, mais pas suffisante, pour pouvoir l'utiliser. Au lancement, R ne charge pas tous les packages installés, mais uniquement les packages de base^[La liste des packages chargés par défaut au lancement de R peut être obtenue avec `getOption('defaultPackages')`.]. Si on utilise la fonction `data()` pour charger le jeux de données `intcal20` du package *folio* sans que ce dernier soit chargé, R ne sait pas où chercher l'objet et retourne un avertissement :


```r
data(intcal20)
```

Il est donc nécessaire de charger un package à l'aide de la fonction `library()` avant de pouvoir l'utiliser^[Dans le cas présent, une alternative serait de spécifier l'argument `package` de la fonction `data()`.] :


```r
library("folio")
data(intcal20)
```

## Obtenir de l'aide {#aide}



Lorsque vous ne savez pas comment utiliser une fonction particulière (difficile de mémoriser les 1172 fonctions des packages de base), votre premier réflexe doit être de [consulter la documentation](https://fr.wikipedia.org/wiki/RTFM_(expression)). La documentation couvre l'ensemble des fonctions, jeux de données et autres objets présents dans les différents packages. 

Pour un objet donné, on peut consulter la documentation associée en utilisant soit la fonction `help()`, soit l'opérateur `?`. Par exemple, pour accéder à l'aide de la fonction `round()` :


```r
help(round)

?round
```

Si l'objet recherché appartient à un package qui n'est pas chargé, R ne saura pas où chercher la documentation. Dans l'exemple suivant, la fonction `lda()` appartient au package *MASS* qui n'est pas chargé :


```r
help(lda)
#> No documentation for 'lda' in specified packages and libraries:
#> you could try '??lda'
```

Pour accéder à la documentation, il faudra alors charger le package au préalable ou le spécifier dans la fonction `help()` :


```r
help(lda, package = "MASS")
```

Si on ignore le nom de la fonction à utiliser, deux approches permettent d'explorer la documentation :

* On peut parcourir la documentation d'un package particulier, dont on sait qu'il doit contenir la fonction recherchée (par exemple, `help(package = "MASS")` permet d'afficher le sommaire de la documentation du package *MASS*).
* On peut rechercher dans l'aide par mot-clé à l'aide de l'opérateur `??` ou de la fonction `help.search()`.

Par exemple, pour chercher toutes les pages de la documentation contenant le terme "correlation" :


```r
help.search("correlation")

??correlation
```

Toutes les pages d'aide sont structurées de la même façon. Généralement, on y trouve au moins les sections suivantes :

*Description*
: Une courte description de ce que fait la fonction.

*Usage*
: Un exemple d'utilisation de la fonction présentant l'ensemble des arguments et leurs éventuelles valeurs par défaut.

*Arguments*
: La liste des arguments de la fonction précisant leur nom, leur rôle et la valeur ou le type d'objet qui est attendu.

*Details*
: Une explication détaillée du comportement de la fonction.

*Value*
: Une description de ce qui est retourné lorsque la fonction est exécutée.

*References*
: Les références bibliographiques associées à la fonction.

*See Also*
: Une suggestion de fonctions similaires.

*Examples*
: Quelques exemples illustrant différents cas d'utilisation de la fonction. Ces exemples peuvent être exécutés directement avec la fonction `example()`.

Pour exécuter les exemples illustrant la documentation de la fonction `mean()` : 


```r
example(mean)
```

::: {.rmdtip}
Si vous faites face à une difficulté, il fort probable quelqu'un se soit déjà posé la même question que vous et que la réponse se trouve sur [Stack Overflow](https://stackoverflow.com/questions/tagged/r) ou sur les listes de diffusions [R-help](https://stat.ethz.ch/mailman/listinfo/r-help) et [R-devel](https://stat.ethz.ch/mailman/listinfo/r-devel) (actives depuis 1996). Dans le cas contraire, vous pourrez y exposer votre problème, mais il vous faudra apprendre à [écrire des exemples reproductibles](#reprex) ([*reprex*](https://twitter.com/romain_francois/status/530011023743655936)).
:::

# Vecteurs {#r-vector}

Le vecteur (`vector`) est la structure de base de R, à partir de laquelle toutes les autres sont construites (fig. \@ref(fig:r-vector-types)). Un vecteur est simplement un ensemble d'**éléments**.

Un vecteur peut être un [vecteur atomique](#r-atomic) (`atomic`), si tous ses éléments sont de même **type**, ou de une [liste](#r-list) (`list`), si ses éléments sont de types différents. Un vecteur peut également avoir des [**attributs**](#attributs) (sorte de métadonnées).

(ref:r-vector-types) Les types d'objets de R. D'après @wickham2019.

\begin{figure}

{\centering \includegraphics[width=0.7\linewidth]{chapter_rstats_files/figure-latex/r-vector-types-1} 

}

\caption{(ref:r-vector-types)}(\#fig:r-vector-types)
\end{figure}

## Vecteurs atomiques (`atomic`) {#r-atomic}

Un vecteur atomique possède deux propriétés : son type et sa longueur (le nombre d'éléments qu'il contient). Les quatre principaux types de R sont les suivants :

* `logical` : booléen.
* `integer` : nombre entier.
* `double` : nombre réel, avec ou sans partie décimale.
* `character` : chaîne de caractère.

### Création

Chacun de ces types possède une syntaxe particulière pour former des vecteur contenant un unique élément (scalaires) :


```r
x <- TRUE          # logical
x <- 1L            # integer
x <- 10.5          # double
x <- "archéologie" # character
```

::: {.rmdimportant}
* Un vecteur logique ne peut pendre que deux valeurs `TRUE` (vrai) ou `FALSE` (faux). `TRUE` et `FALSE` sont des mots réservés dans R : ils ne peuvent pas être utilisés comme identifiants pour nommer des variables ou des fonctions.
* Un nombre réel sans partie décimale sera toujours interprété comme étant de type `double` et non de type `integer`.
* Un vecteur de type `integer` s'écrit avec une syntaxe particulière : les nombres doivent être suivis d'un `L` pour les distinguer du type `double` et ne doivent pas avoir de partie décimale.
* Une chaîne de caractère doit toujours être encadrée par des guillemets simples (`'`) ou doubles (`"`). Si les guillemets sont manquantes, R l'interprétera comme un nom d'objet (et cherchera l'objet correspondant).
:::

La fonction `c()` (*combine*) permet de construire des vecteurs longs :


```r
vec_log <- c(TRUE, FALSE, TRUE) # logical
vec_int <- c(1L, 2L, 3L)        # integer
vec_num <- c(1.2, 2.1, 3.2)     # double
vec_cha <- c("A", "B", "C")     # character
```

La fonction `typeof()` permet de connaitre le type d'un vecteur et la fonction `length()` sa longueur :


```r
typeof(vec_cha)
#> [1] "character"

length(vec_cha)
#> [1] 3
```

### Test et conversion

La famille de fonctions `is.*()` permet de tester si un vecteur est d'un type particulier :


```r
is.logical(vec_log)
#> [1] TRUE

is.integer(vec_int)
#> [1] TRUE

is.double(vec_num)
#> [1] TRUE

is.character(vec_cha)
#> [1] TRUE
```

Tous les éléments d'un vecteur atomique sont du même type. Lors de la combinaison d'éléments de types différents, R va réaliser une conversion implicite pour tenter de représenter tous les éléments du vecteur de manière raisonnable. Le type du vecteur final est alors déterminé par la hiérarchie `logical` < `integer` < `double` < `character`.

Un vecteur contenant au moins une chaîne de caractères sera donc de type `character` :


```r
x <- c(1, "B", 3)
typeof(x)
#> [1] "character"

x <- c(TRUE, "B", TRUE)
typeof(x)
#> [1] "character"
```

Un vecteur contenant au moins un nombre réel sera de type `double` (même s'il ne possède pas de partie décimale) :


```r
x <- c(1L, 2.1, 3L)
typeof(x)
#> [1] "double"

x <- c(TRUE, 2.1, TRUE)
typeof(x)
#> [1] "double"
```

La création d'un `integer` avec une partie décimale sera automatiquement converti en type `double` avec un avertissement :


```r
x <- 10.5L
typeof(x)
#> [1] "double"
```

Il est possible de convertir explicitement un vecteur d'un type à l'autre à l'aide de la famille de fonctions `as.*()` :


```r
as.integer(c(1.2, 2.1, 3.2))
#> [1] 1 2 3

as.numeric(c(TRUE, FALSE, TRUE))
#> [1] 1 0 1

as.character(c(1.2, 2.1, 3.2))
#> [1] "1.2" "2.1" "3.2"
```

Les valeurs d'un vecteur numérique peuvent être converties en valeurs logiques : les valeurs égales à 0 deviennent `FALSE`, tout autre valeur non nulle devient `TRUE` :


```r
as.logical(c(1, 0, 3))
#> [1]  TRUE FALSE  TRUE
```

En cas de conversion impossible, des [valeurs manquantes](#valeurs-manquantes) sont générées et un avertissement est retourné :


```r
as.numeric(c("A", "B", "C"))
#> Warning: NAs introduced by coercion
#> [1] NA NA NA
```

### Attributs {#attributs}

Les attributs d'un vecteur peuvent être vus comme des métadonnées : des données qui fournissent des informations sur les données du vecteur. 

Les attributs peuvent être spécifiés individuellement à l'aide de la fonction `attr()`, sous la forme de paires associant un nom et une valeur. Dans l'exemple suivant, deux attributs nommés `a` et `b` sont associés au vecteur `x` avec pour valeurs `"xyz"` et `1 2 3`, respectivement : 


```r
x <- 1:5

attr(x, "a") <- "xyz"
attr(x, "a")
#> [1] "xyz"

attr(x, "b") <- 1:3
attr(x, "b")
#> [1] 1 2 3
```

::: {.rmdnote}
La syntaxe particulière `attr(x, "a") <- "xyz"` indique qu'il s'agit d'une fonction de remplacement. Ces fonctions modifient l'objet correspondant au premier argument.
:::

L'utilisation des attributs requiert un peu de prudence, car à quelques exceptions près les attributs ne sont pas conservés lors d'opérations sur les vecteurs (comme lors de l'[extraction de sous-ensembles](#subset)). Il existe cependant deux attributs particuliers qui sont généralement conservés : les noms (`names`) et la dimension (`dim`, qui transforme un vecteur en [matrice](#r-matrix)).

Il est possible d'associer des noms aux différents éléments d'un vecteur, soit au moment de sa création, soit *a posteriori* avec la fonction `names()` (qui permet également d'extraire les noms) :


```r
# Un nom est associé à chaque élément
x <- c(a = 1, b = 2, c = 3, d = 4, e = 5)
x
#> a b c d e 
#> 1 2 3 4 5

# Les noms sont spécifiés à l'aide d'un vecteur
names(x) <- c("f", "g", "h", "i", "j")
x
#> f g h i j 
#> 1 2 3 4 5

# Extraire les noms des différents éléments
names(x)
#> [1] "f" "g" "h" "i" "j"

# Supprimer les noms
names(x) <- NULL
names(x)
#> NULL

x
#> [1] 1 2 3 4 5
```

::: {.rmdnote}
L'utilisation des attributs permet de créer des vecteurs particuliers, appelés `factor`, qui représentent des [variables qualitatives](#variables-qualitatives) (nominales ou ordinales).
:::

## Listes (`list`) {#r-list}

Une liste est un vecteur particulier, dont les éléments peuvent être de n'importe quel type. Une liste peut être créée avec avec la fonction `list()` :


```r
# Création d'une liste contenant 4 éléments
x <- list(
  TRUE,
  1L,
  c(1.2, 2.1),
  c("X", "Y", "Z")
)
x
#> [[1]]
#> [1] TRUE
#> 
#> [[2]]
#> [1] 1
#> 
#> [[3]]
#> [1] 1.2 2.1
#> 
#> [[4]]
#> [1] "X" "Y" "Z"

# Une liste est un objet de type 'list'
typeof(x)
#> [1] "list"

# Longueur de la liste
length(x)
#> [1] 4

# Longueur des différents éléments de la liste
lengths(x)
#> [1] 1 1 2 3

# Les éléments de la liste peuvent être nommés
names(x) <- c("a", "b", "c", "d")
x
#> $a
#> [1] TRUE
#> 
#> $b
#> [1] 1
#> 
#> $c
#> [1] 1.2 2.1
#> 
#> $d
#> [1] "X" "Y" "Z"
```

Les listes permettent ainsi de créer et de manipuler des objets complexes, qui peuvent contenir d'autres listes (on parle alors de vecteurs récursifs) :


```r
x <- list(
  list(
    c(TRUE, FALSE),
    c("X", "Y", "Z")
  ), 
  c(1, 2)
)
x
#> [[1]]
#> [[1]][[1]]
#> [1]  TRUE FALSE
#> 
#> [[1]][[2]]
#> [1] "X" "Y" "Z"
#> 
#> 
#> [[2]]
#> [1] 1 2
```

La fonction `c()` permet de combiner plusieurs listes en une seule :


```r
# Deux listes sont combinées en une seule
x <- c(
  list(
    c(TRUE, FALSE),
    c("X", "Y", "Z")
  ), 
  list(1, 2)
)
x
#> [[1]]
#> [1]  TRUE FALSE
#> 
#> [[2]]
#> [1] "X" "Y" "Z"
#> 
#> [[3]]
#> [1] 1
#> 
#> [[4]]
#> [1] 2

# Un vecteur atomique est converti en liste avant d'être combiné
x <- c(
  list(
    c(TRUE, FALSE),
    c("X", "Y", "Z")
  ), 
  c(1, 2)
)
x
#> [[1]]
#> [1]  TRUE FALSE
#> 
#> [[2]]
#> [1] "X" "Y" "Z"
#> 
#> [[3]]
#> [1] 1
#> 
#> [[4]]
#> [1] 2
```

## Matrices (`matrix` et `array`) {#r-matrix}

Un vecteur peut être transformé en un tableau à deux (`matrix`) ou plusieurs (`array`) dimensions, en spécifiant l'attribut `dim`. Une matrice, au sens mathématique, est un tableau rectangulaire à deux dimensions : une matrice possède $m$ lignes et $n$ colonnes et contient $m \times n$ éléments du même type.


```r
# Soit un vecteur contenant 12 éléments
x <- 1:12
x
#>  [1]  1  2  3  4  5  6  7  8  9 10 11 12

typeof(x)
#> [1] "integer"

# Le vecteur est transformé en une matrice de 2 lignes et 6 colonnes
dim(x) <- c(2, 6)
x
#>      [,1] [,2] [,3] [,4] [,5] [,6]
#> [1,]    1    3    5    7    9   11
#> [2,]    2    4    6    8   10   12

dim(x)    # Dimensions de la matrice
#> [1] 2 6
nrow(x)   # Nombre de lignes
#> [1] 2
ncol(x)   # Nombre de colonnes
#> [1] 6
length(x) # Nombre d'éléments
#> [1] 12
typeof(x) # Type des éléments
#> [1] "integer"
```

La fonction `matrix()` permet de créer des matrices en spécifiant le nombre de lignes et de colonnes :


```r
# Par défaut, une matrice est remplie colonne par colonne
x <- matrix(1:12, nrow = 3, ncol = 4)
x
#>      [,1] [,2] [,3] [,4]
#> [1,]    1    4    7   10
#> [2,]    2    5    8   11
#> [3,]    3    6    9   12

# Ce comportement peut être modifié
y <- matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
y
#>      [,1] [,2] [,3] [,4]
#> [1,]    1    2    3    4
#> [2,]    5    6    7    8
#> [3,]    9   10   11   12
```

Plusieurs matrices peuvent être combinées en une seule, par lignes (`rbind()`) ou par colonnes (`cbind()`) :


```r
# Combine les lignes de deux matrices
rbind(x, y)
#>      [,1] [,2] [,3] [,4]
#> [1,]    1    4    7   10
#> [2,]    2    5    8   11
#> [3,]    3    6    9   12
#> [4,]    1    2    3    4
#> [5,]    5    6    7    8
#> [6,]    9   10   11   12

# Combine les colonnes de deux matrices
cbind(x, y)
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8]
#> [1,]    1    4    7   10    1    2    3    4
#> [2,]    2    5    8   11    5    6    7    8
#> [3,]    3    6    9   12    9   10   11   12
```

Enfin, il est possible de spécifier/extraire les noms de lignes et de colonnes avec les fonctions `rownames()` et `colnames()` ou avec la fonction `dimnames()` :


```r
rownames(x) <- c("X", "Y", "Z")
rownames(x)
#> [1] "X" "Y" "Z"

colnames(x) <- c("A", "B", "C", "D")
colnames(x)
#> [1] "A" "B" "C" "D"

x
#>   A B C  D
#> X 1 4 7 10
#> Y 2 5 8 11
#> Z 3 6 9 12

dimnames(y) <- list(c("X", "Y", "Z"), c("A", "B", "C", "D"))
dimnames(y)
#> [[1]]
#> [1] "X" "Y" "Z"
#> 
#> [[2]]
#> [1] "A" "B" "C" "D"

y
#>   A  B  C  D
#> X 1  2  3  4
#> Y 5  6  7  8
#> Z 9 10 11 12
```

::: {.rmdwarning}
Un vecteur sans attribut `dim` n'a pas de dimension et ne doit pas être confondu avec une matrice à une seule ligne ou une seule colonne !
:::

## Tableaux de données (`data.frame`) {#r-dataframe}

Le `data.frame` est probablement le concept le plus important de R : il permet de représenter un tableau de données rectangulaire dont les colonnes peuvent contenir des informations de différentes natures. Un `data.frame` est un cas particulier de `list` (fig. \@ref(fig:r-vector-types)) dont tous les éléments sont nommés et ont la même longueur : chaque élément correspond à une colonne du tableau^[Ainsi, la fonction `names()` est équivalente à `rownames()` et la fonction `length()` retourne le nombre de colonne du tableau (équivalent à `ncol()`).]. Chaque colonne d'un `data.frame` peut ainsi être d'un type différent (contrairement aux matrices dont tous les éléments sont d'un seul type) :


```r
x <- data.frame(
  a = 1:3,
  b = c("x", "y", "z")
)
x
#>   a b
#> 1 1 x
#> 2 2 y
#> 3 3 z

typeof(x)
#> [1] "list"
```

Un `data.frame` est un tableau à deux dimensions :


```r
nrow(x) # Nombre de lignes
#> [1] 3
ncol(x) # Nombre de colonnes
#> [1] 2
```

Lignes et colonnes d'un `data.frame` sont nommées :


```r
rownames(x) # Noms de lignes
#> [1] "1" "2" "3"
colnames(x) # Noms de colonnes
#> [1] "a" "b"
```

Sauf instruction spécifique lors de la création d'un `data.frame`, les noms de lignes sont générés automatiquement à partir d'une séquence de nombres entiers. Malgré les apparences, il s'agit bien de noms de lignes (de type `character`) et ils ne doivent pas être confondu avec les indices (numérotation) des lignes.


```r
x <- data.frame(
  greek = c(TRUE, FALSE, TRUE),
  home = c("Ithaca", "Troy", "Phthia"),
  row.names = c("Odysseus", "Hector", "Achilles")
)
x
#>          greek   home
#> Odysseus  TRUE Ithaca
#> Hector   FALSE   Troy
#> Achilles  TRUE Phthia
```

Comme pour les matrices, il est possible de combiner les lignes ou les colonnes de plusieurs `data.frame` en un seul tableau de données avec `rbind()` et `cbind()`. Dans le cas de la combinaison de colonnes, il pourra être préférable de réaliser des [jointures](#jointures).

# Extraction et remplacement {#subset}

## Vecteurs atomiques {#subset-atomic}

Il existe différentes façons d'extraire un sous-ensemble d'éléments au sein d'un vecteur à l'aide de l'opérateur `[` (crochet) :


```r
x <- c(1.3, 2.4, 3.5, 4.6, 5.7)
```

* Il est possible de spécifier les indices (positions) des éléments à conserver ou à enlever avec des nombres entiers :
  
  ```r
  # Sélection du premier, troisième et cinquième élément
  x[c(1, 3, 5)]
  #> [1] 1.3 3.5 5.7
  
  # Suppression du second et du quatrième élément
  x[-c(2, 4)]
  #> [1] 1.3 3.5 5.7
  
  # Zéro est un cas particulier
  # (retourne un vecteur de longueur nulle)
  x[0]
  #> numeric(0)
  ```
* Il est possible de spécifier si oui (`TRUE`) ou non (`FALSE`) on souhaite conserver des éléments :
  
  ```r
  x[c(TRUE, FALSE, TRUE, FALSE, TRUE)]
  #> [1] 1.3 3.5 5.7
  ```
* Si rien n'est spécifié, le vecteur d'origine est retourné :
  
  ```r
  x[]
  #> [1] 1.3 2.4 3.5 4.6 5.7
  ```
* Si les éléments sont nommés, on peut les sélectionner par leur nom :
  
  ```r
  names(x) <- c("a", "b", "c", "d", "e")
  x[c("a", "c", "e")]
  #>   a   c   e 
  #> 1.3 3.5 5.7
  ```

Les éléments ainsi sélectionnés peuvent être remplacés en affectant de nouvelles valeurs :

```r
x <- 1:5
x
#> [1] 1 2 3 4 5

# Remplacement du premier et du troisième élément
x[c(1, 3)] <- c(100, 300)
x
#> [1] 100   2 300   4   5
```

Lors de l'affectation de nouvelles valeurs à l'aide de `x[i] <- y` (où `i` correspond à l'indice des valeurs à remplacer dans `x` et `y` correspond au vecteur de nouvelles valeurs), il faut veiller à plusieurs aspects :

* La duplication d'indices :
  
  ```r
  x <- 1:5
  x[c(1, 1, 1)] # Duplique les valeurs
  #> [1] 1 1 1
  ```
* L'ordre des indices :
  
  ```r
  x <- 1:5
  x[c(5, 3, 1)] # Change l'ordre des valeurs
  #> [1] 5 3 1
  ```
* Les mécanismes de conversions implicites :
  
  ```r
  x <- 1:5
  typeof(x)
  #> [1] "integer"
  
  x[c(1, 3)] <- c(100.1, 300.3)
  typeof(x)
  #> [1] "double"
  ```
* La taille du vecteur de remplacement. Si ce dernier est trop petit, il sera **recyclé** : ses valeurs seront réutilisées autant que nécessaire :
  
  ```r
  x <- 1:5
  x[c(1, 2, 3, 4)] <- c(100, 200)
  x
  #> [1] 100 200 100 200   5
  ```

## Listes {#subset-list}

La sélection d'éléments dans une liste s'opère de la même façon que pour un vecteur atomique :


```r
x <- list(
  a = c(TRUE, FALSE),
  b = c(1, 2, 3, 4, 5),
  c = c("X", "Y", "Z")
)
x
#> $a
#> [1]  TRUE FALSE
#> 
#> $b
#> [1] 1 2 3 4 5
#> 
#> $c
#> [1] "X" "Y" "Z"

# Sélection du premier et du troisième élément
x[c(1, 3)]
#> $a
#> [1]  TRUE FALSE
#> 
#> $c
#> [1] "X" "Y" "Z"

x[c("a", "c")]
#> $a
#> [1]  TRUE FALSE
#> 
#> $c
#> [1] "X" "Y" "Z"
```

L'opérateur `[` retourne toujours une liste, y compris lorsqu'un unique élément est sélectionné. Pour extraire un unique élément *hors* de la liste, il est possible d'utiliser l'opérateur `[[` :


```r
y <- x[1]
typeof(y)
#> [1] "list"

z <- x[[1]]
typeof(z)
#> [1] "logical"
```

Si les éléments de la liste sont nommés, on peut extraire un unique élément en le sélectionnant par son nom avec `[[` ou avec l'opérateur `$` (dollar) :


```r
x[["a"]]
#> [1]  TRUE FALSE

x$a
#> [1]  TRUE FALSE
```

Cette distinction entre `[` et `[[` est particulièrement importante lorsqu'on souhaite remplacer des valeurs dans une liste (puisque `[` retourne toujours une liste, la valeur de remplacement doit également être une liste) :


```r
x[1] <- list(1:10)
x
#> $a
#>  [1]  1  2  3  4  5  6  7  8  9 10
#> 
#> $b
#> [1] 1 2 3 4 5
#> 
#> $c
#> [1] "X" "Y" "Z"

x[[1]] <- c(TRUE, FALSE)
x
#> $a
#> [1]  TRUE FALSE
#> 
#> $b
#> [1] 1 2 3 4 5
#> 
#> $c
#> [1] "X" "Y" "Z"
```

L'opérateur `[[` permet également de supprimer un élément en lui affectant la valeur `NULL` :


```r
x[[2]] <- NULL
x
#> $a
#> [1]  TRUE FALSE
#> 
#> $c
#> [1] "X" "Y" "Z"
```

## Matrices {#subset-matrix}

La sélection d'un sous-ensemble dans un tableau à deux dimensions (`matrix` ou `array`) est une généralisation de la sélection dans un vecteur. Il suffit de spécifier les indices des lignes et des colonnes, séparés par une virgule :


```r
x <- matrix(1:12, nrow = 3, ncol = 4)
rownames(x) <- c("x", "y", "z")
colnames(x) <- c("A", "B", "C", "D")
x
#>   A B C  D
#> x 1 4 7 10
#> y 2 5 8 11
#> z 3 6 9 12

# Sélection des lignes 2 à 3 et des colonnes 1 à 3
x[2:3, 1:3]
#>   A B C
#> y 2 5 8
#> z 3 6 9

x[-1, -4]
#>   A B C
#> y 2 5 8
#> z 3 6 9

x[c(FALSE, TRUE, TRUE), c("A", "B", "C")]
#>   A B C
#> y 2 5 8
#> z 3 6 9
```

Si rien n'est spécifié, toutes les lignes ou toutes les colonnes sont sélectionnées :


```r
# Sélection de toutes les lignes et des colonnes 1 à 3
x[, 1:3]
#>   A B C
#> x 1 4 7
#> y 2 5 8
#> z 3 6 9

# Sélection de toutes les colonnes et des lignes 2 à 3
x[2:3, ]
#>   A B C  D
#> y 2 5 8 11
#> z 3 6 9 12
```

Par défaut, `[` **simplifie** les résultats à la plus petite dimension possible. La sélection d'une unique valeur, d'une unique ligne ou d'une unique colonne, ne retourne donc pas une matrice mais un vecteur. La dimensionnalité de l'objet d'origine peut cependant être conservée à l'aide de l'argument `drop` :


```r
# Sélection de la première colonne
x[, 1] # Retourne un vecteur
#> x y z 
#> 1 2 3

x[, 1, drop = FALSE] # Retourne une matrice
#>   A
#> x 1
#> y 2
#> z 3
```

Les matrices sont des [vecteurs possédant un attribut particulier](#r-matrix) (`dim`), il est donc également possible de sélectionner un sous-ensemble à l'aide d'un unique vecteur (souvenez-vous que les matrices sont remplies par colonnes) :


```r
# Sélection des premières et troisièmes valeurs
x[c(1, 3)]
#> [1] 1 3

# Remplacement du triangle supérieur
x[upper.tri(x)] <- 0
x
#>   A B C D
#> x 1 0 0 0
#> y 2 5 0 0
#> z 3 6 9 0

# Remplacement du triangle inférieur
x[lower.tri(x)] <- 0
x
#>   A B C D
#> x 1 0 0 0
#> y 0 5 0 0
#> z 0 0 9 0
```

Enfin, il est possible d'utiliser une matrice pour sélectionner un sous-ensemble d'un tableau à deux dimensions ou plus. La première colonne doit alors contenir les indices des lignes à sélectionner, la seconde colonne les indices des colonnes et ainsi de suite pour les cas de dimension supérieure (`array`) :


```r
y <- matrix(c(1, 2, 3, 1, 2, 3), ncol = 2)
y
#>      [,1] [,2]
#> [1,]    1    1
#> [2,]    2    2
#> [3,]    3    3

x[y]
#> [1] 1 5 9
```

## Tableaux de données {#subset-dataframe}

Pour extraire ou remplacer des valeurs dans un `data.frame`, on peut utiliser deux stratégies (les `data.frame` ont les caractéristiques des listes et des matrices) :


```r
x <- data.frame(
  a = c(TRUE, FALSE, TRUE, TRUE),
  b = c(1, 2, 3, 4),
  c = c("A", "B", "C", "D")
)
x
#>       a b c
#> 1  TRUE 1 A
#> 2 FALSE 2 B
#> 3  TRUE 3 C
#> 4  TRUE 4 D

# Comme une liste !
x[c("a", "b", "c")] # Colonnes nommées "a", "b" et "c"
#>       a b c
#> 1  TRUE 1 A
#> 2 FALSE 2 B
#> 3  TRUE 3 C
#> 4  TRUE 4 D
x[[2]]              # Deuxième colonne uniquement
#> [1] 1 2 3 4
x$b                 # Colonne nommée "b"
#> [1] 1 2 3 4

# Comme une matrice !
x[, c("a", "b", "c")]
#>       a b c
#> 1  TRUE 1 A
#> 2 FALSE 2 B
#> 3  TRUE 3 C
#> 4  TRUE 4 D
x[, 2]
#> [1] 1 2 3 4
x[, "b", drop = FALSE]
#>   b
#> 1 1
#> 2 2
#> 3 3
#> 4 4
```

# Opérateurs {#operateurs}

## Opérateurs logiques

## Opérateurs arithmétiques

# Structures de contrôle

## Alternatives

## Boucles

# Fonctions d'ordre supérieur
