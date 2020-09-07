.class public Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;
.super Ljava/lang/Object;
.source "InstanceBufferObject.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/glutils/InstanceData;


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
.method public constructor <init>(ZILcom/badlogic/gdx/graphics/VertexAttributes;)V
    .locals 2

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 44
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->isDirty:Z

    .line 45
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->isBound:Z

    .line 52
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl30:Lcom/badlogic/gdx/graphics/GL30;

    if-eqz v1, :cond_1

    .line 55
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v1}, Lcom/badlogic/gdx/graphics/GL20;->glGenBuffer()I

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->bufferHandle:I

    .line 57
    iget v1, p3, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    mul-int v1, v1, p2

    invoke-static {v1}, Lcom/badlogic/gdx/utils/BufferUtils;->newUnsafeByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object p2

    .line 58
    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    const/4 v0, 0x1

    .line 59
    invoke-virtual {p0, p2, v0, p3}, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->setBuffer(Ljava/nio/Buffer;ZLcom/badlogic/gdx/graphics/VertexAttributes;)V

    if-eqz p1, :cond_0

    const p1, 0x88e4

    goto :goto_0

    :cond_0
    const p1, 0x88e8

    .line 60
    :goto_0
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->setUsage(I)V

    return-void

    .line 53
    :cond_1
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "InstanceBufferObject requires a device running with GLES 3.0 compatibilty"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public varargs constructor <init>(ZI[Lcom/badlogic/gdx/graphics/VertexAttribute;)V
    .locals 1

    .line 48
    new-instance v0, Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-direct {v0, p3}, Lcom/badlogic/gdx/graphics/VertexAttributes;-><init>([Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    invoke-direct {p0, p1, p2, v0}, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;-><init>(ZILcom/badlogic/gdx/graphics/VertexAttributes;)V

    return-void
.end method

.method private bufferChanged()V
    .locals 5

    .line 111
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->isBound:Z

    if-eqz v0, :cond_0

    .line 112
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    const/4 v2, 0x0

    iget v3, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->usage:I

    const v4, 0x8892

    invoke-interface {v0, v4, v1, v2, v3}, Lcom/badlogic/gdx/graphics/GL20;->glBufferData(IILjava/nio/Buffer;I)V

    .line 113
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    iget v3, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->usage:I

    invoke-interface {v0, v4, v1, v2, v3}, Lcom/badlogic/gdx/graphics/GL20;->glBufferData(IILjava/nio/Buffer;I)V

    const/4 v0, 0x0

    .line 114
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->isDirty:Z

    :cond_0
    return-void
.end method


# virtual methods
.method public bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 1

    const/4 v0, 0x0

    .line 184
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V

    return-void
.end method

.method public bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V
    .locals 13

    .line 189
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    .line 191
    iget v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->bufferHandle:I

    const v2, 0x8892

    invoke-interface {v0, v2, v1}, Lcom/badlogic/gdx/graphics/GL20;->glBindBuffer(II)V

    .line 192
    iget-boolean v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->isDirty:Z

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    .line 193
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v4}, Ljava/nio/FloatBuffer;->limit()I

    move-result v4

    mul-int/lit8 v4, v4, 0x4

    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 194
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    iget v5, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->usage:I

    invoke-interface {v0, v2, v1, v4, v5}, Lcom/badlogic/gdx/graphics/GL20;->glBufferData(IILjava/nio/Buffer;I)V

    .line 195
    iput-boolean v3, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->isDirty:Z

    .line 198
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/VertexAttributes;->size()I

    move-result v0

    const/4 v1, 0x1

    if-nez p2, :cond_2

    :goto_0
    if-ge v3, v0, :cond_4

    .line 201
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {p2, v3}, Lcom/badlogic/gdx/graphics/VertexAttributes;->get(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object p2

    .line 202
    iget-object v2, p2, Lcom/badlogic/gdx/graphics/VertexAttribute;->alias:Ljava/lang/String;

    invoke-virtual {p1, v2}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->getAttributeLocation(Ljava/lang/String;)I

    move-result v2

    if-gez v2, :cond_1

    goto :goto_1

    .line 205
    :cond_1
    iget v4, p2, Lcom/badlogic/gdx/graphics/VertexAttribute;->unit:I

    add-int/2addr v2, v4

    .line 206
    invoke-virtual {p1, v2}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->enableVertexAttribute(I)V

    .line 208
    iget v7, p2, Lcom/badlogic/gdx/graphics/VertexAttribute;->numComponents:I

    iget v8, p2, Lcom/badlogic/gdx/graphics/VertexAttribute;->type:I

    iget-boolean v9, p2, Lcom/badlogic/gdx/graphics/VertexAttribute;->normalized:Z

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    iget v10, v4, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    iget v11, p2, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    move-object v5, p1

    move v6, v2

    invoke-virtual/range {v5 .. v11}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setVertexAttribute(IIIZII)V

    .line 209
    sget-object p2, Lcom/badlogic/gdx/Gdx;->gl30:Lcom/badlogic/gdx/graphics/GL30;

    invoke-interface {p2, v2, v1}, Lcom/badlogic/gdx/graphics/GL30;->glVertexAttribDivisor(II)V

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    :goto_2
    if-ge v3, v0, :cond_4

    .line 214
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/graphics/VertexAttributes;->get(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v2

    .line 215
    aget v4, p2, v3

    if-gez v4, :cond_3

    goto :goto_3

    .line 218
    :cond_3
    iget v5, v2, Lcom/badlogic/gdx/graphics/VertexAttribute;->unit:I

    add-int/2addr v4, v5

    .line 219
    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->enableVertexAttribute(I)V

    .line 221
    iget v8, v2, Lcom/badlogic/gdx/graphics/VertexAttribute;->numComponents:I

    iget v9, v2, Lcom/badlogic/gdx/graphics/VertexAttribute;->type:I

    iget-boolean v10, v2, Lcom/badlogic/gdx/graphics/VertexAttribute;->normalized:Z

    iget-object v5, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    iget v11, v5, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    iget v12, v2, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    move-object v6, p1

    move v7, v4

    invoke-virtual/range {v6 .. v12}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setVertexAttribute(IIIZII)V

    .line 222
    sget-object v2, Lcom/badlogic/gdx/Gdx;->gl30:Lcom/badlogic/gdx/graphics/GL30;

    invoke-interface {v2, v4, v1}, Lcom/badlogic/gdx/graphics/GL30;->glVertexAttribDivisor(II)V

    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 225
    :cond_4
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->isBound:Z

    return-void
.end method

.method public dispose()V
    .locals 3

    .line 279
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const/4 v1, 0x0

    const v2, 0x8892

    .line 280
    invoke-interface {v0, v2, v1}, Lcom/badlogic/gdx/graphics/GL20;->glBindBuffer(II)V

    .line 281
    iget v2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->bufferHandle:I

    invoke-interface {v0, v2}, Lcom/badlogic/gdx/graphics/GL20;->glDeleteBuffer(I)V

    .line 282
    iput v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->bufferHandle:I

    .line 283
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->ownsBuffer:Z

    if-eqz v0, :cond_0

    .line 284
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lcom/badlogic/gdx/utils/BufferUtils;->disposeUnsafeByteBuffer(Ljava/nio/ByteBuffer;)V

    :cond_0
    return-void
.end method

.method public getAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    return-object v0
.end method

.method public getBuffer()Ljava/nio/FloatBuffer;
    .locals 1

    const/4 v0, 0x1

    .line 80
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->isDirty:Z

    .line 81
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->buffer:Ljava/nio/FloatBuffer;

    return-object v0
.end method

.method public getNumInstances()I
    .locals 2

    .line 70
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->limit()I

    move-result v0

    mul-int/lit8 v0, v0, 0x4

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    iget v1, v1, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    div-int/2addr v0, v1

    return v0
.end method

.method public getNumMaxInstances()I
    .locals 2

    .line 75
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    iget v1, v1, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    div-int/2addr v0, v1

    return v0
.end method

.method protected getUsage()I
    .locals 1

    .line 164
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->usage:I

    return v0
.end method

.method public invalidate()V
    .locals 1

    .line 270
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/GL20;->glGenBuffer()I

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->bufferHandle:I

    const/4 v0, 0x1

    .line 271
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->isDirty:Z

    return-void
.end method

.method protected setBuffer(Ljava/nio/Buffer;ZLcom/badlogic/gdx/graphics/VertexAttributes;)V
    .locals 1

    .line 92
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->isBound:Z

    if-nez v0, :cond_2

    .line 94
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->ownsBuffer:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    .line 95
    invoke-static {v0}, Lcom/badlogic/gdx/utils/BufferUtils;->disposeUnsafeByteBuffer(Ljava/nio/ByteBuffer;)V

    .line 96
    :cond_0
    iput-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    .line 97
    instance-of p3, p1, Ljava/nio/ByteBuffer;

    if-eqz p3, :cond_1

    .line 98
    check-cast p1, Ljava/nio/ByteBuffer;

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 101
    iput-boolean p2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->ownsBuffer:Z

    .line 103
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result p1

    .line 104
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 105
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object p2

    iput-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->buffer:Ljava/nio/FloatBuffer;

    .line 106
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p2, p1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 107
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->buffer:Ljava/nio/FloatBuffer;

    div-int/lit8 p1, p1, 0x4

    invoke-virtual {p2, p1}, Ljava/nio/FloatBuffer;->limit(I)Ljava/nio/Buffer;

    return-void

    .line 100
    :cond_1
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Only ByteBuffer is currently supported"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 93
    :cond_2
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Cannot change attributes while VBO is bound"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setInstanceData(Ljava/nio/FloatBuffer;I)V
    .locals 1

    const/4 v0, 0x1

    .line 129
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->isDirty:Z

    .line 130
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {p1, v0, p2}, Lcom/badlogic/gdx/utils/BufferUtils;->copy(Ljava/nio/Buffer;Ljava/nio/Buffer;I)V

    .line 131
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->buffer:Ljava/nio/FloatBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 132
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {p1, p2}, Ljava/nio/FloatBuffer;->limit(I)Ljava/nio/Buffer;

    .line 133
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->bufferChanged()V

    return-void
.end method

.method public setInstanceData([FII)V
    .locals 1

    const/4 v0, 0x1

    .line 120
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->isDirty:Z

    .line 121
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {p1, v0, p3, p2}, Lcom/badlogic/gdx/utils/BufferUtils;->copy([FLjava/nio/Buffer;II)V

    .line 122
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->buffer:Ljava/nio/FloatBuffer;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 123
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {p1, p3}, Ljava/nio/FloatBuffer;->limit(I)Ljava/nio/Buffer;

    .line 124
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->bufferChanged()V

    return-void
.end method

.method protected setUsage(I)V
    .locals 1

    .line 172
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->isBound:Z

    if-nez v0, :cond_0

    .line 174
    iput p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->usage:I

    return-void

    .line 173
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Cannot change usage while VBO is bound"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 1

    const/4 v0, 0x0

    .line 235
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V

    return-void
.end method

.method public unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V
    .locals 6

    .line 240
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    .line 241
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/VertexAttributes;->size()I

    move-result v1

    const/4 v2, 0x0

    if-nez p2, :cond_1

    const/4 p2, 0x0

    :goto_0
    if-ge p2, v1, :cond_3

    .line 244
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v3, p2}, Lcom/badlogic/gdx/graphics/VertexAttributes;->get(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v3

    .line 245
    iget-object v4, v3, Lcom/badlogic/gdx/graphics/VertexAttribute;->alias:Ljava/lang/String;

    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->getAttributeLocation(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_0

    goto :goto_1

    .line 248
    :cond_0
    iget v3, v3, Lcom/badlogic/gdx/graphics/VertexAttribute;->unit:I

    add-int/2addr v4, v3

    .line 249
    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->disableVertexAttribute(I)V

    :goto_1
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_2
    if-ge v3, v1, :cond_3

    .line 253
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v4, v3}, Lcom/badlogic/gdx/graphics/VertexAttributes;->get(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v4

    .line 254
    aget v5, p2, v3

    if-gez v5, :cond_2

    goto :goto_3

    .line 257
    :cond_2
    iget v4, v4, Lcom/badlogic/gdx/graphics/VertexAttribute;->unit:I

    add-int/2addr v5, v4

    .line 258
    invoke-virtual {p1, v5}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->enableVertexAttribute(I)V

    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_3
    const p1, 0x8892

    .line 261
    invoke-interface {v0, p1, v2}, Lcom/badlogic/gdx/graphics/GL20;->glBindBuffer(II)V

    .line 262
    iput-boolean v2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->isBound:Z

    return-void
.end method

.method public updateInstanceData(ILjava/nio/FloatBuffer;II)V
    .locals 2

    const/4 v0, 0x1

    .line 149
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->isDirty:Z

    .line 150
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    .line 151
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    mul-int/lit8 p1, p1, 0x4

    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    mul-int/lit8 p3, p3, 0x4

    .line 152
    invoke-virtual {p2, p3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 153
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {p2, p1, p4}, Lcom/badlogic/gdx/utils/BufferUtils;->copy(Ljava/nio/Buffer;Ljava/nio/Buffer;I)V

    .line 154
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 155
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->buffer:Ljava/nio/FloatBuffer;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 156
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->bufferChanged()V

    return-void
.end method

.method public updateInstanceData(I[FII)V
    .locals 2

    const/4 v0, 0x1

    .line 138
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->isDirty:Z

    .line 139
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    .line 140
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    mul-int/lit8 p1, p1, 0x4

    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 141
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {p2, p3, p4, p1}, Lcom/badlogic/gdx/utils/BufferUtils;->copy([FIILjava/nio/Buffer;)V

    .line 142
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 143
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->buffer:Ljava/nio/FloatBuffer;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 144
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;->bufferChanged()V

    return-void
.end method
