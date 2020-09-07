.class public Lcom/badlogic/gdx/math/Interpolation$Elastic;
.super Lcom/badlogic/gdx/math/Interpolation;
.source "Interpolation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/math/Interpolation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Elastic"
.end annotation


# instance fields
.field final bounces:F

.field final power:F

.field final scale:F

.field final value:F


# direct methods
.method public constructor <init>(FFIF)V
    .locals 0

    .line 244
    invoke-direct {p0}, Lcom/badlogic/gdx/math/Interpolation;-><init>()V

    .line 245
    iput p1, p0, Lcom/badlogic/gdx/math/Interpolation$Elastic;->value:F

    .line 246
    iput p2, p0, Lcom/badlogic/gdx/math/Interpolation$Elastic;->power:F

    .line 247
    iput p4, p0, Lcom/badlogic/gdx/math/Interpolation$Elastic;->scale:F

    int-to-float p1, p3

    const p2, 0x40490fdb    # (float)Math.PI

    mul-float p1, p1, p2

    .line 248
    rem-int/lit8 p3, p3, 0x2

    if-nez p3, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, -0x1

    :goto_0
    int-to-float p2, p2

    mul-float p1, p1, p2

    iput p1, p0, Lcom/badlogic/gdx/math/Interpolation$Elastic;->bounces:F

    return-void
.end method


# virtual methods
.method public apply(F)F
    .locals 6

    const/high16 v0, 0x40000000    # 2.0f

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v2, 0x3f000000    # 0.5f

    cmpg-float v2, p1, v2

    if-gtz v2, :cond_0

    mul-float p1, p1, v0

    .line 254
    iget v2, p0, Lcom/badlogic/gdx/math/Interpolation$Elastic;->value:F

    float-to-double v2, v2

    iget v4, p0, Lcom/badlogic/gdx/math/Interpolation$Elastic;->power:F

    sub-float v1, p1, v1

    mul-float v4, v4, v1

    float-to-double v4, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    double-to-float v1, v1

    iget v2, p0, Lcom/badlogic/gdx/math/Interpolation$Elastic;->bounces:F

    mul-float p1, p1, v2

    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result p1

    mul-float v1, v1, p1

    iget p1, p0, Lcom/badlogic/gdx/math/Interpolation$Elastic;->scale:F

    mul-float v1, v1, p1

    div-float/2addr v1, v0

    return v1

    :cond_0
    sub-float p1, v1, p1

    mul-float p1, p1, v0

    .line 258
    iget v2, p0, Lcom/badlogic/gdx/math/Interpolation$Elastic;->value:F

    float-to-double v2, v2

    iget v4, p0, Lcom/badlogic/gdx/math/Interpolation$Elastic;->power:F

    sub-float v5, p1, v1

    mul-float v4, v4, v5

    float-to-double v4, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    double-to-float v2, v2

    iget v3, p0, Lcom/badlogic/gdx/math/Interpolation$Elastic;->bounces:F

    mul-float p1, p1, v3

    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result p1

    mul-float v2, v2, p1

    iget p1, p0, Lcom/badlogic/gdx/math/Interpolation$Elastic;->scale:F

    mul-float v2, v2, p1

    div-float/2addr v2, v0

    sub-float/2addr v1, v2

    return v1
.end method
