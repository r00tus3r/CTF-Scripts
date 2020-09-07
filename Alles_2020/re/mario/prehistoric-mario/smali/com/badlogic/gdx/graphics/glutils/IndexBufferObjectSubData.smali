.class public Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;
.super Ljava/lang/Object;
.source "IndexBufferObjectSubData.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/glutils/IndexData;


# instance fields
.field final buffer:Ljava/nio/ShortBuffer;

.field bufferHandle:I

.field final byteBuffer:Ljava/nio/ByteBuffer;

.field isBound:Z

.field final isDirect:Z

.field isDirty:Z

.field final usage:I


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 47
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->isDirty:Z

    const/4 v1, 0x0

    .line 48
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->isBound:Z

    mul-int/lit8 p1, p1, 0x2

    .line 70
    invoke-static {p1}, Lcom/badlogic/gdx/utils/BufferUtils;->newByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 71
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->isDirect:Z

    const p1, 0x88e4

    .line 73
    iput p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->usage:I

    .line 74
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->buffer:Ljava/nio/ShortBuffer;

    .line 75
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {p1}, Ljava/nio/ShortBuffer;->flip()Ljava/nio/Buffer;

    .line 76
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 77
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->createBufferObject()I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->bufferHandle:I

    return-void
.end method

.method public constructor <init>(ZI)V
    .locals 2

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 47
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->isDirty:Z

    const/4 v1, 0x0

    .line 48
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->isBound:Z

    mul-int/lit8 p2, p2, 0x2

    .line 56
    invoke-static {p2}, Lcom/badlogic/gdx/utils/BufferUtils;->newByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object p2

    iput-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 57
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->isDirect:Z

    if-eqz p1, :cond_0

    const p1, 0x88e4

    goto :goto_0

    :cond_0
    const p1, 0x88e8

    .line 59
    :goto_0
    iput p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->usage:I

    .line 60
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->buffer:Ljava/nio/ShortBuffer;

    .line 61
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {p1}, Ljava/nio/ShortBuffer;->flip()Ljava/nio/Buffer;

    .line 62
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 63
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->createBufferObject()I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->bufferHandle:I

    return-void
.end method

.method private createBufferObject()I
    .locals 6

    .line 81
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/GL20;->glGenBuffer()I

    move-result v0

    .line 82
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const v2, 0x8893

    invoke-interface {v1, v2, v0}, Lcom/badlogic/gdx/graphics/GL20;->glBindBuffer(II)V

    .line 83
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v3

    iget v4, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->usage:I

    const/4 v5, 0x0

    invoke-interface {v1, v2, v3, v5, v4}, Lcom/badlogic/gdx/graphics/GL20;->glBufferData(IILjava/nio/Buffer;I)V

    .line 84
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Lcom/badlogic/gdx/graphics/GL20;->glBindBuffer(II)V

    return v0
.end method


# virtual methods
.method public bind()V
    .locals 5

    .line 169
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->bufferHandle:I

    if-eqz v0, :cond_1

    .line 171
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    iget v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->bufferHandle:I

    const v2, 0x8893

    invoke-interface {v0, v2, v1}, Lcom/badlogic/gdx/graphics/GL20;->glBindBuffer(II)V

    .line 172
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->isDirty:Z

    if-eqz v0, :cond_0

    .line 173
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v1}, Ljava/nio/ShortBuffer;->limit()I

    move-result v1

    mul-int/lit8 v1, v1, 0x2

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 174
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    const/4 v4, 0x0

    invoke-interface {v0, v2, v4, v1, v3}, Lcom/badlogic/gdx/graphics/GL20;->glBufferSubData(IIILjava/nio/Buffer;)V

    .line 175
    iput-boolean v4, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->isDirty:Z

    :cond_0
    const/4 v0, 0x1

    .line 177
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->isBound:Z

    return-void

    .line 169
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "IndexBufferObject cannot be used after it has been disposed."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public dispose()V
    .locals 3

    .line 194
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const/4 v1, 0x0

    const v2, 0x8893

    .line 195
    invoke-interface {v0, v2, v1}, Lcom/badlogic/gdx/graphics/GL20;->glBindBuffer(II)V

    .line 196
    iget v2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->bufferHandle:I

    invoke-interface {v0, v2}, Lcom/badlogic/gdx/graphics/GL20;->glDeleteBuffer(I)V

    .line 197
    iput v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->bufferHandle:I

    return-void
.end method

.method public getBuffer()Ljava/nio/ShortBuffer;
    .locals 1

    const/4 v0, 0x1

    .line 163
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->isDirty:Z

    .line 164
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->buffer:Ljava/nio/ShortBuffer;

    return-object v0
.end method

.method public getNumIndices()I
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v0}, Ljava/nio/ShortBuffer;->limit()I

    move-result v0

    return v0
.end method

.method public getNumMaxIndices()I
    .locals 1

    .line 95
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v0}, Ljava/nio/ShortBuffer;->capacity()I

    move-result v0

    return v0
.end method

.method public invalidate()V
    .locals 1

    .line 188
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->createBufferObject()I

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->bufferHandle:I

    const/4 v0, 0x1

    .line 189
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->isDirty:Z

    return-void
.end method

.method public setIndices(Ljava/nio/ShortBuffer;)V
    .locals 4

    .line 125
    invoke-virtual {p1}, Ljava/nio/ShortBuffer;->position()I

    move-result v0

    const/4 v1, 0x1

    .line 126
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->isDirty:Z

    .line 127
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v2}, Ljava/nio/ShortBuffer;->clear()Ljava/nio/Buffer;

    .line 128
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v2, p1}, Ljava/nio/ShortBuffer;->put(Ljava/nio/ShortBuffer;)Ljava/nio/ShortBuffer;

    .line 129
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v2}, Ljava/nio/ShortBuffer;->flip()Ljava/nio/Buffer;

    .line 130
    invoke-virtual {p1, v0}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 131
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 132
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v2}, Ljava/nio/ShortBuffer;->limit()I

    move-result v2

    shl-int/lit8 v1, v2, 0x1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 134
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->isBound:Z

    if-eqz p1, :cond_0

    .line 135
    sget-object p1, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const v1, 0x8893

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-interface {p1, v1, v0, v2, v3}, Lcom/badlogic/gdx/graphics/GL20;->glBufferSubData(IIILjava/nio/Buffer;)V

    .line 136
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->isDirty:Z

    :cond_0
    return-void
.end method

.method public setIndices([SII)V
    .locals 2

    const/4 v0, 0x1

    .line 111
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->isDirty:Z

    .line 112
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v1}, Ljava/nio/ShortBuffer;->clear()Ljava/nio/Buffer;

    .line 113
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v1, p1, p2, p3}, Ljava/nio/ShortBuffer;->put([SII)Ljava/nio/ShortBuffer;

    .line 114
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {p1}, Ljava/nio/ShortBuffer;->flip()Ljava/nio/Buffer;

    .line 115
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 116
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    shl-int/2addr p3, v0

    invoke-virtual {p1, p3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 118
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->isBound:Z

    if-eqz p1, :cond_0

    .line 119
    sget-object p1, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const p3, 0x8893

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-interface {p1, p3, p2, v0, v1}, Lcom/badlogic/gdx/graphics/GL20;->glBufferSubData(IIILjava/nio/Buffer;)V

    .line 120
    iput-boolean p2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->isDirty:Z

    :cond_0
    return-void
.end method

.method public unbind()V
    .locals 3

    .line 182
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const/4 v1, 0x0

    const v2, 0x8893

    invoke-interface {v0, v2, v1}, Lcom/badlogic/gdx/graphics/GL20;->glBindBuffer(II)V

    .line 183
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->isBound:Z

    return-void
.end method

.method public updateIndices(I[SII)V
    .locals 2

    const/4 v0, 0x1

    .line 142
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->isDirty:Z

    .line 143
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    .line 144
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    mul-int/lit8 p1, p1, 0x2

    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 145
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {p2, p3, p1, p4}, Lcom/badlogic/gdx/utils/BufferUtils;->copy([SILjava/nio/Buffer;I)V

    .line 146
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 147
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->buffer:Ljava/nio/ShortBuffer;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 149
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->isBound:Z

    if-eqz p1, :cond_0

    .line 150
    sget-object p1, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const p3, 0x8893

    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p4}, Ljava/nio/ByteBuffer;->limit()I

    move-result p4

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-interface {p1, p3, p2, p4, v0}, Lcom/badlogic/gdx/graphics/GL20;->glBufferSubData(IIILjava/nio/Buffer;)V

    .line 151
    iput-boolean p2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;->isDirty:Z

    :cond_0
    return-void
.end method
