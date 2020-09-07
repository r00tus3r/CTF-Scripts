.class final Lcom/badlogic/gdx/math/Interpolation$2;
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

    .line 41
    invoke-direct {p0}, Lcom/badlogic/gdx/math/Interpolation;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(F)F
    .locals 2

    mul-float v0, p1, p1

    const/high16 v1, 0x40000000    # 2.0f

    mul-float p1, p1, v1

    const/high16 v1, 0x40400000    # 3.0f

    sub-float/2addr v1, p1

    mul-float v0, v0, v1

    return v0
.end method
