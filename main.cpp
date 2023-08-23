#include <iostream>

extern "C" {
    void call_custom_alert();
}

int main() {
    call_custom_alert();
}
