.class public Lcom/badlogic/gdx/backends/android/AndroidMusic;
.super Ljava/lang/Object;
.source "AndroidMusic.java"

# interfaces
.implements Lcom/badlogic/gdx/audio/Music;
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# instance fields
.field private final audio:Lcom/badlogic/gdx/backends/android/AndroidAudio;

.field private isPrepared:Z

.field protected onCompletionListener:Lcom/badlogic/gdx/audio/Music$OnCompletionListener;

.field private player:Landroid/media/MediaPlayer;

.field private volume:F

.field protected wasPlaying:Z


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/backends/android/AndroidAudio;Landroid/media/MediaPlayer;)V
    .locals 1

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 29
    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->isPrepared:Z

    const/4 v0, 0x0

    .line 30
    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->wasPlaying:Z

    const/high16 v0, 0x3f800000    # 1.0f

    .line 31
    iput v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->volume:F

    .line 35
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->audio:Lcom/badlogic/gdx/backends/android/AndroidAudio;

    .line 36
    iput-object p2, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    const/4 p1, 0x0

    .line 37
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->onCompletionListener:Lcom/badlogic/gdx/audio/Music$OnCompletionListener;

    .line 38
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    invoke-virtual {p1, p0}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 4

    .line 43
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x0

    .line 45
    :try_start_0
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 49
    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    .line 50
    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->onCompletionListener:Lcom/badlogic/gdx/audio/Music$OnCompletionListener;

    .line 51
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->audio:Lcom/badlogic/gdx/backends/android/AndroidAudio;

    iget-object v0, v0, Lcom/badlogic/gdx/backends/android/AndroidAudio;->musics:Ljava/util/List;

    monitor-enter v0

    .line 52
    :try_start_1
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->audio:Lcom/badlogic/gdx/backends/android/AndroidAudio;

    iget-object v1, v1, Lcom/badlogic/gdx/backends/android/AndroidAudio;->musics:Ljava/util/List;

    invoke-interface {v1, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 53
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    :catchall_1
    move-exception v0

    goto :goto_1

    .line 47
    :catch_0
    :try_start_2
    sget-object v0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    const-string v2, "AndroidMusic"

    const-string v3, "error while disposing AndroidMusic instance, non-fatal"

    invoke-interface {v0, v2, v3}, Lcom/badlogic/gdx/Application;->log(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 49
    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    .line 50
    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->onCompletionListener:Lcom/badlogic/gdx/audio/Music$OnCompletionListener;

    .line 51
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->audio:Lcom/badlogic/gdx/backends/android/AndroidAudio;

    iget-object v0, v0, Lcom/badlogic/gdx/backends/android/AndroidAudio;->musics:Ljava/util/List;

    monitor-enter v0

    .line 52
    :try_start_3
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->audio:Lcom/badlogic/gdx/backends/android/AndroidAudio;

    iget-object v1, v1, Lcom/badlogic/gdx/backends/android/AndroidAudio;->musics:Ljava/util/List;

    invoke-interface {v1, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 53
    monitor-exit v0

    :goto_0
    return-void

    :catchall_2
    move-exception v1

    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v1

    .line 49
    :goto_1
    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    .line 50
    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->onCompletionListener:Lcom/badlogic/gdx/audio/Music$OnCompletionListener;

    .line 51
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->audio:Lcom/badlogic/gdx/backends/android/AndroidAudio;

    iget-object v1, v1, Lcom/badlogic/gdx/backends/android/AndroidAudio;->musics:Ljava/util/List;

    monitor-enter v1

    .line 52
    :try_start_4
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->audio:Lcom/badlogic/gdx/backends/android/AndroidAudio;

    iget-object v2, v2, Lcom/badlogic/gdx/backends/android/AndroidAudio;->musics:Ljava/util/List;

    invoke-interface {v2, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 53
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    throw v0

    :catchall_3
    move-exception v0

    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    throw v0
.end method

.method public getDuration()F
    .locals 2

    .line 185
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 186
    :cond_0
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float/2addr v0, v1

    return v0
.end method

.method public getPosition()F
    .locals 2

    .line 180
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 181
    :cond_0
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float/2addr v0, v1

    return v0
.end method

.method public getVolume()F
    .locals 1

    .line 134
    iget v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->volume:F

    return v0
.end method

.method public isLooping()Z
    .locals 2

    .line 59
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 61
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isLooping()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v0

    .line 64
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    return v1
.end method

.method public isPlaying()Z
    .locals 2

    .line 71
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 73
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v0

    .line 76
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    return v1
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 1

    .line 196
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->onCompletionListener:Lcom/badlogic/gdx/audio/Music$OnCompletionListener;

    if-eqz p1, :cond_0

    .line 197
    sget-object p1, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidMusic$1;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/backends/android/AndroidMusic$1;-><init>(Lcom/badlogic/gdx/backends/android/AndroidMusic;)V

    invoke-interface {p1, v0}, Lcom/badlogic/gdx/Application;->postRunnable(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public pause()V
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    return-void

    .line 85
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 86
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 90
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 92
    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->wasPlaying:Z

    return-void
.end method

.method public play()V
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    return-void

    .line 99
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    if-eqz v0, :cond_1

    return-void

    .line 107
    :cond_1
    :try_start_1
    iget-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->isPrepared:Z

    if-nez v0, :cond_2

    .line 108
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    const/4 v0, 0x1

    .line 109
    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->isPrepared:Z

    .line 111
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 115
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v0

    .line 113
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    :goto_0
    return-void

    :catch_2
    move-exception v0

    .line 102
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method

.method public setLooping(Z)V
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    return-void

    .line 122
    :cond_0
    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setLooping(Z)V

    return-void
.end method

.method public setOnCompletionListener(Lcom/badlogic/gdx/audio/Music$OnCompletionListener;)V
    .locals 0

    .line 191
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->onCompletionListener:Lcom/badlogic/gdx/audio/Music$OnCompletionListener;

    return-void
.end method

.method public setPan(FF)V
    .locals 3

    .line 139
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    cmpg-float v2, p1, v1

    if-gez v2, :cond_1

    .line 144
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    sub-float/2addr v0, p1

    mul-float p1, p2, v0

    move v0, p1

    move p1, p2

    goto :goto_0

    :cond_1
    cmpl-float v1, p1, v1

    if-lez v1, :cond_2

    .line 146
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    sub-float/2addr v0, p1

    mul-float p1, p2, v0

    move v0, p2

    goto :goto_0

    :cond_2
    move p1, p2

    move v0, p1

    .line 149
    :goto_0
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v1, p1, v0}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 150
    iput p2, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->volume:F

    return-void
.end method

.method public setPosition(F)V
    .locals 2

    .line 164
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    return-void

    .line 166
    :cond_0
    :try_start_0
    iget-boolean v1, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->isPrepared:Z

    if-nez v1, :cond_1

    .line 167
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    const/4 v0, 0x1

    .line 168
    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->isPrepared:Z

    .line 170
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    const/high16 v1, 0x447a0000    # 1000.0f

    mul-float p1, p1, v1

    float-to-int p1, p1

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 174
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception p1

    .line 172
    invoke-virtual {p1}, Ljava/lang/IllegalStateException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public setVolume(F)V
    .locals 1

    .line 127
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    return-void

    .line 128
    :cond_0
    invoke-virtual {v0, p1, p1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 129
    iput p1, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->volume:F

    return-void
.end method

.method public stop()V
    .locals 3

    .line 155
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    return-void

    .line 156
    :cond_0
    iget-boolean v1, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->isPrepared:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 157
    invoke-virtual {v0, v2}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 159
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 160
    iput-boolean v2, p0, Lcom/badlogic/gdx/backends/android/AndroidMusic;->isPrepared:Z

    return-void
.end method
