Bonjour!

Ce programme a �t� d�velopp� sous Matlab R2010a mais il a �t� test� sur quelques versions post�rieures de Matlab.
Il ne devrait normalement pas avoir de probl�mes. Le dossier contient aussi des fichiers qui permettent � n'importe
qui d'executer le code qu'importe sa version Matlab FFGRAB.cpp, avbin64.dll,FFGrab.mexw64.

Pour l'ex�cution, quatre choix s'offrent � vous:

	- main.m : permet de lancer une d�tection normale d'un objet dans une image ( � s�lectionner dans la m�me image ou charger un
		   ind�pendemment le mod�le).
	- video_Bens : permet de faire du tracking sur des vid�os d�j� enregistr�es: Second.avi,VideoBens.wmv,Bolt.mp4

	- BenchmarkTest.m : permet d'ex�cuter le Benchmark de test sur la base de donn�es de s�quences d'images. Voir les instructions
			    dans le fichier.
	- realTimeObjectTrack : permet de faire du tracking en temps r�el. Lancez le programme et veillez � laisser l'objet immobile (Matlab
				a du lag entre l'affichage at la s�lection de l'objet) jusqu'� ce que le rectangle rouge et le centroide en
				en jaune s'affiche (Target Locked! Vous pouvez commencer � bouger votre objet).
	
Remarque :
*La s�lection du template doit se faire de mani�re judicieuse! Evitez des fen�tres trop grandes qui introduiraient des couleurs parasites.

Bonne simulation :)!

Ghizlane 