.class public Lcom/brashmonkey/spriter/Calculator;
.super Ljava/lang/Object;
.source "Calculator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/brashmonkey/spriter/Calculator$Sin;
    }
.end annotation


# static fields
.field public static final PI:F = 3.1415927f

.field private static final SIN_BITS:I = 0xe

.field private static final SIN_COUNT:I = 0x4000

.field private static final SIN_MASK:I = 0x3fff

.field private static final degFull:F = 360.0f

.field public static final degRad:F = 0.017453292f

.field private static final degToIndex:F = 45.511112f

.field public static final degreesToRadians:F = 0.017453292f

.field public static final radDeg:F = 57.295776f

.field private static final radFull:F = 6.2831855f

.field private static final radToIndex:F = 2607.5945f

.field public static final radiansToDegrees:F = 57.295776f


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static acos(F)F
    .locals 2

    float-to-double v0, p0

    .line 161
    invoke-static {v0, v1}, Ljava/lang/Math;->acos(D)D

    move-result-wide v0

    double-to-float p0, v0

    return p0
.end method

.method public static angleBetween(FFFF)F
    .locals 2

    sub-float/2addr p3, p1

    float-to-double v0, p3

    sub-float/2addr p2, p0

    float-to-double p0, p2

    .line 36
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide p0

    double-to-float p0, p0

    return p0
.end method

.method public static angleDifference(FF)F
    .locals 1

    sub-float/2addr p0, p1

    const/high16 p1, 0x43b40000    # 360.0f

    rem-float/2addr p0, p1

    const/high16 v0, 0x44070000    # 540.0f

    add-float/2addr p0, v0

    rem-float/2addr p0, p1

    const/high16 p1, 0x43340000    # 180.0f

    sub-float/2addr p0, p1

    return p0
.end method

.method public static final cos(F)F
    .locals 2

    .line 196
    sget-object v0, Lcom/brashmonkey/spriter/Calculator$Sin;->table:[F

    const v1, 0x3fc90fdb

    add-float/2addr p0, v1

    const v1, 0x4522f983

    mul-float p0, p0, v1

    float-to-int p0, p0

    and-int/lit16 p0, p0, 0x3fff

    aget p0, v0, p0

    return p0
.end method

.method public static final cosDeg(F)F
    .locals 2

    .line 206
    sget-object v0, Lcom/brashmonkey/spriter/Calculator$Sin;->table:[F

    const/high16 v1, 0x42b40000    # 90.0f

    add-float/2addr p0, v1

    const v1, 0x42360b61

    mul-float p0, p0, v1

    float-to-int p0, p0

    and-int/lit16 p0, p0, 0x3fff

    aget p0, v0, p0

    return p0
.end method

.method public static cubed(F)F
    .locals 1

    mul-float v0, p0, p0

    mul-float v0, v0, p0

    return v0
.end method

.method public static cubicRoot(F)F
    .locals 4

    float-to-double v0, p0

    const-wide v2, 0x3fd5555560000000L    # 0.3333333432674408

    .line 147
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    double-to-float p0, v0

    return p0
.end method

.method public static distanceBetween(FFFF)F
    .locals 0

    sub-float/2addr p2, p0

    sub-float/2addr p3, p1

    mul-float p2, p2, p2

    mul-float p3, p3, p3

    add-float/2addr p2, p3

    .line 49
    invoke-static {p2}, Lcom/brashmonkey/spriter/Calculator;->sqrt(F)F

    move-result p0

    return p0
.end method

.method public static final sin(F)F
    .locals 2

    .line 191
    sget-object v0, Lcom/brashmonkey/spriter/Calculator$Sin;->table:[F

    const v1, 0x4522f983

    mul-float p0, p0, v1

    float-to-int p0, p0

    and-int/lit16 p0, p0, 0x3fff

    aget p0, v0, p0

    return p0
.end method

.method public static final sinDeg(F)F
    .locals 2

    .line 201
    sget-object v0, Lcom/brashmonkey/spriter/Calculator$Sin;->table:[F

    const v1, 0x42360b61

    mul-float p0, p0, v1

    float-to-int p0, p0

    and-int/lit16 p0, p0, 0x3fff

    aget p0, v0, p0

    return p0
.end method

.method public static solveCubic(FFFF)Ljava/lang/Float;
    .locals 5

    const/4 v0, 0x0

    cmpl-float v1, p0, v0

    if-nez v1, :cond_0

    .line 61
    invoke-static {p1, p2, p3}, Lcom/brashmonkey/spriter/Calculator;->solveQuadratic(FFF)Ljava/lang/Float;

    move-result-object p0

    return-object p0

    :cond_0
    cmpl-float v1, p3, v0

    if-nez v1, :cond_1

    .line 62
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0

    :cond_1
    div-float/2addr p1, p0

    div-float/2addr p2, p0

    div-float/2addr p3, p0

    .line 67
    invoke-static {p1}, Lcom/brashmonkey/spriter/Calculator;->squared(F)F

    move-result p0

    const/high16 v1, 0x40400000    # 3.0f

    mul-float v2, p2, v1

    sub-float/2addr v2, p0

    const/high16 v3, 0x41100000    # 9.0f

    div-float/2addr v2, v3

    const/high16 v4, -0x3e280000    # -27.0f

    mul-float p3, p3, v4

    mul-float p2, p2, v3

    const/high16 v3, 0x40000000    # 2.0f

    mul-float p0, p0, v3

    sub-float/2addr p2, p0

    mul-float p2, p2, p1

    add-float/2addr p3, p2

    const/high16 p0, 0x42580000    # 54.0f

    div-float/2addr p3, p0

    .line 70
    invoke-static {v2}, Lcom/brashmonkey/spriter/Calculator;->cubed(F)F

    move-result p0

    invoke-static {p3}, Lcom/brashmonkey/spriter/Calculator;->squared(F)F

    move-result p2

    add-float/2addr p0, p2

    div-float/2addr p1, v1

    const/high16 p2, 0x3f800000    # 1.0f

    cmpl-float v4, p0, v0

    if-lez v4, :cond_4

    .line 74
    invoke-static {p0}, Lcom/brashmonkey/spriter/Calculator;->sqrt(F)F

    move-result v1

    add-float/2addr v1, p3

    cmpg-float v2, v1, v0

    if-gez v2, :cond_2

    neg-float v1, v1

    .line 75
    invoke-static {v1}, Lcom/brashmonkey/spriter/Calculator;->cubicRoot(F)F

    move-result v1

    neg-float v1, v1

    goto :goto_0

    :cond_2
    invoke-static {v1}, Lcom/brashmonkey/spriter/Calculator;->cubicRoot(F)F

    move-result v1

    .line 76
    :goto_0
    invoke-static {p0}, Lcom/brashmonkey/spriter/Calculator;->sqrt(F)F

    move-result p0

    sub-float/2addr p3, p0

    cmpg-float p0, p3, v0

    if-gez p0, :cond_3

    neg-float p0, p3

    .line 77
    invoke-static {p0}, Lcom/brashmonkey/spriter/Calculator;->cubicRoot(F)F

    move-result p0

    neg-float p0, p0

    goto :goto_1

    :cond_3
    invoke-static {p3}, Lcom/brashmonkey/spriter/Calculator;->cubicRoot(F)F

    move-result p0

    :goto_1
    neg-float p1, p1

    add-float/2addr p1, v1

    add-float/2addr p1, p0

    cmpl-float p0, p1, v0

    if-ltz p0, :cond_a

    cmpg-float p0, p1, p2

    if-gtz p0, :cond_a

    .line 80
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0

    :cond_4
    cmpl-float p0, p0, v0

    if-nez p0, :cond_7

    cmpg-float p0, p3, v0

    if-gez p0, :cond_5

    neg-float p0, p3

    .line 82
    invoke-static {p0}, Lcom/brashmonkey/spriter/Calculator;->cubicRoot(F)F

    move-result p0

    neg-float p0, p0

    goto :goto_2

    :cond_5
    invoke-static {p3}, Lcom/brashmonkey/spriter/Calculator;->cubicRoot(F)F

    move-result p0

    :goto_2
    neg-float p3, p1

    mul-float v3, v3, p0

    add-float/2addr p3, v3

    cmpl-float v1, p3, v0

    if-ltz v1, :cond_6

    cmpg-float v1, p3, p2

    if-gtz v1, :cond_6

    .line 85
    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0

    :cond_6
    add-float/2addr p0, p1

    neg-float p0, p0

    cmpl-float p1, p0, v0

    if-ltz p1, :cond_a

    cmpg-float p1, p0, p2

    if-gtz p1, :cond_a

    .line 88
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0

    :cond_7
    neg-float p0, v2

    mul-float v2, p0, p0

    mul-float v2, v2, p0

    .line 92
    invoke-static {v2}, Lcom/brashmonkey/spriter/Calculator;->sqrt(F)F

    move-result v2

    div-float/2addr p3, v2

    invoke-static {p3}, Lcom/brashmonkey/spriter/Calculator;->acos(F)F

    move-result p3

    .line 93
    invoke-static {p0}, Lcom/brashmonkey/spriter/Calculator;->sqrt(F)F

    move-result p0

    mul-float p0, p0, v3

    neg-float p1, p1

    div-float v2, p3, v1

    .line 95
    invoke-static {v2}, Lcom/brashmonkey/spriter/Calculator;->cos(F)F

    move-result v2

    mul-float v2, v2, p0

    add-float/2addr v2, p1

    cmpl-float v3, v2, v0

    if-ltz v3, :cond_8

    cmpg-float v3, v2, p2

    if-gtz v3, :cond_8

    .line 96
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0

    :cond_8
    const v2, 0x40c90fdb

    add-float/2addr v2, p3

    div-float/2addr v2, v1

    .line 98
    invoke-static {v2}, Lcom/brashmonkey/spriter/Calculator;->cos(F)F

    move-result v2

    mul-float v2, v2, p0

    add-float/2addr v2, p1

    cmpl-float v3, v2, v0

    if-ltz v3, :cond_9

    cmpg-float v3, v2, p2

    if-gtz v3, :cond_9

    .line 99
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0

    :cond_9
    const v2, 0x41490fdb

    add-float/2addr p3, v2

    div-float/2addr p3, v1

    .line 101
    invoke-static {p3}, Lcom/brashmonkey/spriter/Calculator;->cos(F)F

    move-result p3

    mul-float p0, p0, p3

    add-float/2addr p1, p0

    cmpl-float p0, p1, v0

    if-ltz p0, :cond_a

    cmpg-float p0, p1, p2

    if-gtz p0, :cond_a

    .line 102
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0

    :cond_a
    const/4 p0, 0x0

    return-object p0
.end method

.method public static solveQuadratic(FFF)Ljava/lang/Float;
    .locals 4

    .line 116
    invoke-static {p1}, Lcom/brashmonkey/spriter/Calculator;->squared(F)F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    mul-float v1, v1, p0

    const/high16 v2, 0x40800000    # 4.0f

    mul-float p0, p0, v2

    mul-float p0, p0, p2

    neg-float p1, p1

    sub-float/2addr v0, p0

    .line 119
    invoke-static {v0}, Lcom/brashmonkey/spriter/Calculator;->sqrt(F)F

    move-result p0

    add-float/2addr p0, p1

    div-float/2addr p0, v1

    const/high16 p2, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    cmpl-float v3, p0, v2

    if-ltz v3, :cond_0

    cmpg-float v3, p0, p2

    if-gtz v3, :cond_0

    .line 120
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0

    .line 122
    :cond_0
    invoke-static {v0}, Lcom/brashmonkey/spriter/Calculator;->sqrt(F)F

    move-result p0

    sub-float/2addr p1, p0

    div-float/2addr p1, v1

    cmpl-float p0, p1, v2

    if-ltz p0, :cond_1

    cmpg-float p0, p1, p2

    if-gtz p0, :cond_1

    .line 123
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static sqrt(F)F
    .locals 2

    float-to-double v0, p0

    .line 154
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float p0, v0

    return p0
.end method

.method public static squared(F)F
    .locals 0

    mul-float p0, p0, p0

    return p0
.end method
