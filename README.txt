Bonjour!

Ce programme a été développé sous Matlab R2010a mais il a été testé sur quelques versions postérieures de Matlab.
Il ne devrait normalement pas avoir de problèmes. Le dossier contient aussi des fichiers qui permettent à n'importe
qui d'executer le code qu'importe sa version Matlab FFGRAB.cpp, avbin64.dll,FFGrab.mexw64.

Pour l'exécution, quatre choix s'offrent à vous:

	- main.m : permet de lancer une détection normale d'un objet dans une image ( à sélectionner dans la même image ou charger un
		   indépendemment le modèle).
	- video_Bens : permet de faire du tracking sur des vidéos déjà enregistrées: Second.avi,VideoBens.wmv,Bolt.mp4

	- BenchmarkTest.m : permet d'exécuter le Benchmark de test sur la base de données de séquences d'images. Voir les instructions
			    dans le fichier.
	- realTimeObjectTrack : permet de faire du tracking en temps réel. Lancez le programme et veillez à laisser l'objet immobile (Matlab
				a du lag entre l'affichage at la sélection de l'objet) jusqu'à ce que le rectangle rouge et le centroide en
				en jaune s'affiche (Target Locked! Vous pouvez commencer à bouger votre objet).
	
Remarque :
*La sélection du template doit se faire de manière judicieuse! Evitez des fenêtres trop grandes qui introduiraient des couleurs parasites.

Bonne simulation :)!

Ghizlane 