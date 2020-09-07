.class public Lcom/badlogic/gdx/backends/android/AndroidDaydream;
.super Landroid/service/dreams/DreamService;
.source "AndroidDaydream.java"

# interfaces
.implements Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;


# instance fields
.field protected applicationLogger:Lcom/badlogic/gdx/ApplicationLogger;

.field protected audio:Lcom/badlogic/gdx/backends/android/AndroidAudio;

.field protected clipboard:Lcom/badlogic/gdx/backends/android/AndroidClipboard;

.field protected final executedRunnables:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field protected files:Lcom/badlogic/gdx/backends/android/AndroidFiles;

.field protected firstResume:Z

.field protected graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

.field protected handler:Landroid/os/Handler;

.field protected input:Lcom/badlogic/gdx/backends/android/AndroidInput;

.field protected final lifecycleListeners:Lcom/badlogic/gdx/utils/SnapshotArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/SnapshotArray<",
            "Lcom/badlogic/gdx/LifecycleListener;",
            ">;"
        }
    .end annotation
.end field

.field protected listener:Lcom/badlogic/gdx/ApplicationListener;

.field protected logLevel:I

.field protected net:Lcom/badlogic/gdx/backends/android/AndroidNet;

.field protected final runnables:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 64
    invoke-static {}, Lcom/badlogic/gdx/utils/GdxNativesLoader;->load()V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 62
    invoke-direct {p0}, Landroid/service/dreams/DreamService;-><init>()V

    const/4 v0, 0x1

    .line 75
    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->firstResume:Z

    .line 76
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->runnables:Lcom/badlogic/gdx/utils/Array;

    .line 77
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->executedRunnables:Lcom/badlogic/gdx/utils/Array;

    .line 78
    new-instance v0, Lcom/badlogic/gdx/utils/SnapshotArray;

    const-class v1, Lcom/badlogic/gdx/LifecycleListener;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/SnapshotArray;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->lifecycleListeners:Lcom/badlogic/gdx/utils/SnapshotArray;

    const/4 v0, 0x2

    .line 79
    iput v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->logLevel:I

    return-void
.end method

.method private init(Lcom/badlogic/gdx/ApplicationListener;Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;Z)V
    .locals 3

    .line 126
    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidApplicationLogger;

    invoke-direct {v0}, Lcom/badlogic/gdx/backends/android/AndroidApplicationLogger;-><init>()V

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->setApplicationLogger(Lcom/badlogic/gdx/ApplicationLogger;)V

    .line 127
    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    iget-object v1, p2, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->resolutionStrategy:Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy;

    if-nez v1, :cond_0

    new-instance v1, Lcom/badlogic/gdx/backends/android/surfaceview/FillResolutionStrategy;

    invoke-direct {v1}, Lcom/badlogic/gdx/backends/android/surfaceview/FillResolutionStrategy;-><init>()V

    goto :goto_0

    :cond_0
    iget-object v1, p2, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->resolutionStrategy:Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy;

    :goto_0
    invoke-direct {v0, p0, p2, v1}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;-><init>(Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy;)V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    .line 129
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    iget-object v0, v0, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->view:Landroid/view/View;

    invoke-static {p0, p0, v0, p2}, Lcom/badlogic/gdx/backends/android/AndroidInputFactory;->newAndroidInput(Lcom/badlogic/gdx/Application;Landroid/content/Context;Ljava/lang/Object;Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;)Lcom/badlogic/gdx/backends/android/AndroidInput;

    move-result-object v0

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->input:Lcom/badlogic/gdx/backends/android/AndroidInput;

    .line 130
    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidAudio;

    invoke-direct {v0, p0, p2}, Lcom/badlogic/gdx/backends/android/AndroidAudio;-><init>(Landroid/content/Context;Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;)V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->audio:Lcom/badlogic/gdx/backends/android/AndroidAudio;

    .line 131
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getFilesDir()Ljava/io/File;

    .line 132
    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidFiles;

    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/badlogic/gdx/backends/android/AndroidFiles;-><init>(Landroid/content/res/AssetManager;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->files:Lcom/badlogic/gdx/backends/android/AndroidFiles;

    .line 133
    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidNet;

    invoke-direct {v0, p0, p2}, Lcom/badlogic/gdx/backends/android/AndroidNet;-><init>(Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;)V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->net:Lcom/badlogic/gdx/backends/android/AndroidNet;

    .line 134
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->listener:Lcom/badlogic/gdx/ApplicationListener;

    .line 135
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->handler:Landroid/os/Handler;

    .line 136
    new-instance p1, Lcom/badlogic/gdx/backends/android/AndroidClipboard;

    invoke-direct {p1, p0}, Lcom/badlogic/gdx/backends/android/AndroidClipboard;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->clipboard:Lcom/badlogic/gdx/backends/android/AndroidClipboard;

    .line 139
    new-instance p1, Lcom/badlogic/gdx/backends/android/AndroidDaydream$1;

    invoke-direct {p1, p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream$1;-><init>(Lcom/badlogic/gdx/backends/android/AndroidDaydream;)V

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->addLifecycleListener(Lcom/badlogic/gdx/LifecycleListener;)V

    .line 158
    sput-object p0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    .line 159
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getInput()Lcom/badlogic/gdx/backends/android/AndroidInput;

    move-result-object p1

    sput-object p1, Lcom/badlogic/gdx/Gdx;->input:Lcom/badlogic/gdx/Input;

    .line 160
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getAudio()Lcom/badlogic/gdx/Audio;

    move-result-object p1

    sput-object p1, Lcom/badlogic/gdx/Gdx;->audio:Lcom/badlogic/gdx/Audio;

    .line 161
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getFiles()Lcom/badlogic/gdx/Files;

    move-result-object p1

    sput-object p1, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    .line 162
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getGraphics()Lcom/badlogic/gdx/Graphics;

    move-result-object p1

    sput-object p1, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    .line 163
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getNet()Lcom/badlogic/gdx/Net;

    move-result-object p1

    sput-object p1, Lcom/badlogic/gdx/Gdx;->net:Lcom/badlogic/gdx/Net;

    const/4 p1, 0x1

    if-nez p3, :cond_1

    .line 166
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->setFullscreen(Z)V

    .line 167
    iget-object p3, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {p3}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->getView()Landroid/view/View;

    move-result-object p3

    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->createLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    invoke-virtual {p0, p3, v0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 170
    :cond_1
    iget-boolean p3, p2, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->useWakelock:Z

    invoke-virtual {p0, p3}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->createWakeLock(Z)V

    .line 171
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->hideStatusBar(Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;)V

    .line 174
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p2

    iget p2, p2, Landroid/content/res/Configuration;->keyboard:I

    if-eq p2, p1, :cond_2

    .line 175
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getInput()Lcom/badlogic/gdx/backends/android/AndroidInput;

    move-result-object p2

    iput-boolean p1, p2, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyboardAvailable:Z

    :cond_2
    return-void
.end method


# virtual methods
.method public addLifecycleListener(Lcom/badlogic/gdx/LifecycleListener;)V
    .locals 2

    .line 393
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->lifecycleListeners:Lcom/badlogic/gdx/utils/SnapshotArray;

    monitor-enter v0

    .line 394
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->lifecycleListeners:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v1, p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->add(Ljava/lang/Object;)V

    .line 395
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method protected createLayoutParams()Landroid/widget/FrameLayout$LayoutParams;
    .locals 2

    .line 179
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0x11

    .line 181
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    return-object v0
.end method

.method protected createWakeLock(Z)V
    .locals 1

    if-eqz p1, :cond_0

    .line 187
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x80

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    :cond_0
    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 343
    iget v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->logLevel:I

    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getApplicationLogger()Lcom/badlogic/gdx/ApplicationLogger;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/badlogic/gdx/ApplicationLogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 348
    iget v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->logLevel:I

    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getApplicationLogger()Lcom/badlogic/gdx/ApplicationLogger;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lcom/badlogic/gdx/ApplicationLogger;->debug(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 363
    iget v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->logLevel:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getApplicationLogger()Lcom/badlogic/gdx/ApplicationLogger;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/badlogic/gdx/ApplicationLogger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 368
    iget v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->logLevel:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getApplicationLogger()Lcom/badlogic/gdx/ApplicationLogger;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lcom/badlogic/gdx/ApplicationLogger;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public exit()V
    .locals 2

    .line 333
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/badlogic/gdx/backends/android/AndroidDaydream$2;

    invoke-direct {v1, p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream$2;-><init>(Lcom/badlogic/gdx/backends/android/AndroidDaydream;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public getApplicationListener()Lcom/badlogic/gdx/ApplicationListener;
    .locals 1

    .line 257
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->listener:Lcom/badlogic/gdx/ApplicationListener;

    return-object v0
.end method

.method public getApplicationLogger()Lcom/badlogic/gdx/ApplicationLogger;
    .locals 1

    .line 388
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->applicationLogger:Lcom/badlogic/gdx/ApplicationLogger;

    return-object v0
.end method

.method public getApplicationWindow()Landroid/view/Window;
    .locals 1

    .line 427
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getWindow()Landroid/view/Window;

    move-result-object v0

    return-object v0
.end method

.method public getAudio()Lcom/badlogic/gdx/Audio;
    .locals 1

    .line 262
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->audio:Lcom/badlogic/gdx/backends/android/AndroidAudio;

    return-object v0
.end method

.method public getClipboard()Lcom/badlogic/gdx/utils/Clipboard;
    .locals 1

    .line 312
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->clipboard:Lcom/badlogic/gdx/backends/android/AndroidClipboard;

    return-object v0
.end method

.method public getContext()Landroid/content/Context;
    .locals 0

    return-object p0
.end method

.method public getExecutedRunnables()Lcom/badlogic/gdx/utils/Array;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/Array<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation

    .line 417
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->executedRunnables:Lcom/badlogic/gdx/utils/Array;

    return-object v0
.end method

.method public getFiles()Lcom/badlogic/gdx/Files;
    .locals 1

    .line 267
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->files:Lcom/badlogic/gdx/backends/android/AndroidFiles;

    return-object v0
.end method

.method public getGraphics()Lcom/badlogic/gdx/Graphics;
    .locals 1

    .line 272
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    return-object v0
.end method

.method public getHandler()Landroid/os/Handler;
    .locals 1

    .line 432
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method public bridge synthetic getInput()Lcom/badlogic/gdx/Input;
    .locals 1

    .line 62
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getInput()Lcom/badlogic/gdx/backends/android/AndroidInput;

    move-result-object v0

    return-object v0
.end method

.method public getInput()Lcom/badlogic/gdx/backends/android/AndroidInput;
    .locals 1

    .line 277
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->input:Lcom/badlogic/gdx/backends/android/AndroidInput;

    return-object v0
.end method

.method public getJavaHeap()J
    .locals 4

    .line 297
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->totalMemory()J

    move-result-wide v0

    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Runtime;->freeMemory()J

    move-result-wide v2

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public getLifecycleListeners()Lcom/badlogic/gdx/utils/SnapshotArray;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/SnapshotArray<",
            "Lcom/badlogic/gdx/LifecycleListener;",
            ">;"
        }
    .end annotation

    .line 422
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->lifecycleListeners:Lcom/badlogic/gdx/utils/SnapshotArray;

    return-object v0
.end method

.method public getLogLevel()I
    .locals 1

    .line 378
    iget v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->logLevel:I

    return v0
.end method

.method public getNativeHeap()J
    .locals 2

    .line 302
    invoke-static {}, Landroid/os/Debug;->getNativeHeapAllocatedSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public getNet()Lcom/badlogic/gdx/Net;
    .locals 1

    .line 282
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->net:Lcom/badlogic/gdx/backends/android/AndroidNet;

    return-object v0
.end method

.method public getPreferences(Ljava/lang/String;)Lcom/badlogic/gdx/Preferences;
    .locals 2

    .line 307
    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/backends/android/AndroidPreferences;-><init>(Landroid/content/SharedPreferences;)V

    return-object v0
.end method

.method public getRunnables()Lcom/badlogic/gdx/utils/Array;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/Array<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation

    .line 412
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->runnables:Lcom/badlogic/gdx/utils/Array;

    return-object v0
.end method

.method public getType()Lcom/badlogic/gdx/Application$ApplicationType;
    .locals 1

    .line 287
    sget-object v0, Lcom/badlogic/gdx/Application$ApplicationType;->Android:Lcom/badlogic/gdx/Application$ApplicationType;

    return-object v0
.end method

.method public getVersion()I
    .locals 1

    .line 292
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    return v0
.end method

.method protected hideStatusBar(Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;)V
    .locals 6

    .line 192
    iget-boolean p1, p1, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->hideStatusBar:Z

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getVersion()I

    move-result p1

    const/16 v0, 0xb

    if-ge p1, v0, :cond_0

    goto :goto_0

    .line 194
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    .line 197
    :try_start_0
    const-class v0, Landroid/view/View;

    const-string v1, "setSystemUiVisibility"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 198
    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v5

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "AndroidApplication"

    const-string v1, "Can\'t hide status bar"

    .line 201
    invoke-virtual {p0, v0, v1, p1}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public initialize(Lcom/badlogic/gdx/ApplicationListener;)V
    .locals 1

    .line 86
    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;

    invoke-direct {v0}, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;-><init>()V

    .line 87
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->initialize(Lcom/badlogic/gdx/ApplicationListener;Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;)V

    return-void
.end method

.method public initialize(Lcom/badlogic/gdx/ApplicationListener;Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;)V
    .locals 1

    const/4 v0, 0x0

    .line 97
    invoke-direct {p0, p1, p2, v0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->init(Lcom/badlogic/gdx/ApplicationListener;Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;Z)V

    return-void
.end method

.method public initializeForView(Lcom/badlogic/gdx/ApplicationListener;)Landroid/view/View;
    .locals 1

    .line 107
    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;

    invoke-direct {v0}, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;-><init>()V

    .line 108
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->initializeForView(Lcom/badlogic/gdx/ApplicationListener;Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public initializeForView(Lcom/badlogic/gdx/ApplicationListener;Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;)Landroid/view/View;
    .locals 1

    const/4 v0, 0x1

    .line 121
    invoke-direct {p0, p1, p2, v0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->init(Lcom/badlogic/gdx/ApplicationListener;Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;Z)V

    .line 122
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {p1}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->getView()Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public log(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 353
    iget v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->logLevel:I

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getApplicationLogger()Lcom/badlogic/gdx/ApplicationLogger;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/badlogic/gdx/ApplicationLogger;->log(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 358
    iget v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->logLevel:I

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getApplicationLogger()Lcom/badlogic/gdx/ApplicationLogger;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lcom/badlogic/gdx/ApplicationLogger;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .line 325
    invoke-super {p0, p1}, Landroid/service/dreams/DreamService;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 327
    iget p1, p1, Landroid/content/res/Configuration;->hardKeyboardHidden:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 328
    :goto_0
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->input:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iput-boolean v0, p1, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyboardAvailable:Z

    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 252
    invoke-super {p0}, Landroid/service/dreams/DreamService;->onDetachedFromWindow()V

    return-void
.end method

.method public onDreamingStarted()V
    .locals 1

    .line 230
    sput-object p0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    .line 231
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getInput()Lcom/badlogic/gdx/backends/android/AndroidInput;

    move-result-object v0

    sput-object v0, Lcom/badlogic/gdx/Gdx;->input:Lcom/badlogic/gdx/Input;

    .line 232
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getAudio()Lcom/badlogic/gdx/Audio;

    move-result-object v0

    sput-object v0, Lcom/badlogic/gdx/Gdx;->audio:Lcom/badlogic/gdx/Audio;

    .line 233
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getFiles()Lcom/badlogic/gdx/Files;

    move-result-object v0

    sput-object v0, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    .line 234
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getGraphics()Lcom/badlogic/gdx/Graphics;

    move-result-object v0

    sput-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    .line 235
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getNet()Lcom/badlogic/gdx/Net;

    move-result-object v0

    sput-object v0, Lcom/badlogic/gdx/Gdx;->net:Lcom/badlogic/gdx/Net;

    .line 237
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->getInput()Lcom/badlogic/gdx/backends/android/AndroidInput;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/backends/android/AndroidInput;->registerSensorListeners()V

    .line 239
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    if-eqz v0, :cond_0

    .line 240
    invoke-virtual {v0}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->onResumeGLSurfaceView()V

    .line 243
    :cond_0
    iget-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->firstResume:Z

    if-nez v0, :cond_1

    .line 244
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {v0}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->resume()V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 246
    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->firstResume:Z

    .line 247
    :goto_0
    invoke-super {p0}, Landroid/service/dreams/DreamService;->onDreamingStarted()V

    return-void
.end method

.method public onDreamingStopped()V
    .locals 3

    .line 207
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {v0}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->isContinuousRendering()Z

    move-result v0

    .line 208
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->setContinuousRendering(Z)V

    .line 209
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {v1}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->pause()V

    .line 211
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->input:Lcom/badlogic/gdx/backends/android/AndroidInput;

    invoke-virtual {v1}, Lcom/badlogic/gdx/backends/android/AndroidInput;->unregisterSensorListeners()V

    .line 213
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->input:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v1, v1, Lcom/badlogic/gdx/backends/android/AndroidInput;->realId:[I

    const/4 v2, -0x1

    .line 215
    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([II)V

    .line 216
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->input:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v1, v1, Lcom/badlogic/gdx/backends/android/AndroidInput;->touched:[Z

    const/4 v2, 0x0

    .line 218
    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([ZZ)V

    .line 219
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {v1}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->clearManagedCaches()V

    .line 220
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {v1}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->destroy()V

    .line 221
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->setContinuousRendering(Z)V

    .line 223
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {v0}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->onPauseGLSurfaceView()V

    .line 225
    invoke-super {p0}, Landroid/service/dreams/DreamService;->onDreamingStopped()V

    return-void
.end method

.method public postRunnable(Ljava/lang/Runnable;)V
    .locals 2

    .line 317
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->runnables:Lcom/badlogic/gdx/utils/Array;

    monitor-enter v0

    .line 318
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->runnables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 319
    sget-object p1, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {p1}, Lcom/badlogic/gdx/Graphics;->requestRendering()V

    .line 320
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public removeLifecycleListener(Lcom/badlogic/gdx/LifecycleListener;)V
    .locals 3

    .line 400
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->lifecycleListeners:Lcom/badlogic/gdx/utils/SnapshotArray;

    monitor-enter v0

    .line 401
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->lifecycleListeners:Lcom/badlogic/gdx/utils/SnapshotArray;

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v2}, Lcom/badlogic/gdx/utils/SnapshotArray;->removeValue(Ljava/lang/Object;Z)Z

    .line 402
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public runOnUiThread(Ljava/lang/Runnable;)V
    .locals 2

    .line 437
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 440
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 444
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :goto_0
    return-void
.end method

.method public setApplicationLogger(Lcom/badlogic/gdx/ApplicationLogger;)V
    .locals 0

    .line 383
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->applicationLogger:Lcom/badlogic/gdx/ApplicationLogger;

    return-void
.end method

.method public setLogLevel(I)V
    .locals 0

    .line 373
    iput p1, p0, Lcom/badlogic/gdx/backends/android/AndroidDaydream;->logLevel:I

    return-void
.end method

.method public useImmersiveMode(Z)V
    .locals 0

    .line 450
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method
