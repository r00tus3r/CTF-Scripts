.class public Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;
.super Ljava/lang/Object;
.source "AndroidApplicationConfiguration.java"


# instance fields
.field public a:I

.field public b:I

.field public depth:I

.field public disableAudio:Z

.field public g:I

.field public getTouchEventsForLiveWallpaper:Z

.field public hideStatusBar:Z

.field public maxNetThreads:I

.field public maxSimultaneousSounds:I

.field public numSamples:I

.field public r:I

.field public resolutionStrategy:Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy;

.field public sensorDelay:I

.field public stencil:I

.field public touchSleepTime:I

.field public useAccelerometer:Z

.field public useCompass:Z

.field public useGL30:Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public useGLSurfaceView20API18:Z

.field public useGyroscope:Z

.field public useImmersiveMode:Z

.field public useRotationVectorSensor:Z

.field public useWakelock:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x5

    .line 33
    iput v0, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->r:I

    const/4 v1, 0x6

    iput v1, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->g:I

    iput v0, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->b:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->a:I

    const/16 v1, 0x10

    .line 36
    iput v1, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->depth:I

    iput v0, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->stencil:I

    .line 39
    iput v0, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->numSamples:I

    const/4 v2, 0x1

    .line 42
    iput-boolean v2, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->useAccelerometer:Z

    .line 45
    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->useGyroscope:Z

    .line 53
    iput-boolean v2, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->useCompass:Z

    .line 63
    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->useRotationVectorSensor:Z

    .line 68
    iput v2, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->sensorDelay:I

    .line 72
    iput v0, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->touchSleepTime:I

    .line 75
    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->useWakelock:Z

    .line 79
    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->hideStatusBar:Z

    .line 82
    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->disableAudio:Z

    .line 86
    iput v1, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->maxSimultaneousSounds:I

    .line 89
    new-instance v1, Lcom/badlogic/gdx/backends/android/surfaceview/FillResolutionStrategy;

    invoke-direct {v1}, Lcom/badlogic/gdx/backends/android/surfaceview/FillResolutionStrategy;-><init>()V

    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->resolutionStrategy:Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy;

    .line 92
    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->getTouchEventsForLiveWallpaper:Z

    .line 95
    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->useImmersiveMode:Z

    .line 100
    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->useGL30:Z

    .line 106
    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->useGLSurfaceView20API18:Z

    const v0, 0x7fffffff

    .line 109
    iput v0, p0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->maxNetThreads:I

    return-void
.end method
