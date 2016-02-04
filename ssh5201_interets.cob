IDENTIFICATION DIVISION.
PROGRAM-ID. SSH5201-Interets.
AUTHOR. Antoine Proulx.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 Entrees.
    02 E-MontantPresent PIC 9(9)V99 VALUE ZERO.
    02 E-TauxInteret    PIC 99V99   VALUE ZERO.
    02 E-NombrePeriodes PIC 99      VALUE 1.
01 Operations.
    02 O-Interets       PIC 9(9)V99 VALUE ZERO.
01 Sorties.
    02 S-MontantPresent PIC Z(8)9.99B$ VALUE ZERO.
    02 S-Interets       PIC Z(8)9.99B$ VALUE ZERO.
    02 S-MontantFutur   PIC Z(8)9.99B$ VALUE ZERO.

PROCEDURE DIVISION.
CalculterInteretSimple.
    *> Affichage de l'en-tête
    DISPLAY "Intérêt simple"
    DISPLAY SPACE

    *> Obtention des entrées
    DISPLAY "Montant présent (P) :  " WITH NO ADVANCING
    ACCEPT  E-MontantPresent
    DISPLAY "Taux d'intérêt par période (i %) :  " WITH NO ADVANCING
    ACCEPT  E-TauxInteret
    DISPLAY "Nombre de périodes (n) :  " WITH NO ADVANCING
    ACCEPT  E-NombrePeriodes

    *> Calcul
    COMPUTE O-Interets = E-MontantPresent * (E-TauxInteret / 100) * E-NombrePeriodes
    ADD E-MontantPresent, O-Interets GIVING S-MontantFutur
    MOVE E-MontantPresent TO S-MontantPresent
    MOVE O-Interets TO S-Interets

    *> Affichage du résultat
    DISPLAY SPACE
    DISPLAY "Montant présent :  ", S-MontantPresent
    DISPLAY "Intérêts        :  ", S-Interets
    DISPLAY "Montant futur   :  ", S-MontantFutur

    STOP RUN.
