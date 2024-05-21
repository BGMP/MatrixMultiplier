import csv
import datetime

from common import *

import numpy as np

MATRIX_SIZE = 32  # n


# Generate random matrix of size n
def generate_matrix(n):
    return np.random.randint(low=0, high=100, size=(n, n))


# Render a matrix to console
def render_matrix(matrix):
    for i in range(len(matrix)):
        for j in range(len(matrix)):
            print(matrix[i][j], end=" ")
        print()


# The traditional algorithm described at the beginning of the assignment (Traditional)
def traditional_multiplication(matrix, other):
    n = len(matrix)
    C = np.zeros((n, n))
    for i in range(n):
        for j in range(n):
            for k in range(n):
                C[i][j] += matrix[i][k] * other[k][j]
    return C


# The algorithm described by Property 1, which we will name DR1 (Divide and Conquer)
def dr1_multiplication(matrix, other):
    n = len(matrix)
    m = n // 2
    A11, A12, A21, A22 = matrix[:m, :m], matrix[:m, m:], matrix[m:, :m], matrix[m:, m:]
    B11, B12, B21, B22 = other[:m, :m], other[:m, m:], other[m:, :m], other[m:, m:]

    C11 = A11.dot(B11) + A12.dot(B21)
    C12 = A11.dot(B12) + A12.dot(B22)
    C21 = A21.dot(B11) + A22.dot(B21)
    C22 = A21.dot(B12) + A22.dot(B22)

    C = np.block([[C11, C12], [C21, C22]])
    return C


# The algorithm described by Property 2, which we will name DR2 (Strassen's algorithm)
def dr2_multiplication(matrix, other):
    n = len(matrix)
    m = n // 2
    A11, A12, A21, A22 = matrix[:m, :m], matrix[:m, m:], matrix[m:, :m], matrix[m:, m:]
    B11, B12, B21, B22 = other[:m, :m], other[:m, m:], other[m:, :m], other[m:, m:]

    M = (A11 + A22).dot(B11 + B22)
    N = (A21 + A22).dot(B11)
    O = A11.dot(B12 - B22)
    P = A22.dot(B21 - B11)
    Q = (A11 + A12).dot(B22)
    R = (A21 - A11).dot(B11 + B12)
    S = (A12 - A22).dot(B21 + B22)

    C11 = M + P - Q + S
    C12 = O + Q
    C21 = N + P
    C22 = M + O - N + R

    C = np.block([[C11, C12], [C21, C22]])
    return C


# Measure execution time for the given algorithm
def measure_time(algorithm, matrix, other):
    start = datetime.datetime.now()
    algorithm(matrix, other)
    end = datetime.datetime.now()
    return int((end - start).total_seconds() * 1000)


def main():
    m1 = generate_matrix(MATRIX_SIZE)
    m2 = generate_matrix(MATRIX_SIZE)

    result_traditional = traditional_multiplication(m1, m2)
    result_dr1 = dr1_multiplication(m1, m2)
    result_dr2 = dr2_multiplication(m1, m2)

    traditional_time = measure_time(traditional_multiplication, m1, m2)
    dr1_time = measure_time(dr1_multiplication, m1, m2)
    dr2_time = measure_time(dr2_multiplication, m1, m2)

    # Save results to CSV
    os.makedirs(DATA_DIR, exist_ok=True)
    file_path = os.path.join(DATA_DIR, "results.csv")
    with open(file_path, "a", newline="") as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow([MATRIX_SIZE, traditional_time, dr1_time, dr2_time])

    print(f"Traditional: {traditional_time} ms")
    print(f"Property 1: {dr1_time} ms")
    print(f"Property 2: {dr2_time} ms")


if __name__ == "__main__":
    main()
