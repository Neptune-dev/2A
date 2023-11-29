#include <stdio.h>
#include <stdlib.h>

int main ()
{
    /* exercice 1 */
    #if 0
    
    int a, b;

    a = getchar();
    do
    {
        b = getchar();
    } while (b == 10);


    putchar(a);
    putchar(10);
    putchar(b);

    #endif

    /* exercice 2 */
    #if 0
    
    int c;
    do 
    {
        c = getchar();
        putchar(10);
        putchar(c);
    } while (c != 10);
    
    #endif

    /*exercice 3 */
    #if 0

    int lecteur;
    int compte = 0;

    printf("Charactère à compter : ");
    int a = getchar();
    int retour = getchar();
    printf("Chaine de charactère : ");

    do
    {
        lecteur = getchar();
        if (lecteur == a)
        {
            compte++;
        }
    } while (lecteur != 10);
    printf("Compte : %d", compte);

    #endif

    /*exercice 4*/
    #if 0

    int lecteur;
    printf("Chaine de charactère : ");
    do
    {
        lecteur = getchar();
        if (lecteur != ' ' && lecteur != '\t')
        {
            putchar(lecteur);
        }
    } while (lecteur != 10);

    #endif

    /*exercice 5*/
    #if 0

    int lecteur = getchar();

    if (lecteur == 'F' || lecteur == 'f')
    {
        for (int i = 0; i < 6; i++) {putchar('#');} putchar(10); //retour
        for (int i = 0; i < 2; i++) {putchar('#'); putchar(10);}
        for (int i = 0; i < 5; i++) {putchar('#');} putchar(10); //retour
        for (int i = 0; i < 3; i++) {putchar('#'); putchar(10);}
    } else if (lecteur == 'C' || lecteur == 'c')
    {
        for (int i = 0; i < 3; i++) {putchar(' ');}
        for (int i = 0; i < 6; i++) {putchar('#');} putchar(10); //retour
        putchar(' ');
        for (int i = 0; i < 2; i++) {putchar('#');}
        for (int i = 0; i < 6; i++) {putchar(' ');}
        for (int i = 0; i < 2; i++) {putchar('#');} putchar(10); //retour
        for (int i = 0; i < 6; i++) {putchar('#'); putchar(10);}
        putchar(' ');
        for (int i = 0; i < 2; i++) {putchar('#');}
        for (int i = 0; i < 6; i++) {putchar(' ');}
        for (int i = 0; i < 2; i++) {putchar('#');} putchar(10); //retour
        for (int i = 0; i < 3; i++) {putchar(' ');}
        for (int i = 0; i < 6; i++) {putchar('#');} putchar(10); //retour
    } else {
        printf("Mauvaise entrée.\n");
    }

    #endif

    /*exercice 6*/
    #if 0

    int n;

    do{
        printf("Entrez un entier positif: ");
        scanf("%d",&n);
    }
    while(n < 0);
    for (int i = 1; i<=n; i++){
        printf("%d %d %d\n", i,i*i,i*i*i);
    }

    #endif

    /*exercice 7*/
    #if 0

    int a,b,c;
    printf("Entrez 3 valeurs a b c: ");
    scanf("%d %d %d", &a, &b, &c);
    if((a >= 10 && a <= 20) || (b >= 10 && b <= 20) || (c >= 10 && c <= 20)){
        printf("%d",1);
    } else {
        printf("%d",0);
    }

    #endif

    /*exercice 8*/
    #if 0
    int a, b;
    printf("Entrez le nombre de ligne a: ");
    scanf("%d", &a);
    printf("Entrez le nombre de colonne b: ");
    scanf("%d", &b);

    for (int i = 0; i < a; i++) {
        for (int j = 1; j < b + 1; j++) {
            printf("%d ", b * i + j);
        }
        printf("\n");
    }

    #endif

    /*exercice 9*/
    #if 0

    int base;
    int nombre = 1;

    printf("Base du triangle : ");
    scanf("%d", &base);
    
    for (int i = 1; i <= base; i++)
    {
        for (int j = 1; j <= i; j++)
        {
            printf("%d", nombre);
            nombre = !nombre;
        }
        putchar(10);
    }
    
    #endif

    return 0;
}