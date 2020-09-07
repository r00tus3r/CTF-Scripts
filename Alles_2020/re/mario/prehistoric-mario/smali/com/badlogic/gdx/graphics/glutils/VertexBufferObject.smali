.class public Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;
.super Ljava/lang/Object;
.source "VertexBufferObject.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/glutils/VertexData;


# instance fields
.field private attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

.field private buffer:Ljava/nio/FloatBuffer;

.field private bufferHandle:I

.field private byteBuffer:Ljava/nio/ByteBuffer;

.field isBound:Z

.field isDirty:Z

.field private ownsBuffer:Z

.field private usage:I


# direct methods
.method protected constructor <init>(ILjava/nio/ByteBuffer;ZLcom/badlogic/gdx/graphics/VertexAttributes;)V
    .locals 1

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 48
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->isDirty:Z

    .line 49
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->isBound:Z

    .line 75
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/GL20;->glGenBuffer()I

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->bufferHandle:I

    .line 77
    invoke-virtual {p0, p2, p3, p4}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->setBuffer(Ljava/nio/Buffer;ZLcom/badlogic/gdx/graphics/VertexAttributes;)V

    .line 78
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->setUsage(I)V

    return-void
.end method

.method public constructor <init>(ZILcom/badlogic/gdx/graphics/VertexAttributes;)V
    .locals 2

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 48
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->isDirty:Z

    .line 49
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->isBound:Z

    .line 66
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v1}, Lcom/badlogic/gdx/graphics/GL20;->glGenBuffer()I

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->bufferHandle:I

    .line 68
    iget v1, p3, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    mul-int v1, v1, p2

    invoke-static {v1}, Lcom/badlogic/gdx/utils/BufferUtils;->newUnsafeByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object p2

    .line 69
    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    const/4 v0, 0x1

    .line 70
    invoke-virtual {p0, p2, v0, p3}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->setBuffer(Ljava/nio/Buffer;ZLcom/badlogic/gdx/graphics/VertexAttributes;)V

    if-eqz p1, :cond_0

    const p1, 0x88e4

    goto :goto_0

    :cond_0
    const p1, 0x88e8

    .line 71
    :goto_0
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->setUsage(I)V

    return-void
.end method

.method public varargs constructor <init>(ZI[Lcom/badlogic/gdx/graphics/VertexAttribute;)V
    .locals 1

    .line 57
    new-instance v0, Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-direct {v0, p3}, Lcom/badlogic/gdx/graphics/VertexAttributes;-><init>([Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    invoke-direct {p0, p1, p2, v0}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;-><init>(ZILcom/badlogic/gdx/graphics/VertexAttributes;)V

    return-void
.end method

.method private bufferChanged()V
    .locals 5

    .line 125
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->isBound:Z

    if-eqz v0, :cond_0

    .line 126
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const v1, 0x8892

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    iget v4, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->usage:I

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/badlogic/gdx/graphics/GL20;->glBufferData(IILjava/nio/Buffer;I)V

    const/4 v0, 0x0

    .line 127
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->isDirty:Z

    :cond_0
    return-void
.end method


# virtual methods
.method public bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 1

    const/4 v0, 0x0

    .line 168
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V

    return-void
.end method

.method public bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V
    .locals 11

    .line 173
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    .line 175
    iget v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->bufferHandle:I

    const v2, 0x8892

    invoke-interface {v0, v2, v1}, Lcom/badlogic/gdx/graphics/GL20;->glBindBuffer(II)V

    .line 176
    iget-boolean v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->isDirty:Z

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    .line 177
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v4}, Ljava/nio/FloatBuffer;->limit()I

    move-result v4

    mul-int/lit8 v4, v4, 0x4

    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 178
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    iget v5, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->usage:I

    invoke-interface {v0, v2, v1, v4, v5}, Lcom/badlogic/gdx/graphics/GL20;->glBufferData(IILjava/nio/Buffer;I)V

    .line 179
    iput-boolean v3, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->isDirty:Z

    .line 182
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/VertexAttributes;->size()I

    move-result v0

    if-nez p2, :cond_2

    :goto_0
    if-ge v3, v0, :cond_4

    .line 185
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {p2, v3}, Lcom/badlogic/gdx/graphics/VertexAttributes;->get(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object p2

    .line 186
    iget-object v1, p2, Lcom/badlogic/gdx/graphics/VertexAttribute;->alias:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->getAttributeLocation(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_1

    goto :goto_1

    .line 188
    :cond_1
    invoke-virtual {p1, v5}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->enableVertexAttribute(I)V

    .line 190
    iget v6, p2, Lcom/badlogic/gdx/graphics/VertexAttribute;->numComponents:I

    iget v7, p2, Lcom/badlogic/gdx/graphics/VertexAttribute;->type:I

    iget-boolean v8, p2, Lcom/badlogic/gdx/graphics/VertexAttribute;->normalized:Z

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    iget v9, v1, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    iget v10, p2, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    move-object v4, p1

    invoke-virtual/range {v4 .. v10}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setVertexAttribute(IIIZII)V

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    :goto_2
    if-ge v3, v0, :cond_4

    .line 196
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v1, v3}, Lcom/badlogic/gdx/graphics/VertexAttributes;->get(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v1

    .line 197
    aget v5, p2, v3

    if-gez v5, :cond_3

    goto :goto_3

    .line 199
    :cond_3
    invoke-virtual {p1, v5}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->enableVertexAttribute(I)V

    .line 201
    iget v6, v1, Lcom/badlogic/gdx/graphics/VertexAttribute;->numComponents:I

    iget v7, v1, Lcom/badlogic/gdx/graphics/VertexAttribute;->type:I

    iget-boolean v8, v1, Lcom/badlogic/gdx/graphics/VertexAttribute;->normalized:Z

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    iget v9, v2, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    iget v10, v1, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    move-object v4, p1

    invoke-virtual/range {v4 .. v10}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setVertexAttribute(IIIZII)V

    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_4
    const/4 p1, 0x1

    .line 205
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->isBound:Z

    return-void
.end method

.method public dispose()V
    .locals 3

    .line 244
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const/4 v1, 0x0

    const v2, 0x8892

    .line 245
    invoke-interface {v0, v2, v1}, Lcom/badlogic/gdx/graphics/GL20;->glBindBuffer(II)V

    .line 246
    iget v2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->bufferHandle:I

    invoke-interface {v0, v2}, Lcom/badlogic/gdx/graphics/GL20;->glDeleteBuffer(I)V

    .line 247
    iput v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->bufferHandle:I

    .line 248
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->ownsBuffer:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lcom/badlogic/gdx/utils/BufferUtils;->disposeUnsafeByteBuffer(Ljava/nio/ByteBuffer;)V

    :cond_0
    return-void
.end method

.method public getAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    return-object v0
.end method

.method public getBuffer()Ljava/nio/FloatBuffer;
    .locals 1

    const/4 v0, 0x1

    .line 98
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->isDirty:Z

    .line 99
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->buffer:Ljava/nio/FloatBuffer;

    return-object v0
.end method

.method public getNumMaxVertices()I
    .locals 2

    .line 93
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    iget v1, v1, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    div-int/2addr v0, v1

    return v0
.end method

.method public getNumVertices()I
    .locals 2

    .line 88
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->limit()I

    move-result v0

    mul-int/lit8 v0, v0, 0x4

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    iget v1, v1, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    div-int/2addr v0, v1

    return v0
.end method

.method protected getUsage()I
    .locals 1

    .line 154
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->usage:I

    return v0
.end method

.method public invalidate()V
    .locals 1

    .line 237
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/GL20;->glGenBuffer()I

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->bufferHandle:I

    const/4 v0, 0x1

    .line 238
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->isDirty:Z

    return-void
.end method

.method protected setBuffer(Ljava/nio/Buffer;ZLcom/badlogic/gdx/graphics/VertexAttributes;)V
    .locals 1

    .line 107
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->isBound:Z

    if-nez v0, :cond_2

    .line 108
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->ownsBuffer:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    .line 109
    invoke-static {v0}, Lcom/badlogic/gdx/utils/BufferUtils;->disposeUnsafeByteBuffer(Ljava/nio/ByteBuffer;)V

    .line 110
    :cond_0
    iput-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    .line 111
    instance-of p3, p1, Ljava/nio/ByteBuffer;

    if-eqz p3, :cond_1

    .line 112
    check-cast p1, Ljava/nio/ByteBuffer;

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 115
    iput-boolean p2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->ownsBuffer:Z

    .line 117
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result p1

    .line 118
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 119
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object p2

    iput-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->buffer:Ljava/nio/FloatBuffer;

    .line 120
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p2, p1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 121
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->buffer:Ljava/nio/FloatBuffer;

    div-int/lit8 p1, p1, 0x4

    invoke-virtual {p2, p1}, Ljava/nio/FloatBuffer;->limit(I)Ljava/nio/Buffer;

    return-void

    .line 114
    :cond_1
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Only ByteBuffer is currently supported"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 107
    :cond_2
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Cannot change attributes while VBO is bound"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected setUsage(I)V
    .locals 1

    .line 160
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->isBound:Z

    if-nez v0, :cond_0

    .line 161
    iput p1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->usage:I

    return-void

    .line 160
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Cannot change usage while VBO is bound"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setVertices([FII)V
    .locals 1

    const/4 v0, 0x1

    .line 133
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->isDirty:Z

    .line 134
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {p1, v0, p3, p2}, Lcom/badlogic/gdx/utils/BufferUtils;->copy([FLjava/nio/Buffer;II)V

    .line 135
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->buffer:Ljava/nio/FloatBuffer;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 136
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {p1, p3}, Ljava/nio/FloatBuffer;->limit(I)Ljava/nio/Buffer;

    .line 137
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->bufferChanged()V

    return-void
.end method

.method public unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 1

    const/4 v0, 0x0

    .line 213
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V

    return-void
.end method

.method public unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V
    .locals 5

    .line 218
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    .line 219
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/VertexAttributes;->size()I

    move-result v1

    const/4 v2, 0x0

    if-nez p2, :cond_0

    const/4 p2, 0x0

    :goto_0
    if-ge p2, v1, :cond_2

    .line 222
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v3, p2}, Lcom/badlogic/gdx/graphics/VertexAttributes;->get(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v3

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/VertexAttribute;->alias:Ljava/lang/String;

    invoke-virtual {p1, v3}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->disableVertexAttribute(Ljava/lang/String;)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_1
    if-ge v3, v1, :cond_2

    .line 226
    aget v4, p2, v3

    if-ltz v4, :cond_1

    .line 227
    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->disableVertexAttribute(I)V

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_2
    const p1, 0x8892

    .line 230
    invoke-interface {v0, p1, v2}, Lcom/badlogic/gdx/graphics/GL20;->glBindBuffer(II)V

    .line 231
    iput-boolean v2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->isBound:Z

    return-void
.end method

.method public updateVertices(I[FII)V
    .locals 2

    const/4 v0, 0x1

    .line 142
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->isDirty:Z

    .line 143
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    .line 144
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    mul-int/lit8 p1, p1, 0x4

    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 145
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {p2, p3, p4, p1}, Lcom/badlogic/gdx/utils/BufferUtils;->copy([FIILjava/nio/Buffer;)V

    .line 146
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 147
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->buffer:Ljava/nio/FloatBuffer;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 148
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;->bufferChanged()V

    return-void
.end method
