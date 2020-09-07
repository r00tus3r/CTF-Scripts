.class public Lcom/badlogic/gdx/graphics/glutils/IndexArray;
.super Ljava/lang/Object;
.source "IndexArray.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/glutils/IndexData;


# instance fields
.field final buffer:Ljava/nio/ShortBuffer;

.field final byteBuffer:Ljava/nio/ByteBuffer;

.field private final empty:Z


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    if-nez p1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 36
    :goto_0
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->empty:Z

    .line 37
    iget-boolean v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->empty:Z

    if-eqz v1, :cond_1

    const/4 p1, 0x1

    :cond_1
    mul-int/lit8 p1, p1, 0x2

    .line 41
    invoke-static {p1}, Lcom/badlogic/gdx/utils/BufferUtils;->newUnsafeByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 42
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->buffer:Ljava/nio/ShortBuffer;

    .line 43
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {p1}, Ljava/nio/ShortBuffer;->flip()Ljava/nio/Buffer;

    .line 44
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    return-void
.end method


# virtual methods
.method public bind()V
    .locals 0

    return-void
.end method

.method public dispose()V
    .locals 1

    .line 120
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lcom/badlogic/gdx/utils/BufferUtils;->disposeUnsafeByteBuffer(Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public getBuffer()Ljava/nio/ShortBuffer;
    .locals 1

    .line 103
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->buffer:Ljava/nio/ShortBuffer;

    return-object v0
.end method

.method public getNumIndices()I
    .locals 1

    .line 49
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->empty:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v0}, Ljava/nio/ShortBuffer;->limit()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getNumMaxIndices()I
    .locals 1

    .line 54
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->empty:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v0}, Ljava/nio/ShortBuffer;->capacity()I

    move-result v0

    :goto_0
    return v0
.end method

.method public invalidate()V
    .locals 0

    return-void
.end method

.method public setIndices(Ljava/nio/ShortBuffer;)V
    .locals 3

    .line 78
    invoke-virtual {p1}, Ljava/nio/ShortBuffer;->position()I

    move-result v0

    .line 79
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v1}, Ljava/nio/ShortBuffer;->clear()Ljava/nio/Buffer;

    .line 80
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {p1}, Ljava/nio/ShortBuffer;->remaining()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/nio/ShortBuffer;->limit(I)Ljava/nio/Buffer;

    .line 81
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v1, p1}, Ljava/nio/ShortBuffer;->put(Ljava/nio/ShortBuffer;)Ljava/nio/ShortBuffer;

    .line 82
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v1}, Ljava/nio/ShortBuffer;->flip()Ljava/nio/Buffer;

    .line 83
    invoke-virtual {p1, v0}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 84
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->byteBuffer:Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 85
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->byteBuffer:Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v0}, Ljava/nio/ShortBuffer;->limit()I

    move-result v0

    shl-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    return-void
.end method

.method public setIndices([SII)V
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v0}, Ljava/nio/ShortBuffer;->clear()Ljava/nio/Buffer;

    .line 71
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/nio/ShortBuffer;->put([SII)Ljava/nio/ShortBuffer;

    .line 72
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {p1}, Ljava/nio/ShortBuffer;->flip()Ljava/nio/Buffer;

    .line 73
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->byteBuffer:Ljava/nio/ByteBuffer;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 74
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->byteBuffer:Ljava/nio/ByteBuffer;

    shl-int/lit8 p2, p3, 0x1

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    return-void
.end method

.method public unbind()V
    .locals 0

    return-void
.end method

.method public updateIndices(I[SII)V
    .locals 2

    .line 90
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    .line 91
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->byteBuffer:Ljava/nio/ByteBuffer;

    mul-int/lit8 p1, p1, 0x2

    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 92
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {p2, p3, p1, p4}, Lcom/badlogic/gdx/utils/BufferUtils;->copy([SILjava/nio/Buffer;I)V

    .line 93
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexArray;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    return-void
.end method
