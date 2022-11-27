#include <math.h>
#include <stdio.h>

// дзета функция Римана
double dzeta(int n) {
    double sum = 0;
    for (int i = 1; i <= n; i++) {
        sum += 1 / pow(i, 2);
    }
    return sum;
}
int main() {
    double pi;
    // Введите количество знаков после запятой от 1 до 7
    int n;
    printf("Enter the number of decimal places from 1 to 7:\t ");
    scanf("%d", &n);
    // вычисление числа Пи
    pi = sqrt(6 * dzeta(10000000));
    // вывод числа Пи
    printf("Pi = %.*f\n", n, pi);
}