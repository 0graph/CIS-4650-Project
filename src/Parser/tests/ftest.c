/*
Testing of functions for symbol table
*/

int func1(int a);

void func2(int a, int b);

int func1(int a); /* multiple prototypes */

int func1(int a)
{
    int a; /* redefintion in same scope */
}

void func2(int a, int b)
{
    int c;
}

int func1(int a)
{ /* multiple declarations*/
}
