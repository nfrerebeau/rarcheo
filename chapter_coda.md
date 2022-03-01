# (PART) Données de composition {-}

# Introduction {#coda-enjeux}

Soient deux archéologues, Howard et Arthur qui se partagent l'étude de plusieurs ensembles de mobilier. On considère pour l'exemple la situation idéale, où chacun à reçu une moitié identique de chaque ensemble et que tous deux sont parfaitement routiniers de ce type d'étude. Howard quantifie son matériel en distinguant les catégories A, B, C et D. De son côté Arthur ne quantifie que les catégories A, B et C (tab. \@ref(tab:coda-subcoherence)). Les résultats d'Arthur constituent ainsi une sous-composition de ceux obtenus par Howard et, en toute logique, les observations faites par les deux archéologues sur les catégories de mobilier qu'ils ont en commun devraient s'accorder.

\begin{table}

\caption{(\#tab:coda-subcoherence)Pourcentages de céramiques appartenant à chaque catéogrie observés par deux archéologues.}
\centering
\begin{tabular}[t]{r|r|r|r|r|r|r}
\hline
\multicolumn{4}{c|}{Howard} & \multicolumn{3}{c}{Arthur} \\
\cline{1-4} \cline{5-7}
A & B & C & D & A & B & C\\
\hline
0.1 & 0.2 & 0.1 & 0.6 & 0.250 & 0.500 & 0.25\\
\hline
0.2 & 0.1 & 0.1 & 0.6 & 0.500 & 0.250 & 0.25\\
\hline
0.3 & 0.3 & 0.2 & 0.2 & 0.375 & 0.375 & 0.25\\
\hline
\end{tabular}
\end{table}

A partir de leurs résultats, exprimés en pourcentages, les deux archéologues cherchent ensuite à mettre en évidence les relations de dépendance entre certaines catégories de mobilier. Pour cela, tous deux calculent à partir de leurs données le coefficient de corrélation entre les catégories A et B. Howard et Arthur obtiennent 0.5 et -1, respectivement, alors qu'ils étudient le même matériel.

L'approche courante lorsque l'on cherche à explorer les relations de d'inter-dépendance dans le cas d'un jeu de données multivarié est de s'attacher à la [covariance](#covariance) et à la [corrélation](#correlation) entre variables. Pour deux variables aléatoires $X$ et $Y$, la covariance est en effet une mesure de la tendance de ces deux variables à évoluer dans le même sens (indiqué par le signe de la covariance), tandis que la corrélation (covariance normalisée) est une mesure de l'intensité de la relation entre ces deux variables.

Pour une composition $x$ de longueur $D$ telle que $x = \left[ x_{1}, x_{2}, \dotsc, x_{D} \right]$ avec $\sum_{i=1}^{D} x_{i} = 1$, on a :

\begin{equation}
\mathrm{Cov}(x_{1}, x_{1} + \dotsb + x_{D}) = 0
(\#eq:negbias1)
\end{equation}

Soit :

\begin{equation}
\mathrm{Cov}(x_{1}, x_{2}) + \dotsb + \mathrm{Cov}(x_{1}, x_{D}) = - \mathrm{Var}(x_{1})
(\#eq:negbias2)
\end{equation}

Ainsi, le membre de droite de l'équation \@ref(eq:negbias2) est toujours négatif (excepté dans le cas où le premier composé est une constante), si bien qu'au moins une des covariances du membre de gauche est forcement négative [@aitchison1986, p. 53-54]. Autrement formulé, au moins un élément de chaque ligne de la matrice de covariance doit être négatif (soit au moins $D$ éléments de la matrice).

Dans le cas des données de composition, la covariance entre deux composés est donc contrainte par la somme constante et dépend des autres composés également présents dans le jeu de données. De plus, la matrice de covariance est également singulière [@vandenboogaart2013]. L'influence de la somme constante au sein de la matrice de covariance se traduit en terme de corrélation : s'agissant de compositions, le coefficient de corrélation n'est pas libre de prendre une valeur dans l'intervalle $[-1;1]$ mais correspond à une valeur arbitraire^[@pearson1896 a été le premier à relever le risque que représente l'interprétation de ce qu'il nomme alors *spurious correlation* ("corrélation fallacieuse"), mettant alors en évidence que la corrélation entre des rapports présentant des parties communes au dénominateur est arbitraire. Le problème est redécouvert au milieu du XX^e^ siècle par @chayes1960 mais il faut attendre les premiers travaux de @aitchison1986 pour qu'une solution formelle soit trouvée.].

L'exemple d'une composition à deux composés donné est particulièrement illustratif du problème [@aitchison1986, p. 54], on a en effet :

\begin{equation*}
\mathrm{Cov}(x_{1}, x_{2}) = \mathrm{Cov}(x_{1}, 1 - x_{1}) = - \mathrm{Var}(x_{1}) = - \mathrm{Var}(x_{2})
(\#eq:negbias3)
\end{equation*}

Soit :

\begin{equation*}
\mathrm{Corr}(x_{1}, x_{2}) = \frac{\mathrm{Cov}(x_{1}, x_{2})}{\sqrt{\mathrm{Var}(x_{1}) \mathrm{Var}(x_{2})}} = - 1
(\#eq:negbias4)
\end{equation*}

Les définitions classiques de la covariance et de la corrélation ne respectent pas le principe de *subcompositional coherence*. Ce problème se manifeste particulièrement lorsque les teneurs brutes de deux composés sont représentés au sein d'un diagramme de dispersion^[Ou diagramme de Harker [@harker1909, p. 119].]. Il n'y a en effet aucune garantie que les projections à partir du jeu de données initial ou d'une sous-composition conduisent à des observations similaires. Bien que ce type de représentation soit particulièrement courant, il est impossible de faire confiance aux tendances ainsi mises en évidence [@aitchison2005]^[Voir la réponse de @cortes2009.].

Ainsi, la plupart des méthodes dédiées aux statistiques multivariées, dont la mise en œuvre repose sur l'exploitation des matrices de variance-covariance, sont inapplicables. Le recours à ces dernières requiert une transformation préalable des données, permettant de casser la contrainte de somme constante introduite par la fermeture des données et de travailler dans un espace réel.

# Transformations de données {#coda-transformations}

(ref:coda-simplex) Exemple de compositions projetées dans $\mathbb{R}^3$ (gauche). L'ensemble des points appartient à un hyperplan correspondant au diagramme ternaire des trois composés (droite).

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{chapter_coda_files/figure-latex/coda-simplex-1} 

}

\caption{(ref:coda-simplex)}(\#fig:coda-simplex)
\end{figure}

(ref:coda-alr-d2) Dans le cas d'une composition à deux composés, on a $\ln\frac{x_{2}}{x_{1}} = \ln\frac{1-x_{1}}{x_{1}}$. Bien que les valeurs des deux composés soient contraintes entre 0 et 1, le logarithme de leur rapport peut prendre toute valeur dans $\mathbb{R}$.

\begin{figure}

{\centering \includegraphics[width=0.7\linewidth]{chapter_coda_files/figure-latex/coda-alr-d2-1} 

}

\caption{(ref:coda-alr-d2)}(\#fig:coda-alr-d2)
\end{figure}

