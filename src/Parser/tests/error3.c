/*
Error 1:    Invalid parameter list for function g
Error 2:    Invalid params for function call g
Error 3:    Invalid variable type    
*/


watermelon x;
int y;
void g(int n);
void f(int n)
{
    g(n);
    y = y - 1;
}
void g(int m,)
{
    m = m - 1;
    if (m > 0)
    {
        f(m);
        y = y - 1;
        g(m,);
    }
}
int main(void)
{
    x = input();
    y = input();
    g(x);
    output(x);
    output(y);
}
