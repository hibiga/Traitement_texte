# Contexte
## DSL (Domain Specific Language)
Nous utilisons depuis longtemps et dans diverses activités des DSL parfois sans même nous en apercevoir. Peuvent être considérées comme des DSL le langage SQL, le langage de requête d’un moteur de recherche, voire un ensemble d’expressions régulières.

Un DSL (Domain Specific Language), par opposition aux langages de programmation généeralistes tels que Python, Java, C++. . . et aux langages de modélisation généralistes tels que UML, se différencie pour les trois raisons suivantes :
- Il est spécifique : Un DSL peut être un langage, de transformation, de modélisation, de programmation ou d’interrogation, selon ce pour quoi il a été conçu. Il est spécifique à un domaine métier précis et souvent peut ne pas répondre à toutes les problématiques liées à ce domaine.
- Il est doté d’un vocabulaire précis et concis : Un DSL est simple d’utilisation et non ambigu. Son expressivité est basée sur un vocabulaire ciblé, propre au domaine métier.
- Qu’il ai été créé ou adapté, il doit rester évolutif : La syntaxe du DSL est simple à personnaliser, elle se base sur un vocabulaire et des règles syntaxiques explicites entièrement définies lors de sa conception.

Grâce à sa syntaxe personnalisable, exprimant des concepts communs à son domaine d’application, un DSL est paramétrable par rapport au métier, à une communauté ou à un projet. Facile à interpréter, il est un outil de communication entre les experts du domaine et le développeur, il permet aux experts de participer à la conception fonctionnelle de l’application. 

## Text Encoding Inititative (TEI)
Les Recommandations de la TEI – Text Encoding Inititative (TEI) Guidelines (http://www.tei-c.org/release/doc/tei-p5-doc/fr/html/index.html) s’adressent à tous ceux qui souhaitent échanger des informations stockées sous forme électronique. Elles mettent l’accent sur l’échange des données textuelles mais d’autres types de données comme les images et les sons sont également pris en compte. Les Recommandations peuvent être appliquées aussi bien pour créer de nouvelles informations que pour échanger des informations existantes. 

Les Recommandations fournissent le moyen de rendre explicites certaines caractéristiques d’un texte, de façon à faciliter le traitement de ce texte par des programmes informatiques pouvant s’exécuter sur des plates-formes différentes.
# Les objectifs
Les objectifs de ce travail sont :
- spécifier à partir d’une spécialisation de la TEI, un ou plusieurs DSL d’annotation permettant de marquer finement des catégories particulières d’informations contenues dans les documents mis à votre disposition. Chaque langage ayant sa propre finalité et donc sa propre logique :
  - un DSL liés à la structure du texte permettant l’annotation en catégories grammaticales (Part Of Speech) des mots ou groupe de mots d’un texte, puis on souhaite un DSL (extension du premier ou indépendant) permettant une annotation par catégorisation sémantique, d’expressions particulières comme celles exprimant le temps, ou l’espace, ou encore les actions (sujet, verbe, complément). . ..
  - un DSL permettant cette fois-ci d’organiser dans une structure régulière de type Base de Données (BD), les éléments et attributs (obligatoires et optionnelles) pour les informations précédemment annotées.
- Implémenter, via XSLT, un premier ensemble de transformations permettant de passer des informations annotées par lu ou des langages DSL liés à la structure du texte vers le DSL permettant l’organisation de ces mêmes informations dans une structure régulière (équivalente à des tables de Base de Données).
- Implémenter (en XSLT) un second ensemble de transformations permettant de passer, selon le besoin, des langages DSL spécifiés dans ce projet vers des langages pour des usages précis, qu’ils soient conçus selon les principes XML (GPX, SVG, KML, OWL,. . .) ou pas (JSON, GeoJSON, PDF, DOT(Graphviz),. . .).

## Le travail à réaliser consiste :
- à spécifier le lexique et la syntaxe de chaque langage DSL pour répondre aux besoins que vous aurez mis en évidence par l’étude préalable de l’annotation des documents pré-annotés donnés en exemple et des objectifs de représentation de l’information. Cette étude sera réalisée lors des séances en présentiel prévues à cet effet, elle constituera une sorte de mini cahier de charge (CC) pour la spécification des langages ;
- à spécifier les propriétés de chaque langage obligatoirement réalisée gràce au langage XML-Schema (vous pouvez vous aider en passant par une première spécification grossière en langage DTD).
- à tester, sur les exemples de documents mis à votre disposition, les capacités de contrôle et d’expressivité des DSL spécifiés pour un marquage selon la structure du texte.
- de réaliser des transformations contrôlées gràce au langage XSLT et au langage de description XML-Schema
- de réaliser gràce au langage XSLT les autres transformations nécessaires aux besoins exprimés dans le CC.

## Quelques précisions :
- Le ou les DSL spécifiés pour les annotations respectant la structure du texte, doivent pouvoir coexister gràce aux espaces de nom qu’il sera nécessaire de définir.
- Cela permettra alors de pouvoir avoir dans un même document les annotations provenant de ces divers DSL.
- Un marquage par le DSL modélisant la catégorie grammaticale des Noms Propres doit par exemple, quand il s’agit d’un Nom de Lieu, pouvoir co-exister avec un marquage du DSL modélisant les catégories sémantiques afin d’intégrer des informations supplémentaires comme
la nature (catégorie sémantique) du Nom Propre (Lieu de type Lac) ou encore les coordonnées permettant de le < géo-localisation > sur une carte.
- Le DSL modélisant les catégories grammaticales doit prévoir d’intégrer en plus de la marque catégorielle, par exemple, le lemme du mot.
- Une transformation vers un langage du monde XML pourrait être la traduction de toutes les < entités nommées de lieu > et informations associées en élément adéquat à des fins de cartographie gràce à l’api Leaflet (http ://leafletjs.com/) et aux données d’OpenStreetMap (http ://www.openstreetmap.org/).
