.class public Lcom/brashmonkey/spriter/Interpolator;
.super Ljava/lang/Object;
.source "Interpolator.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bezier(FFFFF)F
    .locals 1

    .line 53
    invoke-static {p0}, Lcom/brashmonkey/spriter/Interpolator;->bezier0(F)F

    move-result v0

    mul-float v0, v0, p1

    invoke-static {p0}, Lcom/brashmonkey/spriter/Interpolator;->bezier1(F)F

    move-result p1

    mul-float p1, p1, p2

    add-float/2addr v0, p1

    invoke-static {p0}, Lcom/brashmonkey/spriter/Interpolator;->bezier2(F)F

    move-result p1

    mul-float p1, p1, p3

    add-float/2addr v0, p1

    invoke-static {p0}, Lcom/brashmonkey/spriter/Interpolator;->bezier3(F)F

    move-result p0

    mul-float p0, p0, p4

    add-float/2addr v0, p0

    return v0
.end method

.method private static bezier0(F)F
    .locals 3

    mul-float v0, p0, p0

    neg-float v1, v0

    mul-float v1, v1, p0

    const/high16 v2, 0x40400000    # 3.0f

    mul-float v0, v0, v2

    add-float/2addr v1, v0

    mul-float p0, p0, v2

    sub-float/2addr v1, p0

    const/high16 p0, 0x3f800000    # 1.0f

    add-float/2addr v1, p0

    return v1
.end method

.method private static bezier1(F)F
    .locals 3

    mul-float v0, p0, p0

    const/high16 v1, 0x40400000    # 3.0f

    mul-float p0, p0, v1

    mul-float v1, p0, v0

    const/high16 v2, 0x40c00000    # 6.0f

    mul-float v0, v0, v2

    sub-float/2addr v1, v0

    add-float/2addr v1, p0

    return v1
.end method

.method private static bezier2(F)F
    .locals 2

    mul-float v0, p0, p0

    const/high16 v1, -0x3fc00000    # -3.0f

    mul-float v1, v1, v0

    mul-float v1, v1, p0

    const/high16 p0, 0x40400000    # 3.0f

    mul-float v0, v0, p0

    add-float/2addr v1, v0

    return v1
.end method

.method private static bezier3(F)F
    .locals 1

    mul-float v0, p0, p0

    mul-float v0, v0, p0

    return v0
.end method

.method public static cubic(FFFFF)F
    .locals 0

    .line 29
    invoke-static {p0, p1, p2, p4}, Lcom/brashmonkey/spriter/Interpolator;->quadratic(FFFF)F

    move-result p0

    invoke-static {p1, p2, p3, p4}, Lcom/brashmonkey/spriter/Interpolator;->quadratic(FFFF)F

    move-result p1

    invoke-static {p0, p1, p4}, Lcom/brashmonkey/spriter/Interpolator;->linear(FFF)F

    move-result p0

    return p0
.end method

.method public static cubicAngle(FFFFF)F
    .locals 0

    .line 33
    invoke-static {p0, p1, p2, p4}, Lcom/brashmonkey/spriter/Interpolator;->quadraticAngle(FFFF)F

    move-result p0

    invoke-static {p1, p2, p3, p4}, Lcom/brashmonkey/spriter/Interpolator;->quadraticAngle(FFFF)F

    move-result p1

    invoke-static {p0, p1, p4}, Lcom/brashmonkey/spriter/Interpolator;->linearAngle(FFF)F

    move-result p0

    return p0
.end method

.method public static linear(FFF)F
    .locals 0

    sub-float/2addr p1, p0

    mul-float p1, p1, p2

    add-float/2addr p0, p1

    return p0
.end method

.method public static linearAngle(FFF)F
    .locals 0

    .line 17
    invoke-static {p1, p0}, Lcom/brashmonkey/spriter/Calculator;->angleDifference(FF)F

    move-result p1

    mul-float p1, p1, p2

    add-float/2addr p0, p1

    return p0
.end method

.method public static quadratic(FFFF)F
    .locals 0

    .line 21
    invoke-static {p0, p1, p3}, Lcom/brashmonkey/spriter/Interpolator;->linear(FFF)F

    move-result p0

    invoke-static {p1, p2, p3}, Lcom/brashmonkey/spriter/Interpolator;->linear(FFF)F

    move-result p1

    invoke-static {p0, p1, p3}, Lcom/brashmonkey/spriter/Interpolator;->linear(FFF)F

    move-result p0

    return p0
.end method

.method public static quadraticAngle(FFFF)F
    .locals 0

    .line 25
    invoke-static {p0, p1, p3}, Lcom/brashmonkey/spriter/Interpolator;->linearAngle(FFF)F

    move-result p0

    invoke-static {p1, p2, p3}, Lcom/brashmonkey/spriter/Interpolator;->linearAngle(FFF)F

    move-result p1

    invoke-static {p0, p1, p3}, Lcom/brashmonkey/spriter/Interpolator;->linearAngle(FFF)F

    move-result p0

    return p0
.end method

.method public static quartic(FFFFFF)F
    .locals 0

    .line 37
    invoke-static {p0, p1, p2, p3, p5}, Lcom/brashmonkey/spriter/Interpolator;->cubic(FFFFF)F

    move-result p0

    invoke-static {p1, p2, p3, p4, p5}, Lcom/brashmonkey/spriter/Interpolator;->cubic(FFFFF)F

    move-result p1

    invoke-static {p0, p1, p5}, Lcom/brashmonkey/spriter/Interpolator;->linear(FFF)F

    move-result p0

    return p0
.end method

.method public static quarticAngle(FFFFFF)F
    .locals 0

    .line 41
    invoke-static {p0, p1, p2, p3, p5}, Lcom/brashmonkey/spriter/Interpolator;->cubicAngle(FFFFF)F

    move-result p0

    invoke-static {p1, p2, p3, p4, p5}, Lcom/brashmonkey/spriter/Interpolator;->cubicAngle(FFFFF)F

    move-result p1

    invoke-static {p0, p1, p5}, Lcom/brashmonkey/spriter/Interpolator;->linearAngle(FFF)F

    move-result p0

    return p0
.end method

.method public static quintic(FFFFFFF)F
    .locals 6

    move v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p6

    .line 45
    invoke-static/range {v0 .. v5}, Lcom/brashmonkey/spriter/Interpolator;->quartic(FFFFFF)F

    move-result p0

    invoke-static/range {p1 .. p6}, Lcom/brashmonkey/spriter/Interpolator;->quartic(FFFFFF)F

    move-result p1

    invoke-static {p0, p1, p6}, Lcom/brashmonkey/spriter/Interpolator;->linear(FFF)F

    move-result p0

    return p0
.end method

.method public static quinticAngle(FFFFFFF)F
    .locals 6

    move v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p6

    .line 49
    invoke-static/range {v0 .. v5}, Lcom/brashmonkey/spriter/Interpolator;->quarticAngle(FFFFFF)F

    move-result p0

    invoke-static/range {p1 .. p6}, Lcom/brashmonkey/spriter/Interpolator;->quarticAngle(FFFFFF)F

    move-result p1

    invoke-static {p0, p1, p6}, Lcom/brashmonkey/spriter/Interpolator;->linearAngle(FFF)F

    move-result p0

    return p0
.end method
