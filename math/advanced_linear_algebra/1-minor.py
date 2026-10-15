#!/usr/bin/env python3
"""Module for calculating the minor matrix of a matrix."""


def minor(matrix):
    """Calculate the minor matrix of a matrix.

    Args:
        matrix: A list of lists whose minor matrix should be calculated.

    Returns:
        The minor matrix of matrix.

    Raises:
        TypeError: If matrix is not a list of lists.
        ValueError: If matrix is not a non-empty square matrix.
    """
    if not isinstance(matrix, list) or not all(
            isinstance(row, list) for row in matrix):
        raise TypeError("matrix must be a list of lists")

    if len(matrix) == 0 or not all(
            len(row) == len(matrix) for row in matrix):
        raise ValueError("matrix must be a non-empty square matrix")

    n = len(matrix)

    if n == 1:
        return [[1]]

    minor_matrix = []
    for i in range(n):
        minor_row = []
        for j in range(n):
            sub_matrix = []
            for r in range(n):
                if r != i:
                    row = []
                    for c in range(n):
                        if c != j:
                            row.append(matrix[r][c])
                    sub_matrix.append(row)
            minor_row.append(_determinant(sub_matrix))
        minor_matrix.append(minor_row)

    return minor_matrix


def _determinant(matrix):
    """Calculate determinant of a small matrix (helper)."""
    n = len(matrix)
    if n == 1:
        return matrix[0][0]
    if n == 2:
        return matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0]
    det = 0
    for j in range(n):
        sub = []
        for i in range(1, n):
            row = []
            for k in range(n):
                if k != j:
                    row.append(matrix[i][k])
            sub.append(row)
        det += ((-1) ** j) * matrix[0][j] * _determinant(sub)
    return det