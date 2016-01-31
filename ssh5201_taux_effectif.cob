IDENTIFICATION DIVISION.
PROGRAM-ID. SSH5201-TauxEffectif.
AUTHOR. Antoine Proulx.
*> Calcule le taux effectif d'un taux d'intérêt nominal annuel capitalisé par période de capitalisation et par année.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 Entrees.
    02 TauxInteretNominalAn PIC 99V99 VALUE ZEROS.
    02 NombrePeriodes       PIC 99    VALUE 1.
01 TauxInteretsEffectifs.
    02 TauxInteretEffectifPC PIC 99V99 VALUE ZEROS.
    02 TauxInteretEffecitfAn PIC 99V99 VALUE ZEROS.

PROCEDURE DIVISION.
CalculerTauxEffectif.
    *> Affichage de l'en-tête
    DISPLAY "Calcul du taux effectif d'un taux d'intérêt nominal annuel capitalisé"
    DISPLAY "- Par période de capitalisation"
    DISPLAY "- Par année"
    DISPLAY SPACE

    *> Obtention des entrées
    DISPLAY "Taux d'intérêt nominal par année (r %) :  " WITH NO ADVANCING
    ACCEPT  TauxInteretNominalAn
    DISPLAY "Nombre de périodes de capitalisation par année (m) :  " WITH NO ADVANCING
    ACCEPT  NombrePeriodes

    *> Calcul
    COMPUTE TauxInteretEffectifPC = TauxInteretNominalAn / NombrePeriodes
    COMPUTE TauxInteretEffecitfAn = ((1 + TauxInteretEffectifPC / 100) ** NombrePeriodes - 1) * 100

    *> Affichage du résultat
    DISPLAY SPACE
    DISPLAY "Taux d'intérêt effectif"
    DISPLAY "- Par période de capitalisation (i_PC) :  ", TauxInteretEffectifPC, " %"
    DISPLAY "- Par année                        (i) :  ", TauxInteretEffecitfAn, " %"

    STOP RUN.
