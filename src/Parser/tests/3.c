/*
Error 1: function redeclaration
Error 2: call to undelcared function
*/

int func(int b)
{
    return sqrt(b);
}

int func(int b)
{
    return b;
}