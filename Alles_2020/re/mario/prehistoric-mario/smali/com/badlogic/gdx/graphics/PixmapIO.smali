.class public Lcom/badlogic/gdx/graphics/PixmapIO;
.super Ljava/lang/Object;
.source "PixmapIO.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/PixmapIO$PNG;,
        Lcom/badlogic/gdx/graphics/PixmapIO$CIM;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static readCIM(Lcom/badlogic/gdx/files/FileHandle;)Lcom/badlogic/gdx/graphics/Pixmap;
    .locals 0

    .line 55
    invoke-static {p0}, Lcom/badlogic/gdx/graphics/PixmapIO$CIM;->read(Lcom/badlogic/gdx/files/FileHandle;)Lcom/badlogic/gdx/graphics/Pixmap;

    move-result-object p0

    return-object p0
.end method

.method public static writeCIM(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/Pixmap;)V
    .locals 0

    .line 48
    invoke-static {p0, p1}, Lcom/badlogic/gdx/graphics/PixmapIO$CIM;->write(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/Pixmap;)V

    return-void
.end method

.method public static writePNG(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/Pixmap;)V
    .locals 2

    const/4 v0, -0x1

    const/4 v1, 0x0

    .line 79
    invoke-static {p0, p1, v0, v1}, Lcom/badlogic/gdx/graphics/PixmapIO;->writePNG(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/Pixmap;IZ)V

    return-void
.end method

.method public static writePNG(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/Pixmap;IZ)V
    .locals 3

    .line 63
    :try_start_0
    new-instance v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result v2

    mul-int v1, v1, v2

    int-to-float v1, v1

    const/high16 v2, 0x3fc00000    # 1.5f

    mul-float v1, v1, v2

    float-to-int v1, v1

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;-><init>(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    :try_start_1
    invoke-virtual {v0, p3}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->setFlipY(Z)V

    .line 66
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->setCompression(I)V

    .line 67
    invoke-virtual {v0, p0, p1}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->write(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/Pixmap;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 69
    :try_start_2
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->dispose()V

    return-void

    :catchall_0
    move-exception p1

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->dispose()V

    throw p1
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception p1

    .line 72
    new-instance p2, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Error writing PNG: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method
