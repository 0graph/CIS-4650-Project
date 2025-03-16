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
    func7(); /* undeclared function */
}

void func5(void)
{
    int a;
    a = 5;
    return a; /* incompatible return type */
}

void func2(int a, int b)
{
    int c;
    d = 5; /* reference to undeclared variable*/
    b = 5;
    func1(true); /* incompatible argument type */
    return c;
}

int func1(int a)
{ /* multiple declarations*/
}
