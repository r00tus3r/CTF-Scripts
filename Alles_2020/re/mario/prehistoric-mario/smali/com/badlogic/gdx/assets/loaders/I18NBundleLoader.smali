.class public Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader;
.super Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;
.source "I18NBundleLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader$I18NBundleParameter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader<",
        "Lcom/badlogic/gdx/utils/I18NBundle;",
        "Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader$I18NBundleParameter;",
        ">;"
    }
.end annotation


# instance fields
.field bundle:Lcom/badlogic/gdx/utils/I18NBundle;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V
    .locals 0

    .line 48
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;-><init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Lcom/badlogic/gdx/utils/Array;
    .locals 0

    .line 45
    check-cast p3, Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader$I18NBundleParameter;

    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader;->getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader$I18NBundleParameter;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    return-object p1
.end method

.method public getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader$I18NBundleParameter;)Lcom/badlogic/gdx/utils/Array;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader$I18NBundleParameter;",
            ")",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/assets/AssetDescriptor;",
            ">;"
        }
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)V
    .locals 0

    .line 45
    check-cast p4, Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader$I18NBundleParameter;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader;->loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader$I18NBundleParameter;)V

    return-void
.end method

.method public loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader$I18NBundleParameter;)V
    .locals 0

    const/4 p1, 0x0

    .line 55
    iput-object p1, p0, Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader;->bundle:Lcom/badlogic/gdx/utils/I18NBundle;

    if-nez p4, :cond_0

    .line 59
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p2

    goto :goto_1

    .line 62
    :cond_0
    iget-object p1, p4, Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader$I18NBundleParameter;->locale:Ljava/util/Locale;

    if-nez p1, :cond_1

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p1

    goto :goto_0

    :cond_1
    iget-object p1, p4, Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader$I18NBundleParameter;->locale:Ljava/util/Locale;

    :goto_0
    move-object p2, p1

    .line 63
    iget-object p1, p4, Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader$I18NBundleParameter;->encoding:Ljava/lang/String;

    :goto_1
    if-nez p1, :cond_2

    .line 66
    invoke-static {p3, p2}, Lcom/badlogic/gdx/utils/I18NBundle;->createBundle(Lcom/badlogic/gdx/files/FileHandle;Ljava/util/Locale;)Lcom/badlogic/gdx/utils/I18NBundle;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader;->bundle:Lcom/badlogic/gdx/utils/I18NBundle;

    goto :goto_2

    .line 68
    :cond_2
    invoke-static {p3, p2, p1}, Lcom/badlogic/gdx/utils/I18NBundle;->createBundle(Lcom/badlogic/gdx/files/FileHandle;Ljava/util/Locale;Ljava/lang/String;)Lcom/badlogic/gdx/utils/I18NBundle;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader;->bundle:Lcom/badlogic/gdx/utils/I18NBundle;

    :goto_2
    return-void
.end method

.method public loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader$I18NBundleParameter;)Lcom/badlogic/gdx/utils/I18NBundle;
    .locals 0

    .line 74
    iget-object p1, p0, Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader;->bundle:Lcom/badlogic/gdx/utils/I18NBundle;

    const/4 p2, 0x0

    .line 75
    iput-object p2, p0, Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader;->bundle:Lcom/badlogic/gdx/utils/I18NBundle;

    return-object p1
.end method

.method public bridge synthetic loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Ljava/lang/Object;
    .locals 0

    .line 45
    check-cast p4, Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader$I18NBundleParameter;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader;->loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/I18NBundleLoader$I18NBundleParameter;)Lcom/badlogic/gdx/utils/I18NBundle;

    move-result-object p1

    return-object p1
.end method
