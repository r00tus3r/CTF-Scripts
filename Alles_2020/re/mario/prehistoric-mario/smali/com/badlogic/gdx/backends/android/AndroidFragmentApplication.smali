.class public Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;
.super Landroid/support/v4/app/Fragment;
.source "AndroidFragmentApplication.java"

# interfaces
.implements Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication$Callbacks;
    }
.end annotation


# instance fields
.field private final androidEventListeners:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/backends/android/AndroidEventListener;",
            ">;"
        }
    .end annotation
.end field

.field protected applicationLogger:Lcom/badlogic/gdx/ApplicationLogger;

.field protected audio:Lcom/badlogic/gdx/backends/android/AndroidAudio;

.field protected callbacks:Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication$Callbacks;

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

.field public handler:Landroid/os/Handler;

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

    .line 54
    invoke-static {}, Lcom/badlogic/gdx/utils/GdxNativesLoader;->load()V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 44
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    const/4 v0, 0x1

    .line 65
    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->firstResume:Z

    .line 66
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->runnables:Lcom/badlogic/gdx/utils/Array;

    .line 67
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->executedRunnables:Lcom/badlogic/gdx/utils/Array;

    .line 68
    new-instance v0, Lcom/badlogic/gdx/utils/SnapshotArray;

    const-class v1, Lcom/badlogic/gdx/LifecycleListener;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/SnapshotArray;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->lifecycleListeners:Lcom/badlogic/gdx/utils/SnapshotArray;

    .line 69
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->androidEventListeners:Lcom/badlogic/gdx/utils/Array;

    const/4 v0, 0x2

    .line 70
    iput v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->logLevel:I

    return-void
.end method

.method private isAnyParentFragmentRemoving()Z
    .locals 2

    .line 489
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getParentFragment()Landroid/support/v4/app/Fragment;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_1

    .line 492
    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->isRemoving()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    return v0

    .line 495
    :cond_0
    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->getParentFragment()Landroid/support/v4/app/Fragment;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public addAndroidEventListener(Lcom/badlogic/gdx/backends/android/AndroidEventListener;)V
    .locals 2

    .line 456
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->androidEventListeners:Lcom/badlogic/gdx/utils/Array;

    monitor-enter v0

    .line 457
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->androidEventListeners:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 458
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public addLifecycleListener(Lcom/badlogic/gdx/LifecycleListener;)V
    .locals 2

    .line 405
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->lifecycleListeners:Lcom/badlogic/gdx/utils/SnapshotArray;

    monitor-enter v0

    .line 406
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->lifecycleListeners:Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-virtual {v1, p1}, Lcom/badlogic/gdx/utils/SnapshotArray;->add(Ljava/lang/Object;)V

    .line 407
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

    .line 97
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0x11

    .line 99
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    return-object v0
.end method

.method protected createWakeLock(Z)V
    .locals 1

    if-eqz p1, :cond_0

    .line 105
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/app/FragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x80

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    :cond_0
    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 351
    iget v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->logLevel:I

    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    .line 352
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 358
    iget v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->logLevel:I

    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    .line 359
    invoke-static {p1, p2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 375
    iget v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->logLevel:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 380
    iget v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->logLevel:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    invoke-static {p1, p2, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    return-void
.end method

.method public exit()V
    .locals 2

    .line 341
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication$2;

    invoke-direct {v1, p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication$2;-><init>(Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public getApplicationListener()Lcom/badlogic/gdx/ApplicationListener;
    .locals 1

    .line 265
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->listener:Lcom/badlogic/gdx/ApplicationListener;

    return-object v0
.end method

.method public getApplicationLogger()Lcom/badlogic/gdx/ApplicationLogger;
    .locals 1

    .line 400
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->applicationLogger:Lcom/badlogic/gdx/ApplicationLogger;

    return-object v0
.end method

.method public getApplicationWindow()Landroid/view/Window;
    .locals 1

    .line 470
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    return-object v0
.end method

.method public getAudio()Lcom/badlogic/gdx/Audio;
    .locals 1

    .line 270
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->audio:Lcom/badlogic/gdx/backends/android/AndroidAudio;

    return-object v0
.end method

.method public getClipboard()Lcom/badlogic/gdx/utils/Clipboard;
    .locals 1

    .line 320
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->clipboard:Lcom/badlogic/gdx/backends/android/AndroidClipboard;

    return-object v0
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .line 419
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    return-object v0
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

    .line 429
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->executedRunnables:Lcom/badlogic/gdx/utils/Array;

    return-object v0
.end method

.method public getFiles()Lcom/badlogic/gdx/Files;
    .locals 1

    .line 275
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->files:Lcom/badlogic/gdx/backends/android/AndroidFiles;

    return-object v0
.end method

.method public getGraphics()Lcom/badlogic/gdx/Graphics;
    .locals 1

    .line 280
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    return-object v0
.end method

.method public getHandler()Landroid/os/Handler;
    .locals 1

    .line 475
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method public bridge synthetic getInput()Lcom/badlogic/gdx/Input;
    .locals 1

    .line 44
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getInput()Lcom/badlogic/gdx/backends/android/AndroidInput;

    move-result-object v0

    return-object v0
.end method

.method public getInput()Lcom/badlogic/gdx/backends/android/AndroidInput;
    .locals 1

    .line 285
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->input:Lcom/badlogic/gdx/backends/android/AndroidInput;

    return-object v0
.end method

.method public getJavaHeap()J
    .locals 4

    .line 305
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

    .line 439
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->lifecycleListeners:Lcom/badlogic/gdx/utils/SnapshotArray;

    return-object v0
.end method

.method public getLogLevel()I
    .locals 1

    .line 390
    iget v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->logLevel:I

    return v0
.end method

.method public getNativeHeap()J
    .locals 2

    .line 310
    invoke-static {}, Landroid/os/Debug;->getNativeHeapAllocatedSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public getNet()Lcom/badlogic/gdx/Net;
    .locals 1

    .line 290
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->net:Lcom/badlogic/gdx/backends/android/AndroidNet;

    return-object v0
.end method

.method public getPreferences(Ljava/lang/String;)Lcom/badlogic/gdx/Preferences;
    .locals 3

    .line 315
    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidPreferences;

    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/support/v4/app/FragmentActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

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

    .line 424
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->runnables:Lcom/badlogic/gdx/utils/Array;

    return-object v0
.end method

.method public getType()Lcom/badlogic/gdx/Application$ApplicationType;
    .locals 1

    .line 295
    sget-object v0, Lcom/badlogic/gdx/Application$ApplicationType;->Android:Lcom/badlogic/gdx/Application$ApplicationType;

    return-object v0
.end method

.method public getVersion()I
    .locals 1

    .line 300
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    return v0
.end method

.method public getWindowManager()Landroid/view/WindowManager;
    .locals 2

    .line 480
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    return-object v0
.end method

.method public initializeForView(Lcom/badlogic/gdx/ApplicationListener;)Landroid/view/View;
    .locals 1

    .line 137
    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;

    invoke-direct {v0}, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;-><init>()V

    .line 138
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->initializeForView(Lcom/badlogic/gdx/ApplicationListener;Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public initializeForView(Lcom/badlogic/gdx/ApplicationListener;Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;)Landroid/view/View;
    .locals 5

    .line 154
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getVersion()I

    move-result v0

    const/16 v1, 0x9

    if-lt v0, v1, :cond_3

    .line 157
    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidApplicationLogger;

    invoke-direct {v0}, Lcom/badlogic/gdx/backends/android/AndroidApplicationLogger;-><init>()V

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->setApplicationLogger(Lcom/badlogic/gdx/ApplicationLogger;)V

    .line 158
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

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    .line 160
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    iget-object v1, v1, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->view:Landroid/view/View;

    invoke-static {p0, v0, v1, p2}, Lcom/badlogic/gdx/backends/android/AndroidInputFactory;->newAndroidInput(Lcom/badlogic/gdx/Application;Landroid/content/Context;Ljava/lang/Object;Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;)Lcom/badlogic/gdx/backends/android/AndroidInput;

    move-result-object v0

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->input:Lcom/badlogic/gdx/backends/android/AndroidInput;

    .line 161
    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidAudio;

    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Lcom/badlogic/gdx/backends/android/AndroidAudio;-><init>(Landroid/content/Context;Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;)V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->audio:Lcom/badlogic/gdx/backends/android/AndroidAudio;

    .line 162
    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidFiles;

    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/badlogic/gdx/backends/android/AndroidFiles;-><init>(Landroid/content/res/AssetManager;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->files:Lcom/badlogic/gdx/backends/android/AndroidFiles;

    .line 163
    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidNet;

    invoke-direct {v0, p0, p2}, Lcom/badlogic/gdx/backends/android/AndroidNet;-><init>(Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;)V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->net:Lcom/badlogic/gdx/backends/android/AndroidNet;

    .line 164
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->listener:Lcom/badlogic/gdx/ApplicationListener;

    .line 165
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->handler:Landroid/os/Handler;

    .line 166
    new-instance p1, Lcom/badlogic/gdx/backends/android/AndroidClipboard;

    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/backends/android/AndroidClipboard;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->clipboard:Lcom/badlogic/gdx/backends/android/AndroidClipboard;

    .line 169
    new-instance p1, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication$1;

    invoke-direct {p1, p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication$1;-><init>(Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;)V

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->addLifecycleListener(Lcom/badlogic/gdx/LifecycleListener;)V

    .line 187
    sput-object p0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    .line 188
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getInput()Lcom/badlogic/gdx/backends/android/AndroidInput;

    move-result-object p1

    sput-object p1, Lcom/badlogic/gdx/Gdx;->input:Lcom/badlogic/gdx/Input;

    .line 189
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getAudio()Lcom/badlogic/gdx/Audio;

    move-result-object p1

    sput-object p1, Lcom/badlogic/gdx/Gdx;->audio:Lcom/badlogic/gdx/Audio;

    .line 190
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getFiles()Lcom/badlogic/gdx/Files;

    move-result-object p1

    sput-object p1, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    .line 191
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getGraphics()Lcom/badlogic/gdx/Graphics;

    move-result-object p1

    sput-object p1, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    .line 192
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getNet()Lcom/badlogic/gdx/Net;

    move-result-object p1

    sput-object p1, Lcom/badlogic/gdx/Gdx;->net:Lcom/badlogic/gdx/Net;

    .line 193
    iget-boolean p1, p2, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->useWakelock:Z

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->createWakeLock(Z)V

    .line 194
    iget-boolean p1, p2, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->useImmersiveMode:Z

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->useImmersiveMode(Z)V

    .line 195
    iget-boolean p1, p2, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->useImmersiveMode:Z

    const/4 p2, 0x1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getVersion()I

    move-result p1

    const/16 v0, 0x13

    if-lt p1, v0, :cond_1

    :try_start_0
    const-string p1, "com.badlogic.gdx.backends.android.AndroidVisibilityListener"

    .line 197
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    .line 198
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "createListener"

    .line 199
    new-array v2, p2, [Ljava/lang/Class;

    const-class v3, Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {p1, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    .line 200
    new-array v1, p2, [Ljava/lang/Object;

    aput-object p0, v1, v4

    invoke-virtual {p1, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    const-string v0, "AndroidApplication"

    const-string v1, "Failed to create AndroidVisibilityListener"

    .line 202
    invoke-virtual {p0, v0, v1, p1}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 207
    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget p1, p1, Landroid/content/res/Configuration;->keyboard:I

    if-eq p1, p2, :cond_2

    .line 208
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getInput()Lcom/badlogic/gdx/backends/android/AndroidInput;

    move-result-object p1

    iput-boolean p2, p1, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyboardAvailable:Z

    .line 209
    :cond_2
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {p1}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->getView()Landroid/view/View;

    move-result-object p1

    return-object p1

    .line 155
    :cond_3
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "LibGDX requires Android API Level 9 or later."

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public log(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 365
    iget v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->logLevel:I

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 370
    iget v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->logLevel:I

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    invoke-static {p1, p2, p3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3

    .line 444
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 447
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->androidEventListeners:Lcom/badlogic/gdx/utils/Array;

    monitor-enter v0

    const/4 v1, 0x0

    .line 448
    :goto_0
    :try_start_0
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->androidEventListeners:Lcom/badlogic/gdx/utils/Array;

    iget v2, v2, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v1, v2, :cond_0

    .line 449
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->androidEventListeners:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/backends/android/AndroidEventListener;

    invoke-interface {v2, p1, p2, p3}, Lcom/badlogic/gdx/backends/android/AndroidEventListener;->onActivityResult(IILandroid/content/Intent;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 451
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1

    .line 77
    instance-of v0, p1, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication$Callbacks;

    if-eqz v0, :cond_0

    .line 78
    move-object v0, p1

    check-cast v0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication$Callbacks;

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->callbacks:Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication$Callbacks;

    goto :goto_0

    .line 79
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getParentFragment()Landroid/support/v4/app/Fragment;

    move-result-object v0

    instance-of v0, v0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication$Callbacks;

    if-eqz v0, :cond_1

    .line 80
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getParentFragment()Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication$Callbacks;

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->callbacks:Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication$Callbacks;

    goto :goto_0

    .line 81
    :cond_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getTargetFragment()Landroid/support/v4/app/Fragment;

    move-result-object v0

    instance-of v0, v0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication$Callbacks;

    if-eqz v0, :cond_2

    .line 82
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getTargetFragment()Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication$Callbacks;

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->callbacks:Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication$Callbacks;

    .line 87
    :goto_0
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onAttach(Landroid/app/Activity;)V

    return-void

    .line 84
    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Missing AndroidFragmentApplication.Callbacks. Please implement AndroidFragmentApplication.Callbacks on the parent activity, fragment or target fragment."

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .line 333
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 335
    iget p1, p1, Landroid/content/res/Configuration;->hardKeyboardHidden:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 336
    :goto_0
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->input:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iput-boolean v0, p1, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyboardAvailable:Z

    return-void
.end method

.method public onDetach()V
    .locals 1

    .line 92
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDetach()V

    const/4 v0, 0x0

    .line 93
    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->callbacks:Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication$Callbacks;

    return-void
.end method

.method public onPause()V
    .locals 4

    .line 214
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {v0}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->isContinuousRendering()Z

    move-result v0

    .line 215
    sget-boolean v1, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->enforceContinuousRendering:Z

    const/4 v2, 0x1

    .line 218
    sput-boolean v2, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->enforceContinuousRendering:Z

    .line 219
    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {v3, v2}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->setContinuousRendering(Z)V

    .line 222
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {v2}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->pause()V

    .line 224
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->input:Lcom/badlogic/gdx/backends/android/AndroidInput;

    invoke-virtual {v2}, Lcom/badlogic/gdx/backends/android/AndroidInput;->onPause()V

    .line 228
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->isRemoving()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-direct {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->isAnyParentFragmentRemoving()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->isFinishing()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 229
    :cond_0
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {v2}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->clearManagedCaches()V

    .line 230
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {v2}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->destroy()V

    .line 233
    :cond_1
    sput-boolean v1, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->enforceContinuousRendering:Z

    .line 234
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->setContinuousRendering(Z)V

    .line 236
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {v0}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->onPauseGLSurfaceView()V

    .line 238
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 1

    .line 243
    sput-object p0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    .line 244
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getInput()Lcom/badlogic/gdx/backends/android/AndroidInput;

    move-result-object v0

    sput-object v0, Lcom/badlogic/gdx/Gdx;->input:Lcom/badlogic/gdx/Input;

    .line 245
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getAudio()Lcom/badlogic/gdx/Audio;

    move-result-object v0

    sput-object v0, Lcom/badlogic/gdx/Gdx;->audio:Lcom/badlogic/gdx/Audio;

    .line 246
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getFiles()Lcom/badlogic/gdx/Files;

    move-result-object v0

    sput-object v0, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    .line 247
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getGraphics()Lcom/badlogic/gdx/Graphics;

    move-result-object v0

    sput-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    .line 248
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getNet()Lcom/badlogic/gdx/Net;

    move-result-object v0

    sput-object v0, Lcom/badlogic/gdx/Gdx;->net:Lcom/badlogic/gdx/Net;

    .line 250
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->input:Lcom/badlogic/gdx/backends/android/AndroidInput;

    invoke-virtual {v0}, Lcom/badlogic/gdx/backends/android/AndroidInput;->onResume()V

    .line 252
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    if-eqz v0, :cond_0

    .line 253
    invoke-virtual {v0}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->onResumeGLSurfaceView()V

    .line 256
    :cond_0
    iget-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->firstResume:Z

    if-nez v0, :cond_1

    .line 257
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {v0}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->resume()V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 259
    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->firstResume:Z

    .line 260
    :goto_0
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onResume()V

    return-void
.end method

.method public postRunnable(Ljava/lang/Runnable;)V
    .locals 2

    .line 325
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->runnables:Lcom/badlogic/gdx/utils/Array;

    monitor-enter v0

    .line 326
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->runnables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 327
    sget-object p1, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {p1}, Lcom/badlogic/gdx/Graphics;->requestRendering()V

    .line 328
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public removeAndroidEventListener(Lcom/badlogic/gdx/backends/android/AndroidEventListener;)V
    .locals 3

    .line 463
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->androidEventListeners:Lcom/badlogic/gdx/utils/Array;

    monitor-enter v0

    .line 464
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->androidEventListeners:Lcom/badlogic/gdx/utils/Array;

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v2}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    .line 465
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

    .line 412
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->lifecycleListeners:Lcom/badlogic/gdx/utils/SnapshotArray;

    monitor-enter v0

    .line 413
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->lifecycleListeners:Lcom/badlogic/gdx/utils/SnapshotArray;

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v2}, Lcom/badlogic/gdx/utils/SnapshotArray;->removeValue(Ljava/lang/Object;Z)Z

    .line 414
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
    .locals 1

    .line 434
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v4/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setApplicationLogger(Lcom/badlogic/gdx/ApplicationLogger;)V
    .locals 0

    .line 395
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->applicationLogger:Lcom/badlogic/gdx/ApplicationLogger;

    return-void
.end method

.method public setLogLevel(I)V
    .locals 0

    .line 385
    iput p1, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->logLevel:I

    return-void
.end method

.method public useImmersiveMode(Z)V
    .locals 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    if-eqz p1, :cond_1

    .line 112
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->getVersion()I

    move-result p1

    const/16 v0, 0x13

    if-ge p1, v0, :cond_0

    goto :goto_0

    .line 115
    :cond_0
    :try_start_0
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->graphics:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {p1}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->getView()Landroid/view/View;

    move-result-object p1

    .line 117
    const-class v0, Landroid/view/View;

    const-string v1, "setSystemUiVisibility"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/16 v1, 0x1706

    .line 121
    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v2, v5

    invoke-virtual {v0, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "AndroidApplication"

    const-string v1, "Failed to setup immersive mode, a throwable has occurred."

    .line 123
    invoke-virtual {p0, v0, v1, p1}, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    return-void
.end method
