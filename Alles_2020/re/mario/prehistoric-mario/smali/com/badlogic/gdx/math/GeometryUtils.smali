.class public final Lcom/badlogic/gdx/math/GeometryUtils;
.super Ljava/lang/Object;
.source "GeometryUtils.java"


# static fields
.field private static final tmp1:Lcom/badlogic/gdx/math/Vector2;

.field private static final tmp2:Lcom/badlogic/gdx/math/Vector2;

.field private static final tmp3:Lcom/badlogic/gdx/math/Vector2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 21
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/GeometryUtils;->tmp1:Lcom/badlogic/gdx/math/Vector2;

    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/GeometryUtils;->tmp2:Lcom/badlogic/gdx/math/Vector2;

    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/GeometryUtils;->tmp3:Lcom/badlogic/gdx/math/Vector2;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static barycoordInsideTriangle(Lcom/badlogic/gdx/math/Vector2;)Z
    .locals 2

    .line 54
    iget v0, p0, Lcom/badlogic/gdx/math/Vector2;->x:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/math/Vector2;->y:F

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p0, p0, Lcom/badlogic/gdx/math/Vector2;->y:F

    add-float/2addr v0, p0

    const/high16 p0, 0x3f800000    # 1.0f

    cmpg-float p0, v0, p0

    if-gtz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static colinear(FFFFFF)Z
    .locals 0

    sub-float p0, p2, p0

    sub-float p1, p3, p1

    sub-float/2addr p4, p2

    sub-float/2addr p5, p3

    mul-float p4, p4, p1

    mul-float p0, p0, p5

    sub-float/2addr p4, p0

    .line 103
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result p0

    const p1, 0x358637bd    # 1.0E-6f

    cmpg-float p0, p0, p1

    if-gez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static ensureCCW([F)V
    .locals 2

    .line 222
    array-length v0, p0

    const/4 v1, 0x0

    invoke-static {p0, v1, v0}, Lcom/badlogic/gdx/math/GeometryUtils;->ensureCCW([FII)V

    return-void
.end method

.method public static ensureCCW([FII)V
    .locals 7

    .line 226
    invoke-static {p0, p1, p2}, Lcom/badlogic/gdx/math/GeometryUtils;->isClockwise([FII)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    add-int v0, p1, p2

    add-int/lit8 v0, v0, -0x2

    .line 228
    div-int/lit8 p2, p2, 0x2

    add-int/2addr p2, p1

    :goto_0
    if-ge p1, p2, :cond_1

    sub-int v1, v0, p1

    .line 230
    aget v2, p0, p1

    add-int/lit8 v3, p1, 0x1

    .line 231
    aget v4, p0, v3

    .line 232
    aget v5, p0, v1

    aput v5, p0, p1

    add-int/lit8 v5, v1, 0x1

    .line 233
    aget v6, p0, v5

    aput v6, p0, v3

    .line 234
    aput v2, p0, v1

    .line 235
    aput v4, p0, v5

    add-int/lit8 p1, p1, 0x2

    goto :goto_0

    :cond_1
    return-void
.end method

.method public static fromBarycoord(Lcom/badlogic/gdx/math/Vector2;FFF)F
    .locals 2

    .line 69
    iget v0, p0, Lcom/badlogic/gdx/math/Vector2;->x:F

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, v0

    iget v0, p0, Lcom/badlogic/gdx/math/Vector2;->y:F

    sub-float/2addr v1, v0

    mul-float v1, v1, p1

    .line 70
    iget p1, p0, Lcom/badlogic/gdx/math/Vector2;->x:F

    mul-float p1, p1, p2

    add-float/2addr v1, p1

    iget p0, p0, Lcom/badlogic/gdx/math/Vector2;->y:F

    mul-float p0, p0, p3

    add-float/2addr v1, p0

    return v1
.end method

.method public static fromBarycoord(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 4

    .line 60
    iget v0, p0, Lcom/badlogic/gdx/math/Vector2;->x:F

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, v0

    iget v0, p0, Lcom/badlogic/gdx/math/Vector2;->y:F

    sub-float/2addr v1, v0

    .line 61
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    mul-float v0, v0, v1

    iget v2, p0, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v3, p2, Lcom/badlogic/gdx/math/Vector2;->x:F

    mul-float v2, v2, v3

    add-float/2addr v0, v2

    iget v2, p0, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v3, p3, Lcom/badlogic/gdx/math/Vector2;->x:F

    mul-float v2, v2, v3

    add-float/2addr v0, v2

    iput v0, p4, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 62
    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    mul-float v1, v1, p1

    iget p1, p0, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p2, p2, Lcom/badlogic/gdx/math/Vector2;->y:F

    mul-float p1, p1, p2

    add-float/2addr v1, p1

    iget p0, p0, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget p1, p3, Lcom/badlogic/gdx/math/Vector2;->y:F

    mul-float p0, p0, p1

    add-float/2addr v1, p0

    iput v1, p4, Lcom/badlogic/gdx/math/Vector2;->y:F

    return-object p4
.end method

.method public static isClockwise([FII)Z
    .locals 7

    const/4 v0, 0x0

    const/4 v1, 0x2

    if-gt p2, v1, :cond_0

    return v0

    :cond_0
    add-int/2addr p2, p1

    sub-int/2addr p2, v1

    .line 243
    aget v1, p0, p2

    add-int/lit8 v2, p2, 0x1

    aget v2, p0, v2

    const/4 v3, 0x0

    move v4, v2

    move v2, v1

    const/4 v1, 0x0

    :goto_0
    if-gt p1, p2, :cond_1

    .line 245
    aget v5, p0, p1

    add-int/lit8 v6, p1, 0x1

    aget v6, p0, v6

    mul-float v2, v2, v6

    mul-float v4, v4, v5

    sub-float/2addr v2, v4

    add-float/2addr v1, v2

    add-int/lit8 p1, p1, 0x2

    move v2, v5

    move v4, v6

    goto :goto_0

    :cond_1
    cmpg-float p0, v1, v3

    if-gez p0, :cond_2

    const/4 v0, 0x1

    :cond_2
    return v0
.end method

.method public static lowestPositiveRoot(FFF)F
    .locals 5

    mul-float v0, p1, p1

    const/high16 v1, 0x40800000    # 4.0f

    mul-float v1, v1, p0

    mul-float v1, v1, p2

    sub-float/2addr v0, v1

    const/high16 p2, 0x7fc00000    # Float.NaN

    const/4 v1, 0x0

    cmpg-float v2, v0, v1

    if-gez v2, :cond_0

    return p2

    :cond_0
    float-to-double v2, v0

    .line 83
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    double-to-float v0, v2

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x40000000    # 2.0f

    mul-float p0, p0, v3

    div-float/2addr v2, p0

    neg-float p0, p1

    sub-float p1, p0, v0

    mul-float p1, p1, v2

    add-float/2addr p0, v0

    mul-float p0, p0, v2

    cmpl-float v0, p1, p0

    if-lez v0, :cond_1

    goto :goto_0

    :cond_1
    move v4, p1

    move p1, p0

    move p0, v4

    :goto_0
    cmpl-float v0, p0, v1

    if-lez v0, :cond_2

    return p0

    :cond_2
    cmpl-float p0, p1, v1

    if-lez p0, :cond_3

    return p1

    :cond_3
    return p2
.end method

.method public static polygonArea([FII)F
    .locals 5

    add-int/2addr p2, p1

    add-int/lit8 p2, p2, -0x2

    .line 211
    aget v0, p0, p2

    add-int/lit8 v1, p2, 0x1

    aget v1, p0, v1

    const/4 v2, 0x0

    :goto_0
    if-gt p1, p2, :cond_0

    .line 213
    aget v3, p0, p1

    add-int/lit8 v4, p1, 0x1

    aget v4, p0, v4

    mul-float v0, v0, v4

    mul-float v1, v1, v3

    sub-float/2addr v0, v1

    add-float/2addr v2, v0

    add-int/lit8 p1, p1, 0x2

    move v0, v3

    move v1, v4

    goto :goto_0

    :cond_0
    const/high16 p0, 0x3f000000    # 0.5f

    mul-float v2, v2, p0

    return v2
.end method

.method public static polygonCentroid([FIILcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 10

    const/4 v0, 0x6

    if-lt p2, v0, :cond_2

    add-int/2addr p2, p1

    add-int/lit8 p2, p2, -0x2

    .line 186
    aget v0, p0, p2

    add-int/lit8 v1, p2, 0x1

    aget v1, p0, v1

    const/4 v2, 0x0

    move v3, v1

    const/4 v4, 0x0

    const/4 v5, 0x0

    move v1, v0

    const/4 v0, 0x0

    :goto_0
    if-gt p1, p2, :cond_0

    .line 188
    aget v6, p0, p1

    add-int/lit8 v7, p1, 0x1

    aget v7, p0, v7

    mul-float v8, v1, v7

    mul-float v9, v6, v3

    sub-float/2addr v8, v9

    add-float/2addr v0, v8

    add-float/2addr v1, v6

    mul-float v1, v1, v8

    add-float/2addr v4, v1

    add-float/2addr v3, v7

    mul-float v3, v3, v8

    add-float/2addr v5, v3

    add-int/lit8 p1, p1, 0x2

    move v1, v6

    move v3, v7

    goto :goto_0

    :cond_0
    cmpl-float p0, v0, v2

    if-nez p0, :cond_1

    .line 197
    iput v2, p3, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 198
    iput v2, p3, Lcom/badlogic/gdx/math/Vector2;->y:F

    goto :goto_1

    :cond_1
    const/high16 p0, 0x3f000000    # 0.5f

    mul-float v0, v0, p0

    const/high16 p0, 0x40c00000    # 6.0f

    mul-float v0, v0, p0

    div-float/2addr v4, v0

    .line 201
    iput v4, p3, Lcom/badlogic/gdx/math/Vector2;->x:F

    div-float/2addr v5, v0

    .line 202
    iput v5, p3, Lcom/badlogic/gdx/math/Vector2;->y:F

    :goto_1
    return-object p3

    .line 182
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "A polygon must have 3 or more coordinate pairs."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw p0

    :goto_3
    goto :goto_2
.end method

.method public static quadrilateralCentroid(FFFFFFFFLcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 1

    add-float/2addr p2, p0

    add-float/2addr p2, p4

    const/high16 v0, 0x40400000    # 3.0f

    div-float/2addr p2, v0

    add-float/2addr p3, p1

    add-float/2addr p3, p5

    div-float/2addr p3, v0

    add-float/2addr p0, p6

    add-float/2addr p0, p4

    div-float/2addr p0, v0

    add-float/2addr p1, p7

    add-float/2addr p1, p5

    div-float/2addr p1, v0

    sub-float p0, p2, p0

    const/high16 p4, 0x40000000    # 2.0f

    div-float/2addr p0, p4

    sub-float/2addr p2, p0

    .line 175
    iput p2, p8, Lcom/badlogic/gdx/math/Vector2;->x:F

    sub-float p0, p3, p1

    div-float/2addr p0, p4

    sub-float/2addr p3, p0

    .line 176
    iput p3, p8, Lcom/badlogic/gdx/math/Vector2;->y:F

    return-object p8
.end method

.method public static toBarycoord(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 3

    .line 38
    sget-object v0, Lcom/badlogic/gdx/math/GeometryUtils;->tmp1:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/math/Vector2;->sub(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p2

    .line 39
    sget-object v0, Lcom/badlogic/gdx/math/GeometryUtils;->tmp2:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, p3}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p3

    invoke-virtual {p3, p1}, Lcom/badlogic/gdx/math/Vector2;->sub(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p3

    .line 40
    sget-object v0, Lcom/badlogic/gdx/math/GeometryUtils;->tmp3:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector2;->sub(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p0

    .line 41
    invoke-virtual {p2, p2}, Lcom/badlogic/gdx/math/Vector2;->dot(Lcom/badlogic/gdx/math/Vector2;)F

    move-result p1

    .line 42
    invoke-virtual {p2, p3}, Lcom/badlogic/gdx/math/Vector2;->dot(Lcom/badlogic/gdx/math/Vector2;)F

    move-result v0

    .line 43
    invoke-virtual {p3, p3}, Lcom/badlogic/gdx/math/Vector2;->dot(Lcom/badlogic/gdx/math/Vector2;)F

    move-result v1

    .line 44
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/math/Vector2;->dot(Lcom/badlogic/gdx/math/Vector2;)F

    move-result p2

    .line 45
    invoke-virtual {p0, p3}, Lcom/badlogic/gdx/math/Vector2;->dot(Lcom/badlogic/gdx/math/Vector2;)F

    move-result p0

    mul-float p3, p1, v1

    mul-float v2, v0, v0

    sub-float/2addr p3, v2

    mul-float v1, v1, p2

    mul-float v2, v0, p0

    sub-float/2addr v1, v2

    div-float/2addr v1, p3

    .line 47
    iput v1, p4, Lcom/badlogic/gdx/math/Vector2;->x:F

    mul-float p1, p1, p0

    mul-float v0, v0, p2

    sub-float/2addr p1, v0

    div-float/2addr p1, p3

    .line 48
    iput p1, p4, Lcom/badlogic/gdx/math/Vector2;->y:F

    return-object p4
.end method

.method public static triangleArea(FFFFFF)F
    .locals 0

    sub-float p4, p0, p4

    sub-float/2addr p3, p1

    mul-float p4, p4, p3

    sub-float/2addr p0, p2

    sub-float/2addr p5, p1

    mul-float p0, p0, p5

    sub-float/2addr p4, p0

    .line 166
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result p0

    const/high16 p1, 0x3f000000    # 0.5f

    mul-float p0, p0, p1

    return p0
.end method

.method public static triangleCentroid(FFFFFFLcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 0

    add-float/2addr p0, p2

    add-float/2addr p0, p4

    const/high16 p2, 0x40400000    # 3.0f

    div-float/2addr p0, p2

    .line 107
    iput p0, p6, Lcom/badlogic/gdx/math/Vector2;->x:F

    add-float/2addr p1, p3

    add-float/2addr p1, p5

    div-float/2addr p1, p2

    .line 108
    iput p1, p6, Lcom/badlogic/gdx/math/Vector2;->y:F

    return-object p6
.end method

.method public static triangleCircumcenter(FFFFFFLcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 9

    sub-float v0, p2, p0

    sub-float v1, p3, p1

    sub-float v2, p4, p2

    sub-float v3, p5, p3

    sub-float v4, p0, p4

    sub-float v5, p1, p5

    mul-float v6, v2, v1

    mul-float v7, v0, v3

    sub-float/2addr v6, v7

    .line 118
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v7

    const v8, 0x358637bd    # 1.0E-6f

    cmpg-float v7, v7, v8

    if-ltz v7, :cond_0

    const/high16 v7, 0x40000000    # 2.0f

    mul-float v6, v6, v7

    mul-float p0, p0, p0

    mul-float p1, p1, p1

    add-float/2addr p0, p1

    mul-float p2, p2, p2

    mul-float p3, p3, p3

    add-float/2addr p2, p3

    mul-float p4, p4, p4

    mul-float p5, p5, p5

    add-float/2addr p4, p5

    mul-float v3, v3, p0

    mul-float v5, v5, p2

    add-float/2addr v3, v5

    mul-float v1, v1, p4

    add-float/2addr v3, v1

    div-float/2addr v3, v6

    mul-float p0, p0, v2

    mul-float p2, p2, v4

    add-float/2addr p0, p2

    mul-float p4, p4, v0

    add-float/2addr p0, p4

    neg-float p0, p0

    div-float/2addr p0, v6

    .line 122
    invoke-virtual {p6, v3, p0}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    return-object p6

    .line 119
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Triangle points must not be colinear."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static triangleCircumradius(FFFFFF)F
    .locals 5

    sub-float v0, p3, p1

    .line 128
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const v2, 0x358637bd    # 1.0E-6f

    const/high16 v3, 0x40000000    # 2.0f

    cmpg-float v1, v1, v2

    if-gez v1, :cond_0

    sub-float v0, p4, p2

    neg-float v0, v0

    sub-float v1, p5, p3

    div-float/2addr v0, v1

    add-float/2addr p4, p2

    div-float/2addr p4, v3

    add-float/2addr p3, p5

    div-float/2addr p3, v3

    add-float/2addr p2, p0

    div-float/2addr p2, v3

    sub-float p4, p2, p4

    mul-float v0, v0, p4

    add-float/2addr v0, p3

    goto :goto_0

    :cond_0
    sub-float v1, p5, p3

    .line 134
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpg-float v2, v4, v2

    if-gez v2, :cond_1

    sub-float p5, p2, p0

    neg-float p5, p5

    div-float/2addr p5, v0

    add-float v0, p0, p2

    div-float/2addr v0, v3

    add-float/2addr p3, p1

    div-float/2addr p3, v3

    add-float/2addr p4, p2

    div-float p2, p4, v3

    sub-float p4, p2, v0

    mul-float p5, p5, p4

    add-float v0, p5, p3

    goto :goto_0

    :cond_1
    sub-float v2, p2, p0

    neg-float v2, v2

    div-float/2addr v2, v0

    sub-float v0, p4, p2

    neg-float v0, v0

    div-float/2addr v0, v1

    add-float v1, p0, p2

    div-float/2addr v1, v3

    add-float/2addr p2, p4

    div-float/2addr p2, v3

    add-float p4, p1, p3

    div-float/2addr p4, v3

    add-float/2addr p3, p5

    div-float/2addr p3, v3

    mul-float p5, v2, v1

    mul-float p2, p2, v0

    sub-float/2addr p5, p2

    add-float/2addr p5, p3

    sub-float/2addr p5, p4

    sub-float p2, v2, v0

    div-float p2, p5, p2

    sub-float p3, p2, v1

    mul-float v2, v2, p3

    add-float v0, v2, p4

    :goto_0
    sub-float/2addr p0, p2

    sub-float/2addr p1, v0

    mul-float p0, p0, p0

    mul-float p1, p1, p1

    add-float/2addr p0, p1

    float-to-double p0, p0

    .line 151
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p0

    double-to-float p0, p0

    return p0
.end method

.method public static triangleQuality(FFFFFF)F
    .locals 4

    mul-float v0, p0, p0

    mul-float v1, p1, p1

    add-float/2addr v0, v1

    float-to-double v0, v0

    .line 159
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    mul-float v1, p2, p2

    mul-float v2, p3, p3

    add-float/2addr v1, v2

    float-to-double v1, v1

    .line 160
    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    double-to-float v1, v1

    mul-float v2, p4, p4

    mul-float v3, p5, p5

    add-float/2addr v2, v3

    float-to-double v2, v2

    .line 161
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    double-to-float v2, v2

    .line 162
    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static/range {p0 .. p5}, Lcom/badlogic/gdx/math/GeometryUtils;->triangleCircumradius(FFFFFF)F

    move-result p0

    div-float/2addr v0, p0

    return v0
.end method
