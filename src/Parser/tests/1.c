/* A program that contain mutual recursions */
int x;
int y;
void g(int n); /* prototype for a function */
void f(int n) {
  g(n);
  y = y - 1;
}
void g(int m) {
  m = m - 1;
  if (m > 0) {
    f(m);
    y = y - 1;
    g(m);
  }
}
int main(void) {
  x = input();
  y = input();
  g(x);
  output(x);
  output(y);
}
