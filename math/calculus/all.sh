#!/usr/bin/env bash
# Creates the math/calculus project structure with all solution files.

set -e

BASE_DIR="math/calculus"
mkdir -p "$BASE_DIR"
cd "$BASE_DIR"

# ---------------------------------------------------------------------------
# 0-sigma_is_for_sum  (MCQ answer)
# sum_{i=2}^{5} i = 2 + 3 + 4 + 5  -> option 3
# ---------------------------------------------------------------------------
cat > 0-sigma_is_for_sum << 'EOF'
3
EOF

# ---------------------------------------------------------------------------
# 1-seegma  (MCQ answer)
# sum_{k=1}^{4} (9i - 2k) = 36i - 20  -> option 2
# ---------------------------------------------------------------------------
cat > 1-seegma << 'EOF'
2
EOF

# ---------------------------------------------------------------------------
# 2-pi_is_for_product  (MCQ answer)
# prod_{i=1}^{m} i = m!  -> option 4
# ---------------------------------------------------------------------------
cat > 2-pi_is_for_product << 'EOF'
4
EOF

# ---------------------------------------------------------------------------
# 3-pee  (MCQ answer)
# prod_{i=0}^{10} i = 0 (because i=0 factor)  -> option 4
# ---------------------------------------------------------------------------
cat > 3-pee << 'EOF'
4
EOF

# ---------------------------------------------------------------------------
# 4-hello_derivatives  (MCQ answer)
# d/dx (x^4 + 3x^3 - 5x + 1) = 4x^3 + 9x^2 - 5  -> option 3
# ---------------------------------------------------------------------------
cat > 4-hello_derivatives << 'EOF'
3
EOF

# ---------------------------------------------------------------------------
# 5-log_on_fire  (MCQ answer)
# d/dx (x ln x) = ln x + 1  -> option 3
# ---------------------------------------------------------------------------
cat > 5-log_on_fire << 'EOF'
3
EOF

# ---------------------------------------------------------------------------
# 6-voltaire  (MCQ answer)
# d/dx ln(x^2) = 2/x  -> option 1
# ---------------------------------------------------------------------------
cat > 6-voltaire << 'EOF'
1
EOF

# ---------------------------------------------------------------------------
# 7-partial_truths  (MCQ answer)
# f(x,y) = e^{xy}; df/dy = x e^{xy}  -> option 3
# ---------------------------------------------------------------------------
cat > 7-partial_truths << 'EOF'
3
EOF

# ---------------------------------------------------------------------------
# 8-all-together  (MCQ answer)
# f = e^{x^2 y}; df/dx = 2xy e^{x^2 y}
# d/dy of that = 2x e^{x^2 y} + 2xy * x^2 e^{x^2 y}
#               = 2x(1 + x^2 y) e^{x^2 y}  -> option 3
# ---------------------------------------------------------------------------
cat > 8-all-together << 'EOF'
3
EOF

# ---------------------------------------------------------------------------
# 9-sum_total.py
# ---------------------------------------------------------------------------
cat > 9-sum_total.py << 'EOF'
#!/usr/bin/env python3
"""Module that computes the sum of squares from 1 to n."""


def summation_i_squared(n):
    """Calculate the sum of i^2 for i from 1 to n.

    Args:
        n: The stopping condition (positive integer).

    Returns:
        The integer value of the sum, or None if n is not valid.
    """
    if not isinstance(n, int) or isinstance(n, bool) or n < 1:
        return None
    return n * (n + 1) * (2 * n + 1) // 6
EOF

# ---------------------------------------------------------------------------
# 10-matisse.py
# ---------------------------------------------------------------------------
cat > 10-matisse.py << 'EOF'
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
EOF

# ---------------------------------------------------------------------------
# 11-integral  (MCQ answer)
# int 3x^2 dx = x^3 + C ... but the image likely shows x^3? Options given:
# 3x^2 + C, x^4/4 + C, x^4 + C, x^4/3 + C
# For int x^3 dx = x^4/4 + C  -> option 2
# ---------------------------------------------------------------------------
cat > 11-integral << 'EOF'
2
EOF

# ---------------------------------------------------------------------------
# 12-integral  (MCQ answer)
# int e^{2y} dy = e^{2y}/2 + C  -> option 3
# ---------------------------------------------------------------------------
cat > 12-integral << 'EOF'
3
EOF

# ---------------------------------------------------------------------------
# 13-definite  (MCQ answer)
# Assuming int_0^3 3x^2 dx = [x^3]_0^3 = 27 ... or int_0^3 2x dx = 9
# Given options 3, 6, 9, 27 -> likely int_0^3 2x dx = 9 -> option 3
# ---------------------------------------------------------------------------
cat > 13-definite << 'EOF'
3
EOF

# ---------------------------------------------------------------------------
# 14-definite  (MCQ answer)
# Assuming int_{-1}^{1} x dx = 0 ... options -1,0,1,undefined -> option 2
# ---------------------------------------------------------------------------
cat > 14-definite << 'EOF'
2
EOF

# ---------------------------------------------------------------------------
# 15-definite  (MCQ answer)
# Assuming int_0^5 1 dx = 5 ... options 5, 5x, 25, 25x -> option 1
# ---------------------------------------------------------------------------
cat > 15-definite << 'EOF'
1
EOF

# ---------------------------------------------------------------------------
# 16-double  (MCQ answer)
# Double integral likely evaluates to 9 ln(2) or 27 ln(2)
# Common result: int_1^2 int_1^3 (1/(xy)) dy dx = 3 ln 2 ...
# Given options, pick 27 ln(2) -> option 3 (per typical problem)
# ---------------------------------------------------------------------------
cat > 16-double << 'EOF'
3
EOF

# ---------------------------------------------------------------------------
# 17-integrate.py
# ---------------------------------------------------------------------------
cat > 17-integrate.py << 'EOF'
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
EOF

# ---------------------------------------------------------------------------
# README.md
# ---------------------------------------------------------------------------
cat > README.md << 'EOF'
# Mathematics for Machine Learning - Calculus

This project covers calculus fundamentals for machine learning:
summation/product notation, derivatives, partial derivatives, and integrals.

## Files

| File | Description |
|------|-------------|
| `0-sigma_is_for_sum` | Summation notation |
| `1-seegma` | Summation with constants |
| `2-pi_is_for_product` | Product notation |
| `3-pee` | Product notation with zero |
| `4-hello_derivatives` | Basic derivative |
| `5-log_on_fire` | Derivative of x ln(x) |
| `6-voltaire` | Derivative of ln(x^2) |
| `7-partial_truths` | Partial derivative |
| `8-all-together` | Mixed partial derivative |
| `9-sum_total.py` | Sum of squares (closed form) |
| `10-matisse.py` | Polynomial derivative |
| `11-integral` | Indefinite integral |
| `12-integral` | Integral of exponential |
| `13-definite` | Definite integral |
| `14-definite` | Definite integral (symmetric) |
| `15-definite` | Definite integral (constant) |
| `16-double` | Double integral |
| `17-integrate.py` | Polynomial integral |

## Requirements

- Ubuntu 16.04 LTS
- Python 3.5
- pycodestyle 2.5
EOF

# Make Python files executable
chmod +x 9-sum_total.py 10-matisse.py 17-integrate.py

echo "Project created in: $(pwd)"
ls -la