.class public Lcom/badlogic/gdx/math/Interpolation$ExpIn;
.super Lcom/badlogic/gdx/math/Interpolation$Exp;
.source "Interpolation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/math/Interpolation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ExpIn"
.end annotation


# direct methods
.method public constructor <init>(FF)V
    .locals 0

    .line 221
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/math/Interpolation$Exp;-><init>(FF)V

    return-void
.end method


# virtual methods
.method public apply(F)F
    .locals 4

    .line 225
    iget v0, p0, Lcom/badlogic/gdx/math/Interpolation$ExpIn;->value:F

    float-to-double v0, v0

    iget v2, p0, Lcom/badlogic/gdx/math/Interpolation$ExpIn;->power:F

    const/high16 v3, 0x3f800000    # 1.0f

    sub-float/2addr p1, v3

    mul-float v2, v2, p1

    float-to-double v2, v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    double-to-float p1, v0

    iget v0, p0, Lcom/badlogic/gdx/math/Interpolation$ExpIn;->min:F

    sub-float/2addr p1, v0

    iget v0, p0, Lcom/badlogic/gdx/math/Interpolation$ExpIn;->scale:F

    mul-float p1, p1, v0

    return p1
.end method
