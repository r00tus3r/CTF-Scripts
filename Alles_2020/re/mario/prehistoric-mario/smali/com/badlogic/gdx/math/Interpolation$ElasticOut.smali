.class public Lcom/badlogic/gdx/math/Interpolation$ElasticOut;
.super Lcom/badlogic/gdx/math/Interpolation$Elastic;
.source "Interpolation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/math/Interpolation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ElasticOut"
.end annotation


# direct methods
.method public constructor <init>(FFIF)V
    .locals 0

    .line 275
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/math/Interpolation$Elastic;-><init>(FFIF)V

    return-void
.end method


# virtual methods
.method public apply(F)F
    .locals 5

    const/4 v0, 0x0

    cmpl-float v1, p1, v0

    if-nez v1, :cond_0

    return v0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    sub-float p1, v0, p1

    .line 281
    iget v1, p0, Lcom/badlogic/gdx/math/Interpolation$ElasticOut;->value:F

    float-to-double v1, v1

    iget v3, p0, Lcom/badlogic/gdx/math/Interpolation$ElasticOut;->power:F

    sub-float v4, p1, v0

    mul-float v3, v3, v4

    float-to-double v3, v3

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    double-to-float v1, v1

    iget v2, p0, Lcom/badlogic/gdx/math/Interpolation$ElasticOut;->bounces:F

    mul-float p1, p1, v2

    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result p1

    mul-float v1, v1, p1

    iget p1, p0, Lcom/badlogic/gdx/math/Interpolation$ElasticOut;->scale:F

    mul-float v1, v1, p1

    sub-float/2addr v0, v1

    return v0
.end method
