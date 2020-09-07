.class public interface abstract Lcom/badlogic/gdx/graphics/glutils/InstanceData;
.super Ljava/lang/Object;
.source "InstanceData.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Disposable;


# virtual methods
.method public abstract bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
.end method

.method public abstract bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V
.end method

.method public abstract dispose()V
.end method

.method public abstract getAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;
.end method

.method public abstract getBuffer()Ljava/nio/FloatBuffer;
.end method

.method public abstract getNumInstances()I
.end method

.method public abstract getNumMaxInstances()I
.end method

.method public abstract invalidate()V
.end method

.method public abstract setInstanceData(Ljava/nio/FloatBuffer;I)V
.end method

.method public abstract setInstanceData([FII)V
.end method

.method public abstract unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
.end method

.method public abstract unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V
.end method

.method public abstract updateInstanceData(ILjava/nio/FloatBuffer;II)V
.end method

.method public abstract updateInstanceData(I[FII)V
.end method
