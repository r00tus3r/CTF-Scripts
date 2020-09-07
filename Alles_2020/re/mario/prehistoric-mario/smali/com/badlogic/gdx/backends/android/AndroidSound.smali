.class final Lcom/badlogic/gdx/backends/android/AndroidSound;
.super Ljava/lang/Object;
.source "AndroidSound.java"

# interfaces
.implements Lcom/badlogic/gdx/audio/Sound;


# instance fields
.field final manager:Landroid/media/AudioManager;

.field final soundId:I

.field final soundPool:Landroid/media/SoundPool;

.field final streamIds:Lcom/badlogic/gdx/utils/IntArray;


# direct methods
.method constructor <init>(Landroid/media/SoundPool;Landroid/media/AudioManager;I)V
    .locals 2

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Lcom/badlogic/gdx/utils/IntArray;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/IntArray;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->streamIds:Lcom/badlogic/gdx/utils/IntArray;

    .line 32
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundPool:Landroid/media/SoundPool;

    .line 33
    iput-object p2, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->manager:Landroid/media/AudioManager;

    .line 34
    iput p3, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundId:I

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .line 39
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundPool:Landroid/media/SoundPool;

    iget v1, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundId:I

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->unload(I)Z

    return-void
.end method

.method public loop()J
    .locals 2

    const/high16 v0, 0x3f800000    # 1.0f

    .line 99
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/backends/android/AndroidSound;->loop(F)J

    move-result-wide v0

    return-wide v0
.end method

.method public loop(F)J
    .locals 8

    .line 104
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->streamIds:Lcom/badlogic/gdx/utils/IntArray;

    iget v0, v0, Lcom/badlogic/gdx/utils/IntArray;->size:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->streamIds:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntArray;->pop()I

    .line 105
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundPool:Landroid/media/SoundPool;

    iget v2, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundId:I

    const/4 v5, 0x1

    const/4 v6, -0x1

    const/high16 v7, 0x3f800000    # 1.0f

    move v3, p1

    move v4, p1

    invoke-virtual/range {v1 .. v7}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result p1

    if-nez p1, :cond_1

    const-wide/16 v0, -0x1

    return-wide v0

    .line 108
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->streamIds:Lcom/badlogic/gdx/utils/IntArray;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lcom/badlogic/gdx/utils/IntArray;->insert(II)V

    int-to-long v0, p1

    return-wide v0
.end method

.method public loop(FFF)J
    .locals 7

    .line 150
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->streamIds:Lcom/badlogic/gdx/utils/IntArray;

    iget v0, v0, Lcom/badlogic/gdx/utils/IntArray;->size:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->streamIds:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntArray;->pop()I

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    cmpg-float v2, p3, v1

    if-gez v2, :cond_1

    .line 154
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result p3

    sub-float/2addr v0, p3

    mul-float p3, p1, v0

    move v2, p1

    move v3, p3

    goto :goto_0

    :cond_1
    cmpl-float v1, p3, v1

    if-lez v1, :cond_2

    .line 156
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result p3

    sub-float/2addr v0, p3

    mul-float p3, p1, v0

    move v3, p1

    move v2, p3

    goto :goto_0

    :cond_2
    move v2, p1

    move v3, v2

    .line 158
    :goto_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundPool:Landroid/media/SoundPool;

    iget v1, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundId:I

    const/4 v4, 0x1

    const/4 v5, -0x1

    move v6, p2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result p1

    if-nez p1, :cond_3

    const-wide/16 p1, -0x1

    return-wide p1

    .line 161
    :cond_3
    iget-object p2, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->streamIds:Lcom/badlogic/gdx/utils/IntArray;

    const/4 p3, 0x0

    invoke-virtual {p2, p3, p1}, Lcom/badlogic/gdx/utils/IntArray;->insert(II)V

    int-to-long p1, p1

    return-wide p1
.end method

.method public pause()V
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Landroid/media/SoundPool;->autoPause()V

    return-void
.end method

.method public pause(J)V
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundPool:Landroid/media/SoundPool;

    long-to-int p2, p1

    invoke-virtual {v0, p2}, Landroid/media/SoundPool;->pause(I)V

    return-void
.end method

.method public play()J
    .locals 2

    const/high16 v0, 0x3f800000    # 1.0f

    .line 44
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/backends/android/AndroidSound;->play(F)J

    move-result-wide v0

    return-wide v0
.end method

.method public play(F)J
    .locals 8

    .line 49
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->streamIds:Lcom/badlogic/gdx/utils/IntArray;

    iget v0, v0, Lcom/badlogic/gdx/utils/IntArray;->size:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->streamIds:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntArray;->pop()I

    .line 50
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundPool:Landroid/media/SoundPool;

    iget v2, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundId:I

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/high16 v7, 0x3f800000    # 1.0f

    move v3, p1

    move v4, p1

    invoke-virtual/range {v1 .. v7}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result p1

    if-nez p1, :cond_1

    const-wide/16 v0, -0x1

    return-wide v0

    .line 53
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->streamIds:Lcom/badlogic/gdx/utils/IntArray;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lcom/badlogic/gdx/utils/IntArray;->insert(II)V

    int-to-long v0, p1

    return-wide v0
.end method

.method public play(FFF)J
    .locals 7

    .line 133
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->streamIds:Lcom/badlogic/gdx/utils/IntArray;

    iget v0, v0, Lcom/badlogic/gdx/utils/IntArray;->size:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->streamIds:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntArray;->pop()I

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    cmpg-float v2, p3, v1

    if-gez v2, :cond_1

    .line 137
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result p3

    sub-float/2addr v0, p3

    mul-float p3, p1, v0

    move v2, p1

    move v3, p3

    goto :goto_0

    :cond_1
    cmpl-float v1, p3, v1

    if-lez v1, :cond_2

    .line 139
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result p3

    sub-float/2addr v0, p3

    mul-float p3, p1, v0

    move v3, p1

    move v2, p3

    goto :goto_0

    :cond_2
    move v2, p1

    move v3, v2

    .line 141
    :goto_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundPool:Landroid/media/SoundPool;

    iget v1, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundId:I

    const/4 v4, 0x1

    const/4 v5, 0x0

    move v6, p2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result p1

    if-nez p1, :cond_3

    const-wide/16 p1, -0x1

    return-wide p1

    .line 144
    :cond_3
    iget-object p2, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->streamIds:Lcom/badlogic/gdx/utils/IntArray;

    const/4 p3, 0x0

    invoke-virtual {p2, p3, p1}, Lcom/badlogic/gdx/utils/IntArray;->insert(II)V

    int-to-long p1, p1

    return-wide p1
.end method

.method public resume()V
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Landroid/media/SoundPool;->autoResume()V

    return-void
.end method

.method public resume(J)V
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundPool:Landroid/media/SoundPool;

    long-to-int p2, p1

    invoke-virtual {v0, p2}, Landroid/media/SoundPool;->resume(I)V

    return-void
.end method

.method public setLooping(JZ)V
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundPool:Landroid/media/SoundPool;

    long-to-int p2, p1

    if-eqz p3, :cond_0

    const/4 p1, -0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {v0, p2, p1}, Landroid/media/SoundPool;->setLoop(II)V

    return-void
.end method

.method public setPan(JFF)V
    .locals 4

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    cmpg-float v2, p3, v1

    if-gez v2, :cond_0

    .line 123
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result p3

    sub-float/2addr v0, p3

    mul-float p3, p4, v0

    goto :goto_0

    :cond_0
    cmpl-float v1, p3, v1

    if-lez v1, :cond_1

    .line 125
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result p3

    sub-float/2addr v0, p3

    mul-float p3, p4, v0

    move v3, p4

    move p4, p3

    move p3, v3

    goto :goto_0

    :cond_1
    move p3, p4

    .line 128
    :goto_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundPool:Landroid/media/SoundPool;

    long-to-int p2, p1

    invoke-virtual {v0, p2, p4, p3}, Landroid/media/SoundPool;->setVolume(IFF)V

    return-void
.end method

.method public setPitch(JF)V
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundPool:Landroid/media/SoundPool;

    long-to-int p2, p1

    invoke-virtual {v0, p2, p3}, Landroid/media/SoundPool;->setRate(IF)V

    return-void
.end method

.method public setVolume(JF)V
    .locals 1

    .line 94
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundPool:Landroid/media/SoundPool;

    long-to-int p2, p1

    invoke-virtual {v0, p2, p3, p3}, Landroid/media/SoundPool;->setVolume(IFF)V

    return-void
.end method

.method public stop()V
    .locals 4

    .line 58
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->streamIds:Lcom/badlogic/gdx/utils/IntArray;

    iget v0, v0, Lcom/badlogic/gdx/utils/IntArray;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 59
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundPool:Landroid/media/SoundPool;

    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->streamIds:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v3, v1}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/media/SoundPool;->stop(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public stop(J)V
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidSound;->soundPool:Landroid/media/SoundPool;

    long-to-int p2, p1

    invoke-virtual {v0, p2}, Landroid/media/SoundPool;->stop(I)V

    return-void
.end method
