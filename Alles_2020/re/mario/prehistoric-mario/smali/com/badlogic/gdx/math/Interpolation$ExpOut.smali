.class public Lcom/badlogic/gdx/math/Interpolation$ExpOut;
.super Lcom/badlogic/gdx/math/Interpolation$Exp;
.source "Interpolation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/math/Interpolation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ExpOut"
.end annotation


# direct methods
.method public constructor <init>(FF)V
    .locals 0

    .line 231
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/math/Interpolation$Exp;-><init>(FF)V

    return-void
.end method


# virtual methods
.method public apply(F)F
    .locals 4

    .line 235
    iget v0, p0, Lcom/badlogic/gdx/math/Interpolation$ExpOut;->value:F

    float-to-double v0, v0

    iget v2, p0, Lcom/badlogic/gdx/math/Interpolation$ExpOut;->power:F

    neg-float v2, v2

    mul-float v2, v2, p1

    float-to-double v2, v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    double-to-float p1, v0

    iget v0, p0, Lcom/badlogic/gdx/math/Interpolation$ExpOut;->min:F

    sub-float/2addr p1, v0

    iget v0, p0, Lcom/badlogic/gdx/math/Interpolation$ExpOut;->scale:F

    mul-float p1, p1, v0

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr v0, p1

    return v0
.end method
