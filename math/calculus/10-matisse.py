#!/usr/bin/env python3
"""Module that computes the derivative of a polynomial."""


def poly_derivative(poly):
    """Calculate the derivative of a polynomial.

    Args:
        poly: A list of coefficients where index = power of x.

    Returns:
        A new list of coefficients for the derivative, [0] if the
        derivative is zero, or None if poly is not valid.
    """
    if not isinstance(poly, list) or len(poly) == 0:
        return None
    for coef in poly:
        if not isinstance(coef, (int, float)) or isinstance(coef, bool):
            return None

    if len(poly) == 1:
        return [0]

    derivative = []
    for power in range(1, len(poly)):
        derivative.append(poly[power] * power)

    while len(derivative) > 1 and derivative[-1] == 0:
        derivative.pop()

    if len(derivative) == 0:
        return [0]

    return derivative
