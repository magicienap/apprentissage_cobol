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
    02 O-MontantFutur   PIC 9(9)V99 VALUE ZERO.
01 Sorties.
    02 S-MontantPresent PIC Z(8)9.99B$ VALUE ZERO.
    02 S-Interets       PIC Z(8)9.99B$ VALUE ZERO.
    02 S-MontantFutur   PIC Z(8)9.99B$ VALUE ZERO.
01 Separateur           PIC X(33)      VALUE ALL "-".

PROCEDURE DIVISION.
Debut.
    DISPLAY "Intérêt simple et composé"
    DISPLAY SPACE

    PERFORM ObtenirEntrees

    DISPLAY SPACE
    DISPLAY "Intérêt simple"
    DISPLAY Separateur
    PERFORM CalculerInteretSimple
    PERFORM AfficherResultat

    DISPLAY SPACE
    DISPLAY "Intérêt composé"
    DISPLAY Separateur
    PERFORM CalculerInteretCompose
    PERFORM AfficherResultat

    STOP RUN
    .

ObtenirEntrees.
    DISPLAY "Montant présent (P) :  " WITH NO ADVANCING
    ACCEPT  E-MontantPresent
    DISPLAY "Taux d'intérêt par période (i %) :  " WITH NO ADVANCING
    ACCEPT  E-TauxInteret
    DISPLAY "Nombre de périodes (n) :  " WITH NO ADVANCING
    ACCEPT  E-NombrePeriodes
    .

AfficherResultat.
    DISPLAY "Montant présent :  ", S-MontantPresent
    DISPLAY "Intérêts        :  ", S-Interets
    DISPLAY "Montant futur   :  ", S-MontantFutur
    .

CalculerInteretSimple.
    COMPUTE O-Interets ROUNDED = E-MontantPresent * (E-TauxInteret / 100) * E-NombrePeriodes
    ADD E-MontantPresent, O-Interets GIVING S-MontantFutur
    MOVE E-MontantPresent TO S-MontantPresent
    MOVE O-Interets TO S-Interets
    .

CalculerInteretCompose.
    COMPUTE O-MontantFutur ROUNDED = E-MontantPresent * (1 + E-TauxInteret / 100) ** E-NombrePeriodes
    SUBTRACT E-MontantPresent FROM O-MontantFutur GIVING S-Interets
    MOVE E-MontantPresent TO S-MontantPresent
    MOVE O-MontantFutur TO S-MontantFutur
    .
