.class public Lcom/badlogic/gdx/assets/loaders/ParticleEffectLoader;
.super Lcom/badlogic/gdx/assets/loaders/SynchronousAssetLoader;
.source "ParticleEffectLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/assets/loaders/ParticleEffectLoader$ParticleEffectParameter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/assets/loaders/SynchronousAssetLoader<",
        "Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;",
        "Lcom/badlogic/gdx/assets/loaders/ParticleEffectLoader$ParticleEffectParameter;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/assets/loaders/SynchronousAssetLoader;-><init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Lcom/badlogic/gdx/utils/Array;
    .locals 0

    .line 30
    check-cast p3, Lcom/badlogic/gdx/assets/loaders/ParticleEffectLoader$ParticleEffectParameter;

    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/assets/loaders/ParticleEffectLoader;->getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ParticleEffectLoader$ParticleEffectParameter;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    return-object p1
.end method

.method public getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ParticleEffectLoader$ParticleEffectParameter;)Lcom/badlogic/gdx/utils/Array;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "Lcom/badlogic/gdx/assets/loaders/ParticleEffectLoader$ParticleEffectParameter;",
            ")",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/assets/AssetDescriptor;",
            ">;"
        }
    .end annotation

    if-eqz p3, :cond_0

    .line 50
    iget-object p1, p3, Lcom/badlogic/gdx/assets/loaders/ParticleEffectLoader$ParticleEffectParameter;->atlasFile:Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 51
    new-instance p1, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {p1}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    .line 52
    new-instance p2, Lcom/badlogic/gdx/assets/AssetDescriptor;

    iget-object p3, p3, Lcom/badlogic/gdx/assets/loaders/ParticleEffectLoader$ParticleEffectParameter;->atlasFile:Ljava/lang/String;

    const-class v0, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    invoke-direct {p2, p3, v0}, Lcom/badlogic/gdx/assets/AssetDescriptor;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public load(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ParticleEffectLoader$ParticleEffectParameter;)Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;
    .locals 2

    .line 37
    new-instance p2, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;

    invoke-direct {p2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;-><init>()V

    if-eqz p4, :cond_0

    .line 38
    iget-object v0, p4, Lcom/badlogic/gdx/assets/loaders/ParticleEffectLoader$ParticleEffectParameter;->atlasFile:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 39
    iget-object v0, p4, Lcom/badlogic/gdx/assets/loaders/ParticleEffectLoader$ParticleEffectParameter;->atlasFile:Ljava/lang/String;

    const-class v1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    invoke-virtual {p1, v0, v1}, Lcom/badlogic/gdx/assets/AssetManager;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    iget-object p4, p4, Lcom/badlogic/gdx/assets/loaders/ParticleEffectLoader$ParticleEffectParameter;->atlasPrefix:Ljava/lang/String;

    invoke-virtual {p2, p3, p1, p4}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->load(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    if-eqz p4, :cond_1

    .line 40
    iget-object p1, p4, Lcom/badlogic/gdx/assets/loaders/ParticleEffectLoader$ParticleEffectParameter;->imagesDir:Lcom/badlogic/gdx/files/FileHandle;

    if-eqz p1, :cond_1

    .line 41
    iget-object p1, p4, Lcom/badlogic/gdx/assets/loaders/ParticleEffectLoader$ParticleEffectParameter;->imagesDir:Lcom/badlogic/gdx/files/FileHandle;

    invoke-virtual {p2, p3, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->load(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/files/FileHandle;)V

    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {p3}, Lcom/badlogic/gdx/files/FileHandle;->parent()Lcom/badlogic/gdx/files/FileHandle;

    move-result-object p1

    invoke-virtual {p2, p3, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->load(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/files/FileHandle;)V

    :goto_0
    return-object p2
.end method

.method public bridge synthetic load(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Ljava/lang/Object;
    .locals 0

    .line 30
    check-cast p4, Lcom/badlogic/gdx/assets/loaders/ParticleEffectLoader$ParticleEffectParameter;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/assets/loaders/ParticleEffectLoader;->load(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ParticleEffectLoader$ParticleEffectParameter;)Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;

    move-result-object p1

    return-object p1
.end method
