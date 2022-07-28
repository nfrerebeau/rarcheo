# Créer automatiquement une bibliographie des packages R utilisés
knitr::write_bib(c(.packages(), desc::desc_get_deps()$package), 'packages.bib')
