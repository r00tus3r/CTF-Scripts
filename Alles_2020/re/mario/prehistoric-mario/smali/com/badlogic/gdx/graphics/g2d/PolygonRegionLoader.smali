.class public Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader;
.super Lcom/badlogic/gdx/assets/loaders/SynchronousAssetLoader;
.source "PolygonRegionLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader$PolygonRegionParameters;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/assets/loaders/SynchronousAssetLoader<",
        "Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;",
        "Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader$PolygonRegionParameters;",
        ">;"
    }
.end annotation


# instance fields
.field private defaultParameters:Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader$PolygonRegionParameters;

.field private triangulator:Lcom/badlogic/gdx/math/EarClippingTriangulator;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 61
    new-instance v0, Lcom/badlogic/gdx/assets/loaders/resolvers/InternalFileHandleResolver;

    invoke-direct {v0}, Lcom/badlogic/gdx/assets/loaders/resolvers/InternalFileHandleResolver;-><init>()V

    invoke-direct {p0, v0}, Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader;-><init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V
    .locals 0

    .line 65
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/assets/loaders/SynchronousAssetLoader;-><init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    .line 56
    new-instance p1, Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader$PolygonRegionParameters;

    invoke-direct {p1}, Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader$PolygonRegionParameters;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader;->defaultParameters:Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader$PolygonRegionParameters;

    .line 58
    new-instance p1, Lcom/badlogic/gdx/math/EarClippingTriangulator;

    invoke-direct {p1}, Lcom/badlogic/gdx/math/EarClippingTriangulator;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader;->triangulator:Lcom/badlogic/gdx/math/EarClippingTriangulator;

    return-void
.end method


# virtual methods
.method public bridge synthetic getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Lcom/badlogic/gdx/utils/Array;
    .locals 0

    .line 39
    check-cast p3, Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader$PolygonRegionParameters;

    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader;->getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader$PolygonRegionParameters;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    return-object p1
.end method

.method public getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader$PolygonRegionParameters;)Lcom/badlogic/gdx/utils/Array;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader$PolygonRegionParameters;",
            ")",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/assets/AssetDescriptor;",
            ">;"
        }
    .end annotation

    if-nez p3, :cond_0

    .line 80
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader;->defaultParameters:Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader$PolygonRegionParameters;

    .line 83
    :cond_0
    :try_start_0
    iget v0, p3, Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader$PolygonRegionParameters;->readerBuffer:I

    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/files/FileHandle;->reader(I)Ljava/io/BufferedReader;

    move-result-object v0

    .line 84
    :cond_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 85
    iget-object v3, p3, Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader$PolygonRegionParameters;->texturePrefix:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 86
    iget-object v3, p3, Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader$PolygonRegionParameters;->texturePrefix:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_2
    move-object v1, v2

    .line 89
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v1, :cond_4

    .line 94
    iget-object p1, p3, Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader$PolygonRegionParameters;->textureExtensions:[Ljava/lang/String;

    if-eqz p1, :cond_4

    iget-object p1, p3, Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader$PolygonRegionParameters;->textureExtensions:[Ljava/lang/String;

    array-length p3, p1

    const/4 v0, 0x0

    :goto_1
    if-ge v0, p3, :cond_4

    aget-object v3, p1, v0

    .line 95
    invoke-virtual {p2}, Lcom/badlogic/gdx/files/FileHandle;->nameWithoutExtension()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Lcom/badlogic/gdx/files/FileHandle;->sibling(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v3

    .line 96
    invoke-virtual {v3}, Lcom/badlogic/gdx/files/FileHandle;->exists()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {v3}, Lcom/badlogic/gdx/files/FileHandle;->name()Ljava/lang/String;

    move-result-object v1

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_4
    if-eqz v1, :cond_5

    .line 100
    new-instance p1, Lcom/badlogic/gdx/utils/Array;

    const/4 p3, 0x1

    invoke-direct {p1, p3}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    .line 101
    new-instance p3, Lcom/badlogic/gdx/assets/AssetDescriptor;

    invoke-virtual {p2, v1}, Lcom/badlogic/gdx/files/FileHandle;->sibling(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object p2

    const-class v0, Lcom/badlogic/gdx/graphics/Texture;

    invoke-direct {p3, p2, v0}, Lcom/badlogic/gdx/assets/AssetDescriptor;-><init>(Lcom/badlogic/gdx/files/FileHandle;Ljava/lang/Class;)V

    invoke-virtual {p1, p3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-object p1

    :cond_5
    return-object v2

    :catch_0
    move-exception p2

    .line 91
    new-instance p3, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Error reading "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3

    :goto_2
    throw p3

    :goto_3
    goto :goto_2
.end method

.method public load(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader$PolygonRegionParameters;)Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;
    .locals 0

    .line 70
    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/assets/AssetManager;->getDependencies(Ljava/lang/String;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p2

    invoke-virtual {p2}, Lcom/badlogic/gdx/utils/Array;->first()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/assets/AssetManager;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/Texture;

    .line 71
    new-instance p2, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-direct {p2, p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/Texture;)V

    invoke-virtual {p0, p2, p3}, Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader;->load(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;Lcom/badlogic/gdx/files/FileHandle;)Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;

    move-result-object p1

    return-object p1
.end method

.method public load(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;Lcom/badlogic/gdx/files/FileHandle;)Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;
    .locals 6

    const/16 v0, 0x100

    .line 118
    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/files/FileHandle;->reader(I)Ljava/io/BufferedReader;

    move-result-object v0

    .line 121
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    const-string v2, "s"

    .line 123
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    .line 125
    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 126
    array-length v2, v1

    new-array v2, v2, [F

    const/4 v3, 0x0

    .line 127
    array-length v4, v2

    :goto_0
    if-ge v3, v4, :cond_1

    .line 128
    aget-object v5, v1, v3

    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v5

    aput v5, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 130
    :cond_1
    new-instance v1, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader;->triangulator:Lcom/badlogic/gdx/math/EarClippingTriangulator;

    invoke-virtual {v3, v2}, Lcom/badlogic/gdx/math/EarClippingTriangulator;->computeTriangles([F)Lcom/badlogic/gdx/utils/ShortArray;

    move-result-object v3

    invoke-virtual {v3}, Lcom/badlogic/gdx/utils/ShortArray;->toArray()[S

    move-result-object v3

    invoke-direct {v1, p1, v2, v3}, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;[F[S)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 136
    invoke-static {v0}, Lcom/badlogic/gdx/utils/StreamUtils;->closeQuietly(Ljava/io/Closeable;)V

    return-object v1

    :cond_2
    invoke-static {v0}, Lcom/badlogic/gdx/utils/StreamUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 138
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Polygon shape not found: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    .line 134
    :try_start_1
    new-instance v1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error reading polygon shape file: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v1, p2, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 136
    :goto_1
    invoke-static {v0}, Lcom/badlogic/gdx/utils/StreamUtils;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2
.end method

.method public bridge synthetic load(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Ljava/lang/Object;
    .locals 0

    .line 39
    check-cast p4, Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader$PolygonRegionParameters;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader;->load(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader$PolygonRegionParameters;)Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;

    move-result-object p1

    return-object p1
.end method
