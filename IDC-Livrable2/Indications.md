[TOC]


Bonjour, 

Ci-joint l'explication de chaque fichier du dossier en fonction de chaque partie du livrable. 

##### A) Reprendre intégralement ou partiellement le schéma du DSL du livrable n°1.

fr_Cussac_schema_liv1.xsd : Nouveau schéma syntétisé du livrable 1 (shéma qui valide le xml du livrable 1).
fr_Cussas_liv1.xml : XML du livrable 1 avec les corrections, que vous nous avez donné, d'aporté.

Ensuite, nous avons modifié fr_Cussac ainsi que le schéma pour enlever les attributs de lieu : placeName, geogFeat et geaogName ainsi que offset, phr et s afin de mieux faire la partie B de ce livrable. 
Il y aura donc que les atrtibuts w et pc dans p. 

fr_Cussas_liv2.xml : XML du livrable 1 avec les corrections et sans les attributs s, phr, offset, placeName, geogName et geogFeat. 
fr_Cussac_schema_liv2.xsd : Schéma syntétisé de ce nouveau XML (shéma qui valide fr_Cussas_liv2.xml).

dcr.xsd et xml.xsd : Schémas nécessaires à la validation générés par Roma. 

##### B) Concevoir une ou plusieurs feuilles de style en xslt

fr_Cussac_style.xsl : Fichier en XSLT du livrable 2. 
fr_Cussac.xml : XML généré par les fichiers fr_Cussac_liv2.xml et fr_Cussac-style.xsl.
fr_Cussac-coord-entites.xml : Coordonnées des lieux indiqué dans le XML. 

#####C) Faire un nouveau schéma à partir de celui-ci du Livrable 1 afin d'y intégrer les nouveaux éléments et nouveaux attributs avec les mêmes impératifs, c'est-à-dire le moins permissif que possible. 
#####D) Enfin, intégrer le lien vers ce schéma dans votre nouvelle instance afin de la validée.

fr_Cussac_schema.xsd : Schéma qui valide la transformation : fr_Cussac
localisation_schema.xsd : Schéma qui valide fr_Cussac-coord-entites.xml