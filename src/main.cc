#include <iostream>
#include "bar/bar.h"
#include "baz/baz.h"
#include "fizz/fizz.h"
#include "foo/foo.h"

int main() {
  std::cout << "Hello world!" << std::endl;
  std::cout << "FOO : " << foo(1) << std::endl;
  std::cout << "BAR : " << bar(2) << std::endl;
  std::cout << "FIZZ : " << fizz(1) << std::endl;
  std::cout << "BAZ : " << baz(2) << std::endl;
}
