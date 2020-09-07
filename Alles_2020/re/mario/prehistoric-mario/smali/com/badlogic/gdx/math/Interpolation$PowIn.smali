.class public Lcom/badlogic/gdx/math/Interpolation$PowIn;
.super Lcom/badlogic/gdx/math/Interpolation$Pow;
.source "Interpolation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/math/Interpolation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PowIn"
.end annotation


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 183
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/math/Interpolation$Pow;-><init>(I)V

    return-void
.end method


# virtual methods
.method public apply(F)F
    .locals 4

    float-to-double v0, p1

    .line 187
    iget p1, p0, Lcom/badlogic/gdx/math/Interpolation$PowIn;->power:I

    int-to-double v2, p1

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    double-to-float p1, v0

    return p1
.end method
