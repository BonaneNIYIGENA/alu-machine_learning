#!/usr/bin/env python3
"""Module that computes the integral of a polynomial."""


def poly_integral(poly, C=0):
    """Calculate the integral of a polynomial.

    Args:
        poly: A list of coefficients where index = power of x.
        C: An integer representing the integration constant.

    Returns:
        A new list of coefficients for the integral, or None if invalid.
    """
    if not isinstance(poly, list) or len(poly) == 0:
        return None
    if not isinstance(C, int) or isinstance(C, bool):
        return None
    for coef in poly:
        if not isinstance(coef, (int, float)) or isinstance(coef, bool):
            return None

    integral = [C]
    for power, coef in enumerate(poly):
        value = coef / (power + 1)
        if value == int(value):
            value = int(value)
        integral.append(value)

    while len(integral) > 1 and integral[-1] == 0:
        integral.pop()

    return integral
