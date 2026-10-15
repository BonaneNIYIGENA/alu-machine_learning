#!/usr/bin/env python3
"""Module for calculating the inverse of a matrix."""


def inverse(matrix):
    """Calculate the inverse of a matrix.

    Args:
        matrix: A list of lists whose inverse should be calculated.

    Returns:
        The inverse of matrix, or None if matrix is singular.

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

    det = _determinant(matrix)
    if det == 0:
        return None

    if n == 1:
        return [[1.0 / matrix[0][0]]]

    adj = _adjugate(matrix)

    inv = []
    for i in range(n):
        row = []
        for j in range(n):
            row.append(adj[i][j] / det)
        inv.append(row)

    return inv


def _adjugate(matrix):
    """Calculate the adjugate matrix (helper)."""
    n = len(matrix)
    cof = _cofactor(matrix)
    adj = []
    for i in range(n):
        row = []
        for j in range(n):
            row.append(cof[j][i])
        adj.append(row)
    return adj


def _cofactor(matrix):
    """Calculate the cofactor matrix (helper)."""
    n = len(matrix)
    cof_matrix = []
    for i in range(n):
        cof_row = []
        for j in range(n):
            sub_matrix = []
            for r in range(n):
                if r != i:
                    row = []
                    for c in range(n):
                        if c != j:
                            row.append(matrix[r][c])
                    sub_matrix.append(row)
            sign = (-1) ** (i + j)
            cof_row.append(sign * _determinant(sub_matrix))
        cof_matrix.append(cof_row)
    return cof_matrix


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
