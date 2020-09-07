.class public Lcom/badlogic/gdx/math/Interpolation$PowOut;
.super Lcom/badlogic/gdx/math/Interpolation$Pow;
.source "Interpolation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/math/Interpolation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PowOut"
.end annotation


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 193
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/math/Interpolation$Pow;-><init>(I)V

    return-void
.end method


# virtual methods
.method public apply(F)F
    .locals 5

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr p1, v0

    float-to-double v1, p1

    .line 197
    iget p1, p0, Lcom/badlogic/gdx/math/Interpolation$PowOut;->power:I

    int-to-double v3, p1

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    double-to-float p1, v1

    iget v1, p0, Lcom/badlogic/gdx/math/Interpolation$PowOut;->power:I

    rem-int/lit8 v1, v1, 0x2

    if-nez v1, :cond_0

    const/4 v1, -0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    :goto_0
    int-to-float v1, v1

    mul-float p1, p1, v1

    add-float/2addr p1, v0

    return p1
.end method
