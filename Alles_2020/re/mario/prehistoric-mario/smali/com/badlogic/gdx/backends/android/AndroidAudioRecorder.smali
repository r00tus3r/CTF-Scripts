.class public Lcom/badlogic/gdx/backends/android/AndroidAudioRecorder;
.super Ljava/lang/Object;
.source "AndroidAudioRecorder.java"

# interfaces
.implements Lcom/badlogic/gdx/audio/AudioRecorder;


# instance fields
.field private recorder:Landroid/media/AudioRecord;


# direct methods
.method public constructor <init>(IZ)V
    .locals 6

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p2, :cond_0

    const/16 p2, 0x10

    const/16 v3, 0x10

    goto :goto_0

    :cond_0
    const/16 p2, 0xc

    const/16 v3, 0xc

    :goto_0
    const/4 p2, 0x2

    .line 34
    invoke-static {p1, v3, p2}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result v5

    .line 35
    new-instance p2, Landroid/media/AudioRecord;

    const/4 v1, 0x1

    const/4 v4, 0x2

    move-object v0, p2

    move v2, p1

    invoke-direct/range {v0 .. v5}, Landroid/media/AudioRecord;-><init>(IIIII)V

    iput-object p2, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioRecorder;->recorder:Landroid/media/AudioRecord;

    .line 37
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioRecorder;->recorder:Landroid/media/AudioRecord;

    invoke-virtual {p1}, Landroid/media/AudioRecord;->getState()I

    move-result p1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_1

    .line 39
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioRecorder;->recorder:Landroid/media/AudioRecord;

    invoke-virtual {p1}, Landroid/media/AudioRecord;->startRecording()V

    return-void

    .line 38
    :cond_1
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Unable to initialize AudioRecorder.\nDo you have the RECORD_AUDIO permission?"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioRecorder;->recorder:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V

    .line 45
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioRecorder;->recorder:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    return-void
.end method

.method public read([SII)V
    .locals 4

    const/4 v0, 0x0

    :goto_0
    if-eq v0, p3, :cond_0

    .line 52
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidAudioRecorder;->recorder:Landroid/media/AudioRecord;

    add-int v2, p2, v0

    sub-int v3, p3, v0

    invoke-virtual {v1, p1, v2, v3}, Landroid/media/AudioRecord;->read([SII)I

    move-result v1

    add-int/2addr v0, v1

    goto :goto_0

    :cond_0
    return-void
.end method
