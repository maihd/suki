/**```md
 * Custom version of (datenwolf/linmath.h)[https://github.com/datenwolf/linmath.h]
 * ```
 */

#pragma once

#include <math.h>

#ifndef MATH_TYPE_DEFINED
#define MATH_TYPE_DEFINED
typedef float   quat[4];
typedef float   float2[2];
typedef float   float3[3];
typedef float   float4[4];
typedef float4  float4x4[4];
#endif

#ifdef _MSC_VER
#define MATH_FUNC static __forceinline
#elif defined(__GNUC__)
#define MATH_FUNC static __attribute__((always_inline, const)) __inline__
#else
#define MATH_FUNC static
#endif

#define VMATH_DEFINE_VECTOR(n) \
typedef float float##n[n]; \
MATH_FUNC void addf##n(float##n r, float##n const a, float##n const b) \
{ \
	int i; \
	for(i=0; i<n; ++i) \
		r[i] = a[i] + b[i]; \
} \
MATH_FUNC void subf##n##(float##n r, float##n const a, float##n const b) \
{ \
	int i; \
	for(i=0; i<n; ++i) \
		r[i] = a[i] - b[i]; \
} \
MATH_FUNC void smulf##n##(float##n r, float##n const v, float const s) \
{ \
	int i; \
	for(i=0; i<n; ++i) \
		r[i] = v[i] * s; \
} \
MATH_FUNC void mulf##n##(float##n r, float##n const a, float##n const b) \
{ \
	int i; \
	for(i=0; i<n; ++i) \
		r[i] = a[i] * b[i]; \
} \
MATH_FUNC float imulf##n##(float##n const a, float##n const b) \
{ \
	float p = 0.0f; \
	int i; \
	for(i=0; i<n; ++i) \
		p += b[i]*a[i]; \
	return p; \
} \
MATH_FUNC float lenf##n(float##n const v) \
{ \
	return sqrtf(imulf##n(v,v)); \
} \
MATH_FUNC void normf##n(float##n r, float##n const v) \
{ \
	float k = 1.0f / lenf##n(v); \
	smulf##n(r, v, k); \
} \
MATH_FUNC void minf##n##(float##n r, float##n const a, float##n const b) \
{ \
	int i; \
	for(i=0; i<n; ++i) \
		r[i] = a[i]<b[i] ? a[i] : b[i]; \
} \
MATH_FUNC void maxf##n##(float##n r, float##n const a, float##n const b) \
{ \
	int i; \
	for(i=0; i<n; ++i) \
		r[i] = a[i]>b[i] ? a[i] : b[i]; \
}\
MATH_FUNC void reflectf##n(float##n r, float##n const v, float##n const N)\
{\
	float p = 2.0f * imulf##n(v, N);\
    int i;\
	for (i = 0; i < n; ++i)\
    {\
		r[i] = v[i] - p * N[i];\
    }\
}

VMATH_DEFINE_VECTOR(2)
VMATH_DEFINE_VECTOR(3)
VMATH_DEFINE_VECTOR(4)

MATH_FUNC void crossf3(float3 r, float3 const a, float3 const b)
{
	r[0] = a[1] * b[2] - a[2] * b[1];
	r[1] = a[2] * b[0] - a[0] * b[2];
	r[2] = a[0] * b[1] - a[1] * b[0];
}

MATH_FUNC void crossf4(float4 r, float4 const a, float4 const b)
{
	r[0] = a[1] * b[2] - a[2] * b[1];
	r[1] = a[2] * b[0] - a[0] * b[2];
	r[2] = a[0] * b[1] - a[1] * b[0];
	r[3] = 1.f;
}

MATH_FUNC void float4x4Identity(float4x4 M)
{
	int i, j;
	for (i = 0; i < 4; ++i)
    {
		for(j = 0; j < 4; ++j)
        {
			M[i][j] = i == j ? 1.0f : 0.0f;
        }
    }
}

MATH_FUNC void float4x4Copy(float4x4 M, float4x4 const N)
{
	int i, j;
	for (i = 0; i < 4; ++i)
		for (j = 0; j < 4; ++j)
			M[i][j] = N[i][j];
}

MATH_FUNC void float4x4Row(float4 r, float4x4 const M, int i)
{
	int k;
	for(k=0; k<4; ++k)
		r[k] = M[k][i];
}

MATH_FUNC void float4x4Col(float4 r, float4x4 const M, int i)
{
	int k;
	for(k=0; k<4; ++k)
		r[k] = M[i][k];
}

MATH_FUNC void transposef4x4(float4x4 M, float4x4 N)
{
	int i, j;
	for(j=0; j<4; ++j)
		for(i=0; i<4; ++i)
			M[i][j] = N[j][i];
}

MATH_FUNC void addf4x4(float4x4 M, float4x4 a, float4x4 b)
{
	int i;
	for(i=0; i<4; ++i)
		addf4(M[i], a[i], b[i]);
}

MATH_FUNC void subf4x4(float4x4 M, float4x4 a, float4x4 b)
{
	int i;
	for(i=0; i<4; ++i)
		subf4(M[i], a[i], b[i]);
}

MATH_FUNC void smulf4x4(float4x4 M, float4x4 a, float k)
{
	int i;
	for(i=0; i<4; ++i)
		smulf4(M[i], a[i], k);
}

MATH_FUNC void mulf4x4(float4x4 M, float4x4 a, float4x4 b)
{
	float4x4 temp;
	int k, r, c;
	for(c = 0; c < 4; ++c) 
    {
        for(r = 0; r < 4; ++r) 
        {
            temp[c][r] = 0.f;
		    for(k = 0; k < 4; ++k)
            {
			    temp[c][r] += a[k][r] * b[c][k];
            }
	    }
    }
		
	float4x4Copy(M, temp);
}

MATH_FUNC void mulf4x4_f4(float4 r, float4x4 M, float4 v)
{
	int i, j;
	for(j=0; j<4; ++j) {
		r[j] = 0.f;
		for(i=0; i<4; ++i)
			r[j] += M[i][j] * v[i];
	}
}

MATH_FUNC void translatef4x4(float4x4 M, float x, float y, float z)
{
	float4 t = {x, y, z, 0};
	float4 r;
	int i;

	for (i = 0; i < 4; ++i) 
    {
		float4x4Row(r, M, i);
		M[3][i] += imulf4(r, t);
	}
}

MATH_FUNC void invertf4x4(float4x4 T, float4x4 M)
{
	float s[6];
	float c[6];
	s[0] = M[0][0]*M[1][1] - M[1][0]*M[0][1];
	s[1] = M[0][0]*M[1][2] - M[1][0]*M[0][2];
	s[2] = M[0][0]*M[1][3] - M[1][0]*M[0][3];
	s[3] = M[0][1]*M[1][2] - M[1][1]*M[0][2];
	s[4] = M[0][1]*M[1][3] - M[1][1]*M[0][3];
	s[5] = M[0][2]*M[1][3] - M[1][2]*M[0][3];

	c[0] = M[2][0]*M[3][1] - M[3][0]*M[2][1];
	c[1] = M[2][0]*M[3][2] - M[3][0]*M[2][2];
	c[2] = M[2][0]*M[3][3] - M[3][0]*M[2][3];
	c[3] = M[2][1]*M[3][2] - M[3][1]*M[2][2];
	c[4] = M[2][1]*M[3][3] - M[3][1]*M[2][3];
	c[5] = M[2][2]*M[3][3] - M[3][2]*M[2][3];
	
	/* Assumes it is invertible */
	float idet = 1.0f/( s[0]*c[5]-s[1]*c[4]+s[2]*c[3]+s[3]*c[2]-s[4]*c[1]+s[5]*c[0] );
	
	T[0][0] = ( M[1][1] * c[5] - M[1][2] * c[4] + M[1][3] * c[3]) * idet;
	T[0][1] = (-M[0][1] * c[5] + M[0][2] * c[4] - M[0][3] * c[3]) * idet;
	T[0][2] = ( M[3][1] * s[5] - M[3][2] * s[4] + M[3][3] * s[3]) * idet;
	T[0][3] = (-M[2][1] * s[5] + M[2][2] * s[4] - M[2][3] * s[3]) * idet;

	T[1][0] = (-M[1][0] * c[5] + M[1][2] * c[2] - M[1][3] * c[1]) * idet;
	T[1][1] = ( M[0][0] * c[5] - M[0][2] * c[2] + M[0][3] * c[1]) * idet;
	T[1][2] = (-M[3][0] * s[5] + M[3][2] * s[2] - M[3][3] * s[1]) * idet;
	T[1][3] = ( M[2][0] * s[5] - M[2][2] * s[2] + M[2][3] * s[1]) * idet;

	T[2][0] = ( M[1][0] * c[4] - M[1][1] * c[2] + M[1][3] * c[0]) * idet;
	T[2][1] = (-M[0][0] * c[4] + M[0][1] * c[2] - M[0][3] * c[0]) * idet;
	T[2][2] = ( M[3][0] * s[4] - M[3][1] * s[2] + M[3][3] * s[0]) * idet;
	T[2][3] = (-M[2][0] * s[4] + M[2][1] * s[2] - M[2][3] * s[0]) * idet;

	T[3][0] = (-M[1][0] * c[3] + M[1][1] * c[1] - M[1][2] * c[0]) * idet;
	T[3][1] = ( M[0][0] * c[3] - M[0][1] * c[1] + M[0][2] * c[0]) * idet;
	T[3][2] = (-M[3][0] * s[3] + M[3][1] * s[1] - M[3][2] * s[0]) * idet;
	T[3][3] = ( M[2][0] * s[3] - M[2][1] * s[1] + M[2][2] * s[0]) * idet;
}

MATH_FUNC void float4x4Scale(float4x4 M, float4x4 a, float x, float y, float z)
{
	int i;
	smulf4(M[0], a[0], x);
	smulf4(M[1], a[1], y);
	smulf4(M[2], a[2], z);
	for (i = 0; i < 4; ++i) 
    {
		M[3][i] = a[3][i];
	}
}

MATH_FUNC void float4x4Translate(float4x4 T, float x, float y, float z)
{
	float4x4Identity(T);
	T[3][0] = x;
	T[3][1] = y;
	T[3][2] = z;
}

MATH_FUNC void float4x4FromFloat3MulOuter(float4x4 M, float3 const a, float3 const b)
{
	int i, j;
	for(i=0; i<4; ++i) for(j=0; j<4; ++j)
		M[i][j] = i<3 && j<3 ? a[i] * b[j] : 0.f;
}

MATH_FUNC void float4x4Rotate(float4x4 R, float4x4 M, float x, float y, float z, float angle)
{
	float s = sinf(angle);
	float c = cosf(angle);
	float3 u = {x, y, z};

	if (lenf3(u) > 1e-4) 
    {
		normf3(u, u);
		float4x4 T;
		float4x4FromFloat3MulOuter(T, u, u);

		float4x4 S = {
			{    0,  u[2], -u[1], 0},
			{-u[2],     0,  u[0], 0},
			{ u[1], -u[0],     0, 0},
			{    0,     0,     0, 0}
		};
		smulf4x4(S, S, s);

		float4x4 C;
		float4x4Identity(C);
		subf4x4(C, C, T);

		smulf4x4(C, C, c);

		addf4x4(T, T, C);
		addf4x4(T, T, S);

		T[3][3] = 1.;		
		mulf4x4(R, M, T);
	} 
    else 
    {
		float4x4Copy(R, M);
	}
}

MATH_FUNC void float4x4RotateX(float4x4 Q, float4x4 M, float angle)
{
	float s = sinf(angle);
	float c = cosf(angle);
	float4x4 R = {
		{1.f, 0.f, 0.f, 0.f},
		{0.f,   c,   s, 0.f},
		{0.f,  -s,   c, 0.f},
		{0.f, 0.f, 0.f, 1.f}
	};
	mulf4x4(Q, M, R);
}

MATH_FUNC void float4x4RotateY(float4x4 Q, float4x4 M, float angle)
{
	float s = sinf(angle);
	float c = cosf(angle);
	float4x4 R = {
		{   c, 0.f,   s, 0.f},
		{ 0.f, 1.f, 0.f, 0.f},
		{  -s, 0.f,   c, 0.f},
		{ 0.f, 0.f, 0.f, 1.f}
	};
	mulf4x4(Q, M, R);
}

MATH_FUNC void float4x4RotateZ(float4x4 Q, float4x4 M, float angle)
{
	float s = sinf(angle);
	float c = cosf(angle);
	float4x4 R = {
		{   c,   s, 0.f, 0.f},
		{  -s,   c, 0.f, 0.f},
		{ 0.f, 0.f, 1.f, 0.f},
		{ 0.f, 0.f, 0.f, 1.f}
	};
	mulf4x4(Q, M, R);
}

MATH_FUNC void float4x4OrthoNormalize(float4x4 R, float4x4 const M)
{
	float4x4Copy(R, M);
	float s = 1.;
	float3 h;

	normf3(R[2], R[2]);
	
	s = imulf3(R[1], R[2]);
	smulf3(h, R[2], s);
	subf3(R[1], R[1], h);
	normf3(R[1], R[1]);

	s = imulf3(R[0], R[2]);
	smulf3(h, R[2], s);
	subf3(R[0], R[0], h);

	s = imulf3(R[0], R[1]);
	smulf3(h, R[1], s);
	subf3(R[0], R[0], h);
	normf3(R[0], R[0]);
}

MATH_FUNC void float4x4Frustum(float4x4 M, float l, float r, float b, float t, float n, float f)
{
	M[0][0] = 2.0f * n / (r - l);
	M[0][1] = M[0][2] = M[0][3] = 0.f;
	
	M[1][1] = 2.0f * n / (t - b);
	M[1][0] = M[1][2] = M[1][3] = 0.f;

	M[2][0] = (r+l)/(r-l);
	M[2][1] = (t+b)/(t-b);
	M[2][2] = -(f+n)/(f-n);
	M[2][3] = -1.f;
	
	M[3][2] = -2.f*(f*n)/(f-n);
	M[3][0] = M[3][1] = M[3][3] = 0.f;
}

MATH_FUNC void float4x4Ortho(float4x4 M, float l, float r, float b, float t, float n, float f)
{
	M[0][0] = 2.f/(r - l);
	M[0][1] = M[0][2] = M[0][3] = 0.f;

	M[1][1] = 2.f/(t - b);
	M[1][0] = M[1][2] = M[1][3] = 0.f;

	M[2][2] = -2.f/(f - n);
	M[2][0] = M[2][1] = M[2][3] = 0.f;
	
	M[3][0] = -(r + l) / (r - l);
	M[3][1] = -(t + b) / (t - b);
	M[3][2] = -(f + n) / (f - n);
	M[3][3] = 1.f;
}

MATH_FUNC void float4x4Perspective(float4x4 m, float y_fov, float aspect, float n, float f)
{
	/* NOTE: Degrees are an unhandy unit to work with.
	 * linmath.h uses radians for everything! */
	float const a = 1.f / tanf(y_fov / 2.f);

	m[0][0] = a / aspect;
	m[0][1] = 0.f;
	m[0][2] = 0.f;
	m[0][3] = 0.f;

	m[1][0] = 0.f;
	m[1][1] = a;
	m[1][2] = 0.f;
	m[1][3] = 0.f;

	m[2][0] = 0.f;
	m[2][1] = 0.f;
	m[2][2] = -((f + n) / (f - n));
	m[2][3] = -1.f;

	m[3][0] = 0.f;
	m[3][1] = 0.f;
	m[3][2] = -((2.f * f * n) / (f - n));
	m[3][3] = 0.f;
}

MATH_FUNC void float4x4LookAt(float4x4 m, float3 const eye, float3 const center, float3 const up)
{
	/* Adapted from Android's OpenGL Matrix.java.                        */
	/* See the OpenGL GLUT documentation for gluLookAt for a description */
	/* of the algorithm. We implement it in a straightforward way:       */

	/* TODO: The negation of of can be spared by swapping the order of
	 *       operands in the following cross products in the right way. */
	float3 f;
	subf3(f, center, eye);	
	normf3(f, f);	
	
	float3 s;
	crossf3(s, f, up);
	normf3(s, s);

	float3 t;
	crossf3(t, s, f);

	m[0][0] =  s[0];
	m[0][1] =  t[0];
	m[0][2] = -f[0];
	m[0][3] =  0.0f;

	m[1][0] =  s[1];
	m[1][1] =  t[1];
	m[1][2] = -f[1];
	m[1][3] =  0.0f;

	m[2][0] =  s[2];
	m[2][1] =  t[2];
	m[2][2] = -f[2];
	m[2][3] =  0.0f;

	m[3][0] =  0.0f;
	m[3][1] =  0.0f;
	m[3][2] =  0.0f;
	m[3][3] =  1.0f;

	translatef4x4(m, -eye[0], -eye[1], -eye[2]);
}

MATH_FUNC void quatIdentity(quat q)
{
	q[0] = q[1] = q[2] = 0.f;
	q[3] = 1.f;
}

MATH_FUNC void addq(quat r, quat a, quat b)
{
	int i;
	for(i=0; i<4; ++i)
		r[i] = a[i] + b[i];
}

MATH_FUNC void subq(quat r, quat a, quat b)
{
	int i;
	for(i=0; i<4; ++i)
		r[i] = a[i] - b[i];
}

MATH_FUNC void mulq(quat r, quat p, quat q)
{
	float3 w;
	crossf3(r, p, q);
	smulf3(w, p, q[3]);
	addf3(r, r, w);
	smulf3(w, q, p[3]);
	addf3(r, r, w);
	r[3] = p[3]*q[3] - imulf3(p, q);
}

MATH_FUNC void smulq(quat r, quat v, float s)
{
	int i;
	for(i=0; i<4; ++i)
		r[i] = v[i] * s;
}

MATH_FUNC float imulq(quat a, quat b)
{
	float p = 0.f;
	int i;
	for(i=0; i<4; ++i)
		p += b[i]*a[i];
	return p;
}

MATH_FUNC void conjq(quat r, quat q)
{
	int i;
	for(i=0; i<3; ++i)
		r[i] = -q[i];
	r[3] = q[3];
}

MATH_FUNC void quatAxisAngle(quat r, float angle, float3 const axis) {
	float3 v;
	smulf3(v, axis, sinf(angle / 2));
	int i;
	for(i=0; i<3; ++i)
		r[i] = v[i];
	r[3] = cosf(angle / 2);
}

#define quat_norm vec4_norm
MATH_FUNC void mulq_f3(float3 r, quat const q, float3 const v)
{
    /*
    * Method by Fabian 'ryg' Giessen (of Farbrausch)
    t = 2 * cross(q.xyz, v)
    v' = v + q.w * t + cross(q.xyz, t)
    */
	float3 t;
	float3 q_xyz = {q[0], q[1], q[2]};
	float3 u = {q[0], q[1], q[2]};

	crossf3(t, q_xyz, v);
	smulf3(t, t, 2);

	crossf3(u, q_xyz, t);
	smulf3(t, t, q[3]);

	addf3(r, v, t);
	addf3(r, r, u);
}

MATH_FUNC void float4x4FromQuaternion(float4x4 M, quat const q)
{
    float a = q[3];
    float b = q[0];
    float c = q[1];
    float d = q[2];
    float a2 = a * a;
    float b2 = b * b;
    float c2 = c * c;
    float d2 = d * d;
    
    M[0][0] = a2 + b2 - c2 - d2;
    M[0][1] = 2.f*(b*c + a*d);
    M[0][2] = 2.f*(b*d - a*c);
    M[0][3] = 0.f;

    M[1][0] = 2*(b*c - a*d);
    M[1][1] = a2 - b2 + c2 - d2;
    M[1][2] = 2.f*(c*d + a*b);
    M[1][3] = 0.f;

    M[2][0] = 2.f*(b*d + a*c);
    M[2][1] = 2.f*(c*d - a*b);
    M[2][2] = a2 - b2 - c2 + d2;
    M[2][3] = 0.f;

    M[3][0] = M[3][1] = M[3][2] = 0.f;
    M[3][3] = 1.f;
}

MATH_FUNC void mulf4x4q(float4x4 R, float4x4 M, quat q)
{
    /*  XXX: The way this is written only works for othogonal matrices. */
    /* TODO: Take care of non-orthogonal case.                          */
	mulq_f3(R[0], q, M[0]);
	mulq_f3(R[1], q, M[1]);
	mulq_f3(R[2], q, M[2]);

	R[3][0] = R[3][1] = R[3][2] = 0.f;
	R[3][3] = 1.f;
}

MATH_FUNC void quatFromFloat4x4(quat q, float4x4 M)
{
	float r = 0.0f;
	int i;

	int  perm[] = { 0, 1, 2, 0, 1 };
	int* p      = perm;

	for(i = 0; i < 3; i++) 
    {
		float m = M[i][i];
        if (m < r)
        {
            continue;
        }
        
        m = r;
		p = &perm[i];
	}

	r = sqrtf(1.f + M[p[0]][p[0]] - M[p[1]][p[1]] - M[p[2]][p[2]]);

	if(r < 1e-6) {
		q[0] = 1.f;
		q[1] = q[2] = q[3] = 0.f;
		return;
	}

	q[0] = r/2.f;
	q[1] = (M[p[0]][p[1]] - M[p[1]][p[0]])/(2.f*r);
	q[2] = (M[p[2]][p[0]] - M[p[0]][p[2]])/(2.f*r);
	q[3] = (M[p[2]][p[1]] - M[p[1]][p[2]])/(2.f*r);
}