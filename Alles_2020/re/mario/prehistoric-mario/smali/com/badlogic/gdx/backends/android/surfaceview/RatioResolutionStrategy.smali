.class public Lcom/badlogic/gdx/backends/android/surfaceview/RatioResolutionStrategy;
.super Ljava/lang/Object;
.source "RatioResolutionStrategy.java"

# interfaces
.implements Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy;


# instance fields
.field private final ratio:F


# direct methods
.method public constructor <init>(F)V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput p1, p0, Lcom/badlogic/gdx/backends/android/surfaceview/RatioResolutionStrategy;->ratio:F

    return-void
.end method

.method public constructor <init>(FF)V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    div-float/2addr p1, p2

    .line 34
    iput p1, p0, Lcom/badlogic/gdx/backends/android/surfaceview/RatioResolutionStrategy;->ratio:F

    return-void
.end method


# virtual methods
.method public calcMeasures(II)Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy$MeasuredDimension;
    .locals 4

    .line 40
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    .line 41
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    .line 43
    iget v0, p0, Lcom/badlogic/gdx/backends/android/surfaceview/RatioResolutionStrategy;->ratio:F

    int-to-float v1, p1

    int-to-float v2, p2

    div-float v3, v1, v2

    cmpg-float v3, v3, v0

    if-gez v3, :cond_0

    div-float/2addr v1, v0

    .line 50
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result p2

    goto :goto_0

    :cond_0
    mul-float v2, v2, v0

    .line 53
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result p1

    .line 56
    :goto_0
    new-instance v0, Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy$MeasuredDimension;

    invoke-direct {v0, p1, p2}, Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy$MeasuredDimension;-><init>(II)V

    return-object v0
.end method
