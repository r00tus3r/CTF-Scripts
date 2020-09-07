.class public Lcom/badlogic/gdx/graphics/TextureArrayData$Factory;
.super Ljava/lang/Object;
.source "TextureArrayData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/TextureArrayData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Factory"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static varargs loadFromFiles(Lcom/badlogic/gdx/graphics/Pixmap$Format;Z[Lcom/badlogic/gdx/files/FileHandle;)Lcom/badlogic/gdx/graphics/TextureArrayData;
    .locals 1

    .line 68
    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/FileTextureArrayData;

    invoke-direct {v0, p0, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/FileTextureArrayData;-><init>(Lcom/badlogic/gdx/graphics/Pixmap$Format;Z[Lcom/badlogic/gdx/files/FileHandle;)V

    return-object v0
.end method
