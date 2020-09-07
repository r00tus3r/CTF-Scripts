.class public Lcom/badlogic/gdx/graphics/glutils/HdpiUtils;
.super Ljava/lang/Object;
.source "HdpiUtils.java"


# static fields
.field private static mode:Lcom/badlogic/gdx/graphics/glutils/HdpiMode;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 29
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/HdpiMode;->Logical:Lcom/badlogic/gdx/graphics/glutils/HdpiMode;

    sput-object v0, Lcom/badlogic/gdx/graphics/glutils/HdpiUtils;->mode:Lcom/badlogic/gdx/graphics/glutils/HdpiMode;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static glScissor(IIII)V
    .locals 2

    .line 53
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/HdpiUtils;->mode:Lcom/badlogic/gdx/graphics/glutils/HdpiMode;

    sget-object v1, Lcom/badlogic/gdx/graphics/glutils/HdpiMode;->Logical:Lcom/badlogic/gdx/graphics/glutils/HdpiMode;

    if-ne v0, v1, :cond_1

    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getWidth()I

    move-result v0

    sget-object v1, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v1}, Lcom/badlogic/gdx/Graphics;->getBackBufferWidth()I

    move-result v1

    if-ne v0, v1, :cond_0

    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    .line 54
    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getHeight()I

    move-result v0

    sget-object v1, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v1}, Lcom/badlogic/gdx/Graphics;->getBackBufferHeight()I

    move-result v1

    if-eq v0, v1, :cond_1

    .line 55
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-static {p0}, Lcom/badlogic/gdx/graphics/glutils/HdpiUtils;->toBackBufferX(I)I

    move-result p0

    invoke-static {p1}, Lcom/badlogic/gdx/graphics/glutils/HdpiUtils;->toBackBufferY(I)I

    move-result p1

    invoke-static {p2}, Lcom/badlogic/gdx/graphics/glutils/HdpiUtils;->toBackBufferX(I)I

    move-result p2

    invoke-static {p3}, Lcom/badlogic/gdx/graphics/glutils/HdpiUtils;->toBackBufferY(I)I

    move-result p3

    invoke-interface {v0, p0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/GL20;->glScissor(IIII)V

    goto :goto_0

    .line 57
    :cond_1
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v0, p0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/GL20;->glScissor(IIII)V

    :goto_0
    return-void
.end method

.method public static glViewport(IIII)V
    .locals 2

    .line 64
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/HdpiUtils;->mode:Lcom/badlogic/gdx/graphics/glutils/HdpiMode;

    sget-object v1, Lcom/badlogic/gdx/graphics/glutils/HdpiMode;->Logical:Lcom/badlogic/gdx/graphics/glutils/HdpiMode;

    if-ne v0, v1, :cond_1

    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getWidth()I

    move-result v0

    sget-object v1, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v1}, Lcom/badlogic/gdx/Graphics;->getBackBufferWidth()I

    move-result v1

    if-ne v0, v1, :cond_0

    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    .line 65
    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getHeight()I

    move-result v0

    sget-object v1, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v1}, Lcom/badlogic/gdx/Graphics;->getBackBufferHeight()I

    move-result v1

    if-eq v0, v1, :cond_1

    .line 66
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-static {p0}, Lcom/badlogic/gdx/graphics/glutils/HdpiUtils;->toBackBufferX(I)I

    move-result p0

    invoke-static {p1}, Lcom/badlogic/gdx/graphics/glutils/HdpiUtils;->toBackBufferY(I)I

    move-result p1

    invoke-static {p2}, Lcom/badlogic/gdx/graphics/glutils/HdpiUtils;->toBackBufferX(I)I

    move-result p2

    invoke-static {p3}, Lcom/badlogic/gdx/graphics/glutils/HdpiUtils;->toBackBufferY(I)I

    move-result p3

    invoke-interface {v0, p0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/GL20;->glViewport(IIII)V

    goto :goto_0

    .line 68
    :cond_1
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v0, p0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/GL20;->glViewport(IIII)V

    :goto_0
    return-void
.end method

.method public static setMode(Lcom/badlogic/gdx/graphics/glutils/HdpiMode;)V
    .locals 0

    .line 47
    sput-object p0, Lcom/badlogic/gdx/graphics/glutils/HdpiUtils;->mode:Lcom/badlogic/gdx/graphics/glutils/HdpiMode;

    return-void
.end method

.method public static toBackBufferX(I)I
    .locals 1

    .line 93
    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getBackBufferWidth()I

    move-result v0

    mul-int p0, p0, v0

    int-to-float p0, p0

    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getWidth()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr p0, v0

    float-to-int p0, p0

    return p0
.end method

.method public static toBackBufferY(I)I
    .locals 1

    .line 101
    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getBackBufferHeight()I

    move-result v0

    mul-int p0, p0, v0

    int-to-float p0, p0

    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr p0, v0

    float-to-int p0, p0

    return p0
.end method

.method public static toLogicalX(I)I
    .locals 1

    .line 77
    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getWidth()I

    move-result v0

    mul-int p0, p0, v0

    int-to-float p0, p0

    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getBackBufferWidth()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr p0, v0

    float-to-int p0, p0

    return p0
.end method

.method public static toLogicalY(I)I
    .locals 1

    .line 85
    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getHeight()I

    move-result v0

    mul-int p0, p0, v0

    int-to-float p0, p0

    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getBackBufferHeight()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr p0, v0

    float-to-int p0, p0

    return p0
.end method
