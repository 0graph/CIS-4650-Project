/*
Testing of functions for symbol table
*/

int func1(int a);

void func2(int a, int b);

int func1(int a); /* multiple prototypes */

int func1(int a)
{
    int a; /* redefintion in same scope */
    func1(a);
    func7();
}

void func2(int a, int b)
{
    int c;
    d = 5; /* reference to undeclared variable*/
    b = 5;
}

int func1(int a)
{ /* multiple declarations*/
}
