.class public Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader;
.super Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;
.source "ParticleEffectLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectSaveParameter;,
        Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectLoadParameter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader<",
        "Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffect;",
        "Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectLoadParameter;",
        ">;"
    }
.end annotation


# instance fields
.field protected items:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/utils/ObjectMap$Entry<",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData<",
            "Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffect;",
            ">;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V
    .locals 0

    .line 51
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;-><init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    .line 48
    new-instance p1, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {p1}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader;->items:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method

.method private find(Lcom/badlogic/gdx/utils/Array;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/badlogic/gdx/utils/Array<",
            "*>;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 143
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 144
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {p2, v1}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->isAssignableFrom(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method public bridge synthetic getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Lcom/badlogic/gdx/utils/Array;
    .locals 0

    .line 46
    check-cast p3, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectLoadParameter;

    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader;->getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectLoadParameter;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    return-object p1
.end method

.method public getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectLoadParameter;)Lcom/badlogic/gdx/utils/Array;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectLoadParameter;",
            ")",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/assets/AssetDescriptor;",
            ">;"
        }
    .end annotation

    .line 60
    new-instance v0, Lcom/badlogic/gdx/utils/Json;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Json;-><init>()V

    .line 61
    const-class v1, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;

    invoke-virtual {v0, v1, p2}, Lcom/badlogic/gdx/utils/Json;->fromJson(Ljava/lang/Class;Lcom/badlogic/gdx/files/FileHandle;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;

    .line 63
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader;->items:Lcom/badlogic/gdx/utils/Array;

    monitor-enter v1

    .line 64
    :try_start_0
    new-instance v2, Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    invoke-direct {v2}, Lcom/badlogic/gdx/utils/ObjectMap$Entry;-><init>()V

    .line 65
    iput-object p1, v2, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->key:Ljava/lang/Object;

    .line 66
    iput-object v0, v2, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->value:Ljava/lang/Object;

    .line 67
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, v2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 68
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->getAssets()Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    .line 69
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    .line 72
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;

    .line 75
    iget-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;->filename:Ljava/lang/String;

    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader;->resolve(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/badlogic/gdx/files/FileHandle;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 76
    invoke-virtual {p2}, Lcom/badlogic/gdx/files/FileHandle;->parent()Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v2

    sget-object v3, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    iget-object v4, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;->filename:Ljava/lang/String;

    invoke-interface {v3, v4}, Lcom/badlogic/gdx/Files;->internal(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/badlogic/gdx/files/FileHandle;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/files/FileHandle;->child(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/badlogic/gdx/files/FileHandle;->path()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;->filename:Ljava/lang/String;

    .line 79
    :cond_0
    iget-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;->type:Ljava/lang/Class;

    const-class v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffect;

    if-ne v2, v3, :cond_1

    .line 80
    new-instance v2, Lcom/badlogic/gdx/assets/AssetDescriptor;

    iget-object v3, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;->filename:Ljava/lang/String;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;->type:Ljava/lang/Class;

    invoke-direct {v2, v3, v1, p3}, Lcom/badlogic/gdx/assets/AssetDescriptor;-><init>(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)V

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_0

    .line 82
    :cond_1
    new-instance v2, Lcom/badlogic/gdx/assets/AssetDescriptor;

    iget-object v3, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;->filename:Ljava/lang/String;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;->type:Ljava/lang/Class;

    invoke-direct {v2, v3, v1}, Lcom/badlogic/gdx/assets/AssetDescriptor;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    return-object v0

    :catchall_0
    move-exception p1

    .line 69
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public bridge synthetic loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)V
    .locals 0

    .line 46
    check-cast p4, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectLoadParameter;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader;->loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectLoadParameter;)V

    return-void
.end method

.method public loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectLoadParameter;)V
    .locals 0

    return-void
.end method

.method public loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectLoadParameter;)Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffect;
    .locals 3

    .line 119
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader;->items:Lcom/badlogic/gdx/utils/Array;

    monitor-enter p3

    const/4 v0, 0x0

    .line 120
    :goto_0
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader;->items:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v0, v1, :cond_1

    .line 121
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    .line 122
    iget-object v2, v1, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->key:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 123
    iget-object p2, v1, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->value:Ljava/lang/Object;

    check-cast p2, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;

    .line 124
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/Array;->removeIndex(I)Ljava/lang/Object;

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    .line 128
    :goto_1
    monitor-exit p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    iget-object p3, p2, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->resource:Ljava/lang/Object;

    check-cast p3, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffect;

    invoke-virtual {p3, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffect;->load(Lcom/badlogic/gdx/assets/AssetManager;Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;)V

    if-eqz p4, :cond_3

    .line 132
    iget-object p3, p4, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectLoadParameter;->batches:Lcom/badlogic/gdx/utils/Array;

    if-eqz p3, :cond_2

    .line 133
    iget-object p3, p4, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectLoadParameter;->batches:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p3}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_2
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch;

    .line 134
    invoke-interface {v0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch;->load(Lcom/badlogic/gdx/assets/AssetManager;Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;)V

    goto :goto_2

    .line 137
    :cond_2
    iget-object p1, p2, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->resource:Ljava/lang/Object;

    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffect;

    iget-object p3, p4, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectLoadParameter;->batches:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, p3}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffect;->setBatch(Lcom/badlogic/gdx/utils/Array;)V

    .line 139
    :cond_3
    iget-object p1, p2, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->resource:Ljava/lang/Object;

    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffect;

    return-object p1

    :catchall_0
    move-exception p1

    .line 128
    :try_start_1
    monitor-exit p3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_4

    :goto_3
    throw p1

    :goto_4
    goto :goto_3
.end method

.method public bridge synthetic loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Ljava/lang/Object;
    .locals 0

    .line 46
    check-cast p4, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectLoadParameter;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader;->loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectLoadParameter;)Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffect;

    move-result-object p1

    return-object p1
.end method

.method public save(Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffect;Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectSaveParameter;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 91
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;-><init>(Ljava/lang/Object;)V

    .line 94
    iget-object v1, p2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectSaveParameter;->manager:Lcom/badlogic/gdx/assets/AssetManager;

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffect;->save(Lcom/badlogic/gdx/assets/AssetManager;Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;)V

    .line 97
    iget-object v1, p2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectSaveParameter;->batches:Lcom/badlogic/gdx/utils/Array;

    if-eqz v1, :cond_3

    .line 98
    iget-object v1, p2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectSaveParameter;->batches:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch;

    const/4 v3, 0x0

    .line 100
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffect;->getControllers()Lcom/badlogic/gdx/utils/Array;

    move-result-object v4

    invoke-virtual {v4}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    .line 101
    iget-object v5, v5, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->renderer:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderer;

    invoke-virtual {v5, v2}, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderer;->isCompatible(Lcom/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/4 v3, 0x1

    :cond_2
    if-eqz v3, :cond_0

    .line 107
    iget-object v3, p2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectSaveParameter;->manager:Lcom/badlogic/gdx/assets/AssetManager;

    invoke-interface {v2, v3, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch;->save(Lcom/badlogic/gdx/assets/AssetManager;Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;)V

    goto :goto_0

    .line 112
    :cond_3
    new-instance p1, Lcom/badlogic/gdx/utils/Json;

    invoke-direct {p1}, Lcom/badlogic/gdx/utils/Json;-><init>()V

    .line 113
    iget-object p2, p2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader$ParticleEffectSaveParameter;->file:Lcom/badlogic/gdx/files/FileHandle;

    invoke-virtual {p1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->toJson(Ljava/lang/Object;Lcom/badlogic/gdx/files/FileHandle;)V

    return-void
.end method
