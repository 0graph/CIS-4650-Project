/*
Error 1: invalid parameters for function call
Error 2: invalid variable type
Error 3: invalid return type
*/

void castle(void)
{
    return;
}

bool func(int b)
{
    void a;
    castle(b);
    return b;
}