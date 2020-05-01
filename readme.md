# GIF-3004 H2020
Laboratoire 5 - Systèmes embarqués temps réel.
Ce projet prend on considération que vous utilisez la machine virtuelle du cours avec la chaine de cross-compilation et que vous avez réussi le laboratoire 4 (bien que le fichier .ko soit fourni).


## Démonstration Vidéo
Le lien youtube ci-dessous contient une courte présentation du projet.

[GIF-3004 Laboratoire 5 Démo](https://youtu.be/7AF9ct4qcYU)



## Compilation
Le projet est constitué de deux parties, une pour le PC et une autre pour le Raspberry Pi Zero. Afin de compiler les binaires, il suffit de naviguer dans le dossier en question et d'executer CMake. Les binaires se trouverons alors dans ./pi/build/ et ./pc/build/

## Execution
### PC
Tout d'abord, il faut executer le serveur avec:
```
sudo ./pc/build/tp5serveur
```

### Raspberry Pi
Ensuite, il faut chargé dans le kernel le module du laboratoire 4 avec la commande suivante:
```
sudo insmod ./pi/setr_driver_irq.ko
```
Finalement, on démarre le client avec:
```
sudo ./pi/build/tp5client $"adresse du serveur"
```

### Test
Il sera ensuite possible d'entrer des touches dans le clavier connecté au Raspberry Pi et des les voir s'afficher en temps réel sur le nouveau périphérique présent sur le PC (serveur) dans /dev/claviersetr.
```
sudo tail -f /dev/claviersetr
```

## Test des modules de façon indépendante
Il est possible d'utiliser netcat afin de tester individuellement le serveur et le client de ce projet.

### Pour tester le client
PC:
```
nc -l 3004 > ./fichierquelconque
```

Pi:
```
./tp5client $"adresse du PC"
```

### Pour tester le serveur
PC:
```
./pc/build/tp5serveurPC

```

Pi:
```
nc $"adresse du PC" 3004

```
Ensuite vous n'avez qu'à tapper dans la console du Pi et regarder s'afficher le résultat en temps réel dans `./fichierquelconque` sur le PC.
