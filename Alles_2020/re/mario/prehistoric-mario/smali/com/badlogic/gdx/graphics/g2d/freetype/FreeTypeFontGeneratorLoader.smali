.class public Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGeneratorLoader;
.super Lcom/badlogic/gdx/assets/loaders/SynchronousAssetLoader;
.source "FreeTypeFontGeneratorLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGeneratorLoader$FreeTypeFontGeneratorParameters;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/assets/loaders/SynchronousAssetLoader<",
        "Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;",
        "Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGeneratorLoader$FreeTypeFontGeneratorParameters;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V
    .locals 0

    .line 38
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/assets/loaders/SynchronousAssetLoader;-><init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Lcom/badlogic/gdx/utils/Array;
    .locals 0

    .line 34
    check-cast p3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGeneratorLoader$FreeTypeFontGeneratorParameters;

    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGeneratorLoader;->getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGeneratorLoader$FreeTypeFontGeneratorParameters;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    return-object p1
.end method

.method public getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGeneratorLoader$FreeTypeFontGeneratorParameters;)Lcom/badlogic/gdx/utils/Array;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGeneratorLoader$FreeTypeFontGeneratorParameters;",
            ")",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/assets/AssetDescriptor;",
            ">;"
        }
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method

.method public load(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGeneratorLoader$FreeTypeFontGeneratorParameters;)Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;
    .locals 0

    .line 45
    invoke-virtual {p3}, Lcom/badlogic/gdx/files/FileHandle;->extension()Ljava/lang/String;

    move-result-object p1

    const-string p2, "gen"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 46
    new-instance p1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;

    invoke-virtual {p3}, Lcom/badlogic/gdx/files/FileHandle;->nameWithoutExtension()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/badlogic/gdx/files/FileHandle;->sibling(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;-><init>(Lcom/badlogic/gdx/files/FileHandle;)V

    goto :goto_0

    .line 48
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;

    invoke-direct {p1, p3}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;-><init>(Lcom/badlogic/gdx/files/FileHandle;)V

    :goto_0
    return-object p1
.end method

.method public bridge synthetic load(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Ljava/lang/Object;
    .locals 0

    .line 34
    check-cast p4, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGeneratorLoader$FreeTypeFontGeneratorParameters;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGeneratorLoader;->load(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGeneratorLoader$FreeTypeFontGeneratorParameters;)Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;

    move-result-object p1

    return-object p1
.end method
