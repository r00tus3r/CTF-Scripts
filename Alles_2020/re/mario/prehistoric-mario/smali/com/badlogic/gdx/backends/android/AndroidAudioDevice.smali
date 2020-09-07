.class Lcom/badlogic/gdx/backends/android/AndroidAudioDevice;
.super Ljava/lang/Object;
.source "AndroidAudioDevice.java"

# interfaces
.implements Lcom/badlogic/gdx/audio/AudioDevice;


# instance fields
.field private buffer:[S

.field private final isMono:Z

.field private final latency:I

.field private final track:Landroid/media/AudioTrack;


# direct methods
.method constructor <init>(IZ)V
    .locals 12

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x400

    .line 33
    new-array v0, v0, [S

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioDevice;->buffer:[S

    .line 42
    iput-boolean p2, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioDevice;->isMono:Z

    const/4 v0, 0x4

    const/16 v1, 0xc

    if-eqz p2, :cond_0

    const/4 v2, 0x4

    goto :goto_0

    :cond_0
    const/16 v2, 0xc

    :goto_0
    const/4 v3, 0x2

    .line 43
    invoke-static {p1, v2, v3}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result v2

    .line 45
    new-instance v11, Landroid/media/AudioTrack;

    const/4 v5, 0x3

    if-eqz p2, :cond_1

    const/4 v7, 0x4

    goto :goto_1

    :cond_1
    const/16 v7, 0xc

    :goto_1
    const/4 v8, 0x2

    const/4 v10, 0x1

    move-object v4, v11

    move v6, p1

    move v9, v2

    invoke-direct/range {v4 .. v10}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    iput-object v11, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioDevice;->track:Landroid/media/AudioTrack;

    .line 47
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioDevice;->track:Landroid/media/AudioTrack;

    invoke-virtual {p1}, Landroid/media/AudioTrack;->play()V

    if-eqz p2, :cond_2

    const/4 v3, 0x1

    .line 48
    :cond_2
    div-int/2addr v2, v3

    iput v2, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioDevice;->latency:I

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioDevice;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V

    .line 54
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioDevice;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    return-void
.end method

.method public getLatency()I
    .locals 1

    .line 89
    iget v0, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioDevice;->latency:I

    return v0
.end method

.method public isMono()Z
    .locals 1

    .line 59
    iget-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioDevice;->isMono:Z

    return v0
.end method

.method public setVolume(F)V
    .locals 1

    .line 94
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioDevice;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0, p1, p1}, Landroid/media/AudioTrack;->setStereoVolume(FF)I

    return-void
.end method

.method public writeSamples([FII)V
    .locals 6

    .line 71
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioDevice;->buffer:[S

    array-length v0, v0

    array-length v1, p1

    if-ge v0, v1, :cond_0

    array-length v0, p1

    new-array v0, v0, [S

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioDevice;->buffer:[S

    :cond_0
    add-int v0, p2, p3

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge p2, v0, :cond_3

    .line 75
    aget v3, p1, p2

    const/high16 v4, 0x3f800000    # 1.0f

    cmpl-float v5, v3, v4

    if-lez v5, :cond_1

    const/high16 v3, 0x3f800000    # 1.0f

    :cond_1
    const/high16 v4, -0x40800000    # -1.0f

    cmpg-float v5, v3, v4

    if-gez v5, :cond_2

    const/high16 v3, -0x40800000    # -1.0f

    :cond_2
    const v4, 0x46fffe00    # 32767.0f

    mul-float v3, v3, v4

    float-to-int v3, v3

    int-to-short v3, v3

    .line 79
    iget-object v4, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioDevice;->buffer:[S

    aput-short v3, v4, v2

    add-int/lit8 p2, p2, 0x1

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 82
    :cond_3
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioDevice;->track:Landroid/media/AudioTrack;

    iget-object p2, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioDevice;->buffer:[S

    invoke-virtual {p1, p2, v1, p3}, Landroid/media/AudioTrack;->write([SII)I

    move-result p1

    :goto_1
    if-eq p1, p3, :cond_4

    .line 84
    iget-object p2, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioDevice;->track:Landroid/media/AudioTrack;

    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioDevice;->buffer:[S

    sub-int v1, p3, p1

    invoke-virtual {p2, v0, p1, v1}, Landroid/media/AudioTrack;->write([SII)I

    move-result p2

    add-int/2addr p1, p2

    goto :goto_1

    :cond_4
    return-void
.end method

.method public writeSamples([SII)V
    .locals 4

    .line 64
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioDevice;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0, p1, p2, p3}, Landroid/media/AudioTrack;->write([SII)I

    move-result v0

    :goto_0
    if-eq v0, p3, :cond_0

    .line 66
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioDevice;->track:Landroid/media/AudioTrack;

    add-int v2, p2, v0

    sub-int v3, p3, v0

    invoke-virtual {v1, p1, v2, v3}, Landroid/media/AudioTrack;->write([SII)I

    move-result v1

    add-int/2addr v0, v1

    goto :goto_0

    :cond_0
    return-void
.end method
