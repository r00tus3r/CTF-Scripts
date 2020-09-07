.class public Lcom/badlogic/gdx/math/Interpolation$BounceIn;
.super Lcom/badlogic/gdx/math/Interpolation$BounceOut;
.source "Interpolation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/math/Interpolation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BounceIn"
.end annotation


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 384
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/math/Interpolation$BounceOut;-><init>(I)V

    return-void
.end method

.method public constructor <init>([F[F)V
    .locals 0

    .line 380
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/math/Interpolation$BounceOut;-><init>([F[F)V

    return-void
.end method


# virtual methods
.method public apply(F)F
    .locals 1

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float p1, v0, p1

    .line 388
    invoke-super {p0, p1}, Lcom/badlogic/gdx/math/Interpolation$BounceOut;->apply(F)F

    move-result p1

    sub-float/2addr v0, p1

    return v0
.end method
