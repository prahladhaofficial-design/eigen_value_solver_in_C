# Main


EIGEN VALUES 1
Eigen values of a matrix
Eigenvalues are scalars that provide insight into the properties of a matrix, particularly
in relation to how it acts on vectors. When a matrix acts on an eigenvector, the output is
simply a scaled version of the original eigenvector. The eigenvalue is the factor by which
the eigenvector is scaled.
So a square matrix A, an eigenvalue  and its corresponding eigenvector v satisfy the
following equation:
Av = v
Where:
 A is an n  n square matrix,
 v is an eigenvector (a non-zero vector),
  is the eigenvalue (a scalar).
Finding eigen values(general process)
To find the eigenvalues of a matrix, we need to solve the characteristic equation:
det(A  I) = 0
The equation det(A  I) = 0 is called the characteristic equation, and solving it gives
the eigenvalues  ,  , . . . ,  .
1 2 n
Geometric Interpretation
 Eigenvectors represent directions that are invariant under the matrix transformation.
 Eigenvalues represent the scaling factor along those directions.
For example:
 If A represents a transformation that rotates vectors, then the eigenvalues are typically
complex numbers (if the rotation isnt just a scaling).
 If A represents a scaling transformation, the eigenvalues are real numbers that describe
the scaling factor in the direction of the corresponding eigenvectors.
Types of Eigenvalues
 Real Eigenvalues: For symmetric matrices, the eigenvalues are always real numbers.
 Complex Eigenvalues: For non-symmetric matrices, the eigenvalues can be complex
numbers. A matrix may have complex eigenvalues if it represents a rotation or some
non-diagonalizable transformation.
 Positive and Negative Eigenvalues:
 Positive eigenvalues indicate a scaling in the same direction as the eigenvector.
 Negative eigenvalues indicate a reflection in addition to scaling.


2
 Zero Eigenvalues: If a matrix has a zero eigenvalue, it is singular, meaning it does
not have an inverse. This indicates that the transformation reduces the dimension of
the vector space (e.g., it squashes vectors into a lower-dimensional subspace).
Here we will see an algorithm for computing eigen values
Jacobi algorithm
 Gurantees for real symmetric matrices.
 Gurantees for non-real symmetric hermitian matrices.
 Not gurantees for non-real symmetric non hermitian matrices.
In this method we will apply some sort of similarity transformations on the given matrix
such that after a sequence of a similarity transformations the matrix convert into a
diagonal matrix and from the diagonal matrix we can see the eigenvalue directly as
the diagonal element. Furthermore the sequence will contain the information about the
eigenvectors of the matrix. This gives a guarantee for finding the eigenvalues of real
symmetric matrices as well as the eigenvectors for the real symmetric matrix.
A 2  2 rotation matrix with angle  is given by:
(cid:34) (cid:35)
cos   sin
R() =
sin  cos
An n  n rotation matrix J(p, q, ) has the form:

J(p, q, ) =
 . . .
c
s
o
in
. . .
s


. .


.


co
s
. .
. . .
i
s
n
.


Here, cos  and sin  terms appear in the pth and qth rows and columns, and all other
elements are zero.
The matrix J(p, q, ) is known as Jacobias rotation. The matrix J(p, q, ) is applied
to symmetric matrix A as a similarity transformation which rotates row and column p
and q of A through an angle  so that (p, q) and (q, p) entries become zero.Think of
the Jacobi rotation as rotating the axes corresponding to rows p and q in a way that
aligns the matrix to progressively eliminate off diagonal elements while preserving its
eigenvalues. So let us denote this similarity transformation as:
A = JT AJ,
where A is the transformed matrix.
The relation between the elements of matrix A and A are given by the formulas:


3
a jp = ca jp  sa when j (cid:44) p and j (cid:44) q
jq
a jq = sa jp + ca when j (cid:44) p and j (cid:44) q
jq
a pp = c2app + s2a  2csa
qq pq
aqq = s2app + c2a + 2csa
qq pq
a pq = (c2  s2)apq + cs(a  a )
pp qq
As we want to make the off-diagonal element of the new matrix A zero, we can write
that condition:
(c2  s2)a + cs(a  a = 0)
pq pp qq
Here c = cos  and s = sin , thus if a (cid:44) 0, then the above condition gives us
pq
(c2  s2) (a  a )
cot 2 = = qq pp
2cs 2a
pq
Hence the value of the  from the above equation is given as:
1 2cs
 = tan1( )
2 c2  s2
and hence the angle for the similarity transformation can be derived. The value of c and
s will be given by the formula as
1
c =  and s = c  t
1 + t2
If we are doing with the hermitian matrix with the complex numbers then  is calculated
using real parts and c = cos  + i sin  and = ic
Following steps are adopted in the Jacobi method
 Find the pth and qth row and column which correspond to the off-diagonal element
having the highest value.(Because These large elements have the most significant
effect on the matrixs non-diagonal structure, meaning they contribute most to the
non-diagonal-ness of the matrix. By focusing on the largest off-diagonal element,
we can maximize the correction that each rotation makes, improving convergence
speed.)
 Compute the Jacobi matrix after calculating the angle of similarity rotation.
 Apply the Jacobi matrix to the matrix as in the way mentioned above.
 Repeat the process until the matrix is converted completely into a diagonal matrix.
The diagonal elements will be the eigenvalues.
 The eigenvectors will be the columns of the Jacobi matrix.
Writing C code
 This code gives the eigen values for real symmetric matries.
 This code uses Jacobi algorithm.


4
 we can make function for calculating or diagonalizing the matrix, hence diagnol
elements are eigen values.
 we will write the above equation in this function.
 Also in this function we will update a matrix in each iteration for storing eigen
vectors.
 also a function for printing eigen vectors.
The C code
#include <stdio.h>
1
#include <stdlib.h>
2
#include <math.h>
3
4
#define limit 1e-9
5
#define maxiter 100
6
7
void eigenvalues(double *A, double *V, int n) {
8
int iterations = 0;
9
double max;
10
11
do {
12
max = 0.0;
13
int p, q;
14
for (int i = 0; i < n - 1; i++) {
15
for (int j = i + 1; j < n; j++) {
16
if (fabs(A[i * n + j]) > max) {
17
max = fabs(A[i * n + j]);
18
p = i;
19
q = j;
20
}
21
}
22
}
23
24
if (max < limit) {
25
break;
26
}
27
double theta = 0.5 * atan2(2 * A[p * n + q], A[q * n + q] -
28
A[p * n + p]);
double c = cos(theta);
29
double s = sin(theta);
30
double App = A[p * n + p];
31
double Aqq = A[q * n + q];
32
double Apq = A[p * n + q];
33
34
A[p * n + p] = c * c * App + s * s * Aqq - 2 * s * c * Apq;
35


5
A[q * n + q] = s * s * App + c * c * Aqq + 2 * s * c * Apq;
36
A[p * n + q] = A[q * n + p] = 0.0;
37
for (int i = 0; i < n; i++) {
38
if (i != p && i != q) {
39
double Aip = A[i * n + p];
40
double Aiq = A[i * n + q];
41
A[i * n + p] = A[p * n + i] = c * Aip - s * Aiq;
42
A[i * n + q] = A[q * n + i] = s * Aip + c * Aiq;
43
}
44
double Vip = V[i * n + p];
45
double Viq = V[i * n + q];
46
V[i * n + p] = c * Vip - s * Viq;
47
V[i * n + q] = s * Vip + c * Viq;
48
}
49
iterations++;
50
} while (max > limit && iterations < maxiter);
51
52
if (iterations >= maxiter) {
53
printf("Maximum iterations reached without full
54
convergence.\n");
}
55
}
56
57
void printMatrix(double *matrix, int n) {
58
for (int i = 0; i < n; i++) {
59
for (int j = 0; j < n; j++) {
60
printf("%lf ", matrix[i * n + j]);
61
}
62
printf("\n");
63
}
64
}
65
66
int main() {
67
int n;
68
printf("Enter the dimension of the matrix: ");
69
scanf("%d", &n);
70
double *A = (double *)malloc(n * n * sizeof(double));
71
double *V = (double *)malloc(n * n * sizeof(double));
72
printf("Enter the elements of the %dx%d symmetric matrix:\n", n,
73
n);
for (int i = 0; i < n; i++) {
74
for (int j = 0; j < n; j++) {
75
scanf("%lf", &A[i * n + j]);
76
if (i == j) {
77
V[i * n + j] = 1.0;
78


6
} else {
79
V[i * n + j] = 0.0;
80
}
81
}
82
}
83
84
eigenvalues(A, V, n);
85
86
printf("Eigenvalues:\n");
87
for (int i = 0; i < n; i++) {
88
printf("%lf ", A[i * n + i]);
89
}
90
printf("\n\nEigenvectors:\n");
91
printMatrix(V, n);
92
free(A);
93
free(V);
94
return 0;
95
}
96
The above code works for real real symmetric matrices.
If we want to do for hermitian matrices also then replace include complex.h library and
use c and s as stated above and with slight modification in the code.
INPUT-Format
suppose you want give the 2 by 2 matrix then give input as 1 2 3 4 where 1,2,3,4
are elements of the matrix of corresponding rows.simply write the each row one after
another.
TIME-COMPLEXITY
1. Finding the Largest Off-Diagonal Element
This part of the code iterates over the upper triangle of the matrix to find the largest
off-diagonal element. For an n  n matrix, the number of off-diagonal elements is
approximately n(n1) . In each iteration of the algorithm, we scan all these elements to
2
find the largest one. Therefore, the time complexity for finding the largest off-diagonal
element is:
O(n2) for each iteration.
2. Rotation and Matrix Updates
After identifying the largest off-diagonal element, the algorithm updates the matrix
elements (the A matrix and the V matrix). The updates for the matrix involve looping
over the matrix to apply the Jacobi rotation formula. This involves two nested loops over
the matrix, resulting in a time complexity of:
O(n2) for each rotation.
3. Number of Iterations; The Jacobi algorithm iterates until convergence (when the


7
largest off-diagonal element becomes smaller than a threshold, , or the maximum
number of iterations is reached). In the worst case, the number of iterations required
for convergence can be up to O(n2), although generally, the number of iterations is often
much smaller. Hence, the total number of iterations is at most:
O(n2).
Total Time Complexity;
Now, combining these factors:
- In each iteration of the Jacobi method, we perform O(n2) operations for both finding
the largest off-diagonal element and updating the matrix.
- The number of iterations is O(n2) in the worst case.
Thus, the overall time complexity of the Jacobi eigenvalue algorithm in this code is:
O(n4).
The algorithms time complexity grows rapidly with the size of the matrix, making it
less efficient for very large matrices compared to other eigenvalue algorithms like the
QR decomposition or Divide-and-Conquer methods.
So if you want to make it more efficient use the QR decomposition or Divide-and-Conquer
method.
Different Algorithms - Comparison
Characteristic Polynomial Method
This method can be applied to any matrix for eigenvalues, but it becomes computa-
tionally tough for large matrices. Additionally, it provides less accurate answers and is
numerically unstable for larger matrices.
QR Algorithm
This is applicable to all types of matrices and is numerically stable. However, it is
computationally intensive for large matrices and not suitable for sparse matrices.
Jacobi Method
This method gives accurate answers for real symmetric and Hermitian matrices.
However, it is also computationally expensive, and its convergence rate is low.
Divide and Conquer Method
This method is efficient for symmetric matrices but not suitable for other types of
matrices. Additionally, it is challenging to handle.
Lanczos Method
This method is efficient for large sparse matrices and is more memory-efficient
compared to other methods. However, it is also restricted to symmetric matrices.
conclusion: We will prefer the method based on our matrix.
