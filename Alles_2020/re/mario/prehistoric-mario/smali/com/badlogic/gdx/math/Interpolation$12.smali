.class final Lcom/badlogic/gdx/math/Interpolation$12;
.super Lcom/badlogic/gdx/math/Interpolation;
.source "Interpolation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/math/Interpolation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 129
    invoke-direct {p0}, Lcom/badlogic/gdx/math/Interpolation;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(F)F
    .locals 4

    const/high16 v0, 0x40000000    # 2.0f

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v2, 0x3f000000    # 0.5f

    cmpg-float v2, p1, v2

    if-gtz v2, :cond_0

    mul-float p1, p1, v0

    mul-float p1, p1, p1

    sub-float p1, v1, p1

    float-to-double v2, p1

    .line 133
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    double-to-float p1, v2

    sub-float/2addr v1, p1

    div-float/2addr v1, v0

    return v1

    :cond_0
    sub-float/2addr p1, v1

    mul-float p1, p1, v0

    mul-float p1, p1, p1

    sub-float p1, v1, p1

    float-to-double v2, p1

    .line 137
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    double-to-float p1, v2

    add-float/2addr p1, v1

    div-float/2addr p1, v0

    return p1
.end method
