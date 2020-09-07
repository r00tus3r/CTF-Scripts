.class public Lcom/badlogic/gdx/math/Interpolation$Swing;
.super Lcom/badlogic/gdx/math/Interpolation;
.source "Interpolation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/math/Interpolation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Swing"
.end annotation


# instance fields
.field private final scale:F


# direct methods
.method public constructor <init>(F)V
    .locals 1

    .line 397
    invoke-direct {p0}, Lcom/badlogic/gdx/math/Interpolation;-><init>()V

    const/high16 v0, 0x40000000    # 2.0f

    mul-float p1, p1, v0

    .line 398
    iput p1, p0, Lcom/badlogic/gdx/math/Interpolation$Swing;->scale:F

    return-void
.end method


# virtual methods
.method public apply(F)F
    .locals 5

    const/high16 v0, 0x40000000    # 2.0f

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v2, 0x3f000000    # 0.5f

    cmpg-float v2, p1, v2

    if-gtz v2, :cond_0

    mul-float p1, p1, v0

    mul-float v2, p1, p1

    .line 404
    iget v3, p0, Lcom/badlogic/gdx/math/Interpolation$Swing;->scale:F

    add-float/2addr v1, v3

    mul-float v1, v1, p1

    sub-float/2addr v1, v3

    mul-float v2, v2, v1

    div-float/2addr v2, v0

    return v2

    :cond_0
    sub-float/2addr p1, v1

    mul-float p1, p1, v0

    mul-float v2, p1, p1

    .line 408
    iget v3, p0, Lcom/badlogic/gdx/math/Interpolation$Swing;->scale:F

    add-float v4, v3, v1

    mul-float v4, v4, p1

    add-float/2addr v4, v3

    mul-float v2, v2, v4

    div-float/2addr v2, v0

    add-float/2addr v2, v1

    return v2
.end method
