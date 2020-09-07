.class public Lcom/badlogic/gdx/backends/android/surfaceview/FixedResolutionStrategy;
.super Ljava/lang/Object;
.source "FixedResolutionStrategy.java"

# interfaces
.implements Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy;


# instance fields
.field private final height:I

.field private final width:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput p1, p0, Lcom/badlogic/gdx/backends/android/surfaceview/FixedResolutionStrategy;->width:I

    .line 26
    iput p2, p0, Lcom/badlogic/gdx/backends/android/surfaceview/FixedResolutionStrategy;->height:I

    return-void
.end method


# virtual methods
.method public calcMeasures(II)Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy$MeasuredDimension;
    .locals 1

    .line 31
    new-instance p1, Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy$MeasuredDimension;

    iget p2, p0, Lcom/badlogic/gdx/backends/android/surfaceview/FixedResolutionStrategy;->width:I

    iget v0, p0, Lcom/badlogic/gdx/backends/android/surfaceview/FixedResolutionStrategy;->height:I

    invoke-direct {p1, p2, v0}, Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy$MeasuredDimension;-><init>(II)V

    return-object p1
.end method
