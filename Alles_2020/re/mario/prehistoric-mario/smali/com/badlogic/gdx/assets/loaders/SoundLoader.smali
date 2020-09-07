.class public Lcom/badlogic/gdx/assets/loaders/SoundLoader;
.super Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;
.source "SoundLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/assets/loaders/SoundLoader$SoundParameter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader<",
        "Lcom/badlogic/gdx/audio/Sound;",
        "Lcom/badlogic/gdx/assets/loaders/SoundLoader$SoundParameter;",
        ">;"
    }
.end annotation


# instance fields
.field private sound:Lcom/badlogic/gdx/audio/Sound;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;-><init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Lcom/badlogic/gdx/utils/Array;
    .locals 0

    .line 29
    check-cast p3, Lcom/badlogic/gdx/assets/loaders/SoundLoader$SoundParameter;

    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/assets/loaders/SoundLoader;->getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/SoundLoader$SoundParameter;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    return-object p1
.end method

.method public getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/SoundLoader$SoundParameter;)Lcom/badlogic/gdx/utils/Array;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "Lcom/badlogic/gdx/assets/loaders/SoundLoader$SoundParameter;",
            ")",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/assets/AssetDescriptor;",
            ">;"
        }
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method

.method protected getLoadedSound()Lcom/badlogic/gdx/audio/Sound;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/badlogic/gdx/assets/loaders/SoundLoader;->sound:Lcom/badlogic/gdx/audio/Sound;

    return-object v0
.end method

.method public bridge synthetic loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)V
    .locals 0

    .line 29
    check-cast p4, Lcom/badlogic/gdx/assets/loaders/SoundLoader$SoundParameter;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/assets/loaders/SoundLoader;->loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/SoundLoader$SoundParameter;)V

    return-void
.end method

.method public loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/SoundLoader$SoundParameter;)V
    .locals 0

    .line 48
    sget-object p1, Lcom/badlogic/gdx/Gdx;->audio:Lcom/badlogic/gdx/Audio;

    invoke-interface {p1, p3}, Lcom/badlogic/gdx/Audio;->newSound(Lcom/badlogic/gdx/files/FileHandle;)Lcom/badlogic/gdx/audio/Sound;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/assets/loaders/SoundLoader;->sound:Lcom/badlogic/gdx/audio/Sound;

    return-void
.end method

.method public loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/SoundLoader$SoundParameter;)Lcom/badlogic/gdx/audio/Sound;
    .locals 0

    .line 53
    iget-object p1, p0, Lcom/badlogic/gdx/assets/loaders/SoundLoader;->sound:Lcom/badlogic/gdx/audio/Sound;

    const/4 p2, 0x0

    .line 54
    iput-object p2, p0, Lcom/badlogic/gdx/assets/loaders/SoundLoader;->sound:Lcom/badlogic/gdx/audio/Sound;

    return-object p1
.end method

.method public bridge synthetic loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Ljava/lang/Object;
    .locals 0

    .line 29
    check-cast p4, Lcom/badlogic/gdx/assets/loaders/SoundLoader$SoundParameter;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/assets/loaders/SoundLoader;->loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/SoundLoader$SoundParameter;)Lcom/badlogic/gdx/audio/Sound;

    move-result-object p1

    return-object p1
.end method
