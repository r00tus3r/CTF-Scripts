.class public Lcom/badlogic/gdx/math/Interpolation$Pow;
.super Lcom/badlogic/gdx/math/Interpolation;
.source "Interpolation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/math/Interpolation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Pow"
.end annotation


# instance fields
.field final power:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 171
    invoke-direct {p0}, Lcom/badlogic/gdx/math/Interpolation;-><init>()V

    .line 172
    iput p1, p0, Lcom/badlogic/gdx/math/Interpolation$Pow;->power:I

    return-void
.end method


# virtual methods
.method public apply(F)F
    .locals 6

    const/high16 v0, 0x40000000    # 2.0f

    const/high16 v1, 0x3f000000    # 0.5f

    cmpg-float v1, p1, v1

    if-gtz v1, :cond_0

    mul-float p1, p1, v0

    float-to-double v1, p1

    .line 176
    iget p1, p0, Lcom/badlogic/gdx/math/Interpolation$Pow;->power:I

    int-to-double v3, p1

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    double-to-float p1, v1

    div-float/2addr p1, v0

    return p1

    :cond_0
    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr p1, v1

    mul-float p1, p1, v0

    float-to-double v2, p1

    .line 177
    iget p1, p0, Lcom/badlogic/gdx/math/Interpolation$Pow;->power:I

    int-to-double v4, p1

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    double-to-float p1, v2

    iget v0, p0, Lcom/badlogic/gdx/math/Interpolation$Pow;->power:I

    const/4 v2, 0x2

    rem-int/2addr v0, v2

    if-nez v0, :cond_1

    const/4 v2, -0x2

    :cond_1
    int-to-float v0, v2

    div-float/2addr p1, v0

    add-float/2addr p1, v1

    return p1
.end method
