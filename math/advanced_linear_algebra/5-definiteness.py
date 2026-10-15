#!/usr/bin/env python3
"""Module for calculating the definiteness of a matrix."""
import numpy as np


def definiteness(matrix):
    """Calculate the definiteness of a matrix.

    Args:
        matrix: A numpy.ndarray of shape (n, n) whose definiteness
                should be calculated.

    Returns:
        A string describing the definiteness, or None.

    Raises:
        TypeError: If matrix is not a numpy.ndarray.
    """
    if not isinstance(matrix, np.ndarray):
        raise TypeError("matrix must be a numpy.ndarray")

    if matrix.size == 0:
        return None

    if matrix.ndim != 2:
        return None

    n, m = matrix.shape
    if n != m:
        return None

    # Check symmetry
    if not np.allclose(matrix, matrix.T):
        return None

    eigenvalues = np.linalg.eigvals(matrix)
    eigenvalues = np.real(eigenvalues)

    tol = 1e-10

    all_pos = np.all(eigenvalues > tol)
    all_non_neg = np.all(eigenvalues >= -tol)
    all_neg = np.all(eigenvalues < -tol)
    all_non_pos = np.all(eigenvalues <= tol)

    if all_pos:
        return "Positive definite"
    if all_non_neg and not all_pos:
        return "Positive semi-definite"
    if all_neg:
        return "Negative definite"
    if all_non_pos and not all_neg:
        return "Negative semi-definite"
    if np.any(eigenvalues > tol) and np.any(eigenvalues < -tol):
        return "Indefinite"

    return None