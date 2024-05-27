import csv
import datetime

from common import *

import numpy as np

MATRIX_SIZE = [32, 64, 128, 256, 512, 1024]  # n


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

    # Base case for recursion: if the matrix size is 8, directly calculate the product
    if n <= 16:
        return traditional_multiplication(matrix, other)

    m = n // 2

    # Divide matrices into submatrices (no slicing for recursive call)
    A11 = matrix[:m, :m]
    A12 = matrix[:m, m:]
    A21 = matrix[m:, :m]
    A22 = matrix[m:, m:]
    B11 = other[:m, :m]
    B12 = other[:m, m:]
    B21 = other[m:, :m]
    B22 = other[m:, m:]

    # Recursively calculate products of submatrices
    C11 = dr1_multiplication(A11, B11) + dr1_multiplication(A12, B21)
    C12 = dr1_multiplication(A11, B12) + dr1_multiplication(A12, B22)
    C21 = dr1_multiplication(A21, B11) + dr1_multiplication(A22, B21)
    C22 = dr1_multiplication(A21, B12) + dr1_multiplication(A22, B22)

    # Combine the results to get the final matrix
    C = np.block([[C11, C12], [C21, C22]])
    return C


# The algorithm described by Property 2, which we will name DR2 (Strassen's algorithm)
def dr2_multiplication(matrix, other):
    n = len(matrix)

    # Base case for recursion: if the matrix size is 8, directly calculate the product
    if n <= 16:
        return traditional_multiplication(matrix, other)

    m = n // 2

    # Divide matrices into submatrices (no slicing for recursive call)
    A11 = matrix[:m, :m]
    A12 = matrix[:m, m:]
    A21 = matrix[m:, :m]
    A22 = matrix[m:, m:]
    B11 = other[:m, :m]
    B12 = other[:m, m:]
    B21 = other[m:, :m]
    B22 = other[m:, m:]

    # Recursively calculate the Strassen's products
    M = dr2_multiplication(A11 + A22, B11 + B22)
    N = dr2_multiplication(A21 + A22, B11)
    O = dr2_multiplication(A11, B12 - B22)
    P = dr2_multiplication(A22, B21 - B11)
    Q = dr2_multiplication(A11 + A12, B22)
    R = dr2_multiplication(A21 - A11, B11 + B12)
    S = dr2_multiplication(A12 - A22, B21 + B22)

    # Combine the results to get the final matrix
    C11 = M + P - Q + S
    C12 = O + Q
    C21 = N + P
    C22 = M + O - N + R

    C = np.block([[C11, C12], [C21, C22]])
    return C


# Measure execution time for the given algorithm
def measure_time_ms(algorithm, matrix, other):
    start = datetime.datetime.now()
    algorithm(matrix, other)
    end = datetime.datetime.now()
    return int((end - start).total_seconds() * 1000)


def main():
    # Create a CSV file to store the results
    os.makedirs(DATA_DIR, exist_ok=True)
    file_path = os.path.join(DATA_DIR, "results.csv")

    for size in MATRIX_SIZE:
        m1 = generate_matrix(size)
        m2 = generate_matrix(size)

        print(f"Matrix size: {size}x{size}")

        print("Calculating time for traditional ...")
        traditional_time = measure_time_ms(traditional_multiplication, m1, m2)
        print(f"Traditional: {traditional_time}ms")

        print("Calculating time for DR1 ...")
        dr1_time = measure_time_ms(dr1_multiplication, m1, m2)
        print(f"Property 1: {dr1_time}ms")

        print("Calculating time for DR2 ...")
        dr2_time = measure_time_ms(dr2_multiplication, m1, m2)
        print(f"Property 2: {dr2_time}ms")

        # Save results to CSV
        print(f"Writing results to disk ...")
        with open(file_path, "a", newline="") as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow([size, traditional_time, dr1_time, dr2_time])

        print(f"OK.")


if __name__ == "__main__":
    main()
