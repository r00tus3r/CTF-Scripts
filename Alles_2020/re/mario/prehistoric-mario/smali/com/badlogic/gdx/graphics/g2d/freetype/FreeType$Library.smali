.class public Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;
.super Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Pointer;
.source "FreeType.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Library"
.end annotation


# instance fields
.field fontData:Lcom/badlogic/gdx/utils/LongMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/LongMap<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(J)V
    .locals 0

    .line 53
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Pointer;-><init>(J)V

    .line 50
    new-instance p1, Lcom/badlogic/gdx/utils/LongMap;

    invoke-direct {p1}, Lcom/badlogic/gdx/utils/LongMap;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;->fontData:Lcom/badlogic/gdx/utils/LongMap;

    return-void
.end method

.method private static native doneFreeType(J)V
.end method

.method private static native newMemoryFace(JLjava/nio/ByteBuffer;II)J
.end method

.method private static native strokerNew(J)J
.end method


# virtual methods
.method public createStroker()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;
    .locals 5

    .line 99
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;->strokerNew(J)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    .line 101
    new-instance v2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;

    invoke-direct {v2, v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;-><init>(J)V

    return-object v2

    .line 100
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Couldn\'t create FreeType stroker"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public dispose()V
    .locals 2

    .line 58
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;->doneFreeType(J)V

    .line 59
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;->fontData:Lcom/badlogic/gdx/utils/LongMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/LongMap;->values()Lcom/badlogic/gdx/utils/LongMap$Values;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/LongMap$Values;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    .line 60
    invoke-static {v1}, Lcom/badlogic/gdx/utils/BufferUtils;->disposeUnsafeByteBuffer(Ljava/nio/ByteBuffer;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public newFace(Lcom/badlogic/gdx/files/FileHandle;I)Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;
    .locals 1

    .line 69
    invoke-virtual {p1}, Lcom/badlogic/gdx/files/FileHandle;->readBytes()[B

    move-result-object p1

    .line 70
    array-length v0, p1

    invoke-virtual {p0, p1, v0, p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;->newMemoryFace([BII)Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    move-result-object p1

    return-object p1
.end method

.method public newMemoryFace(Ljava/nio/ByteBuffer;I)Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;
    .locals 4

    .line 80
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;->address:J

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-static {v0, v1, p1, v2, p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;->newMemoryFace(JLjava/nio/ByteBuffer;II)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p2, v0, v2

    if-eqz p2, :cond_0

    .line 86
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;->fontData:Lcom/badlogic/gdx/utils/LongMap;

    invoke-virtual {p2, v0, v1, p1}, Lcom/badlogic/gdx/utils/LongMap;->put(JLjava/lang/Object;)Ljava/lang/Object;

    .line 87
    new-instance p1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-direct {p1, v0, v1, p0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;-><init>(JLcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;)V

    return-object p1

    .line 82
    :cond_0
    invoke-static {p1}, Lcom/badlogic/gdx/utils/BufferUtils;->disposeUnsafeByteBuffer(Ljava/nio/ByteBuffer;)V

    .line 83
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Couldn\'t load font"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public newMemoryFace([BII)Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;
    .locals 2

    .line 74
    array-length p2, p1

    invoke-static {p2}, Lcom/badlogic/gdx/utils/BufferUtils;->newUnsafeByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object p2

    .line 75
    array-length v0, p1

    const/4 v1, 0x0

    invoke-static {p1, v1, p2, v0}, Lcom/badlogic/gdx/utils/BufferUtils;->copy([BILjava/nio/Buffer;I)V

    .line 76
    invoke-virtual {p0, p2, p3}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;->newMemoryFace(Ljava/nio/ByteBuffer;I)Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    move-result-object p1

    return-object p1
.end method
