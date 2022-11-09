#include <iostream>
#include <vector>
#include <random>
#include <chrono>
#include <windows.h>
#include <map>

void
multiplyBlocks(const std::vector<int> &a, const std::vector<int> &b, std::vector<int> &c, int n, int r, int I, int J) {
    for (int i = I; i < std::min(I + r, n); ++i) {
        for (int j = J; j < std::min(J + r, n); ++j) {
            c[i * n + j] = 0;
            for (int k = 0; k < n; k++) {
                c[i * n + j] += a[i * n + k] * b[k * n + j];
            }
        }
    }
}

void multiplyMatrixSeq(const std::vector<int> &a, const std::vector<int> &b, std::vector<int> &c, int n, int r) {
    for (int I = 0; I < n; I += r) {
        for (int J = 0; J < n; J += r) {
            multiplyBlocks(a, b, c, n, r, I, J);
        }
    }
}

struct Args {
    Args(const std::vector<int> &firstMatrix, const std::vector<int> &secondMatrix, std::vector<int> &result,
         size_t blockI, size_t blockJ, size_t matrixSize, size_t blockSize) : firstMatrix(firstMatrix),
                                                                              secondMatrix(secondMatrix),
                                                                              result(result), I(blockI), J(blockJ),
                                                                              n(matrixSize), r(blockSize) {
    }

    const std::vector<int> &firstMatrix;
    const std::vector<int> &secondMatrix;
    std::vector<int> &result;
    size_t I;
    size_t J;
    size_t n;
    size_t r;
};

DWORD WINAPI Call(LPVOID args) {
    Args *castedArgs = (Args *) args;
    multiplyBlocks(castedArgs->firstMatrix, castedArgs->secondMatrix, castedArgs->result, castedArgs->n, castedArgs->r,
                   castedArgs->I, castedArgs->J);
    ExitThread(0);
}

void multiplyMatrixThread(const std::vector<int> &a, const std::vector<int> &b, std::vector<int> &c, int n, int r) {
    std::vector<HANDLE> threads;
    for (int I = 0; I < n; I += r) {
        for (int J = 0; J < n; J += r) {
            threads.emplace_back(CreateThread(NULL, 0, &Call, new Args(a, b, c, I, J, n, r), 0, NULL));
        }
    }
    for (HANDLE &thread: threads) {
        WaitForSingleObject(thread, INFINITE);
    }
}

std::vector<int> generateMatrix(int n) {
    std::vector<int> result(n * n);
    std::mt19937 rnd(std::chrono::system_clock::now().time_since_epoch().count());
    for (int i = 0; i < n * n; i++) {
        result[i] = static_cast<int>(rnd()) % 201 - 100;
    }
    return result;
}

std::map<int, std::pair<double, double>>
generateTimes(const std::vector<int> &matrixA, const std::vector<int> &matrixB, std::vector<int> &matrixC, int n) {
    std::map<int, std::pair<double, double>> times;
    for (int i = 1; i < n; ++i) {
        auto start = std::chrono::system_clock::now();
        multiplyMatrixSeq(matrixA, matrixB, matrixC, n, i);
        auto end = std::chrono::system_clock::now();
        auto durSeq = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();

        start = std::chrono::system_clock::now();
        multiplyMatrixThread(matrixA, matrixB, matrixC, n, i);
        end = std::chrono::system_clock::now();
        auto durThread = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();
        times[i] = std::pair<double, double>(durSeq, durThread);
    }
    return times;
}

int main() {
    int n = 300;
    std::vector<int> matrixA = generateMatrix(n);
    std::vector<int> matrixB = generateMatrix(n);
    std::vector<int> matrixC(n * n, 0);
    std::map<int, std::pair<double, double>> times = generateTimes(matrixA, matrixB, matrixC, n);

    for (int i = 0; i < times.size(); ++i) {
        std::cout << "Size of blocks: " << i + 1 << "; Amount of blocks: " << ceil((1. * n / (i + 1))) * n
                  << "; Duration for sequential: " << times[i + 1].first
                  << "; Duration for thread: " << times[i + 1].second << "; Speed up: "
                  << 1. * times[i + 1].first / times[i + 1].second << std::endl;
    }
}