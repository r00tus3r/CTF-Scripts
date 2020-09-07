.class public Lbox2dLight/BlendFunc;
.super Ljava/lang/Object;
.source "BlendFunc.java"


# instance fields
.field final default_dfactor:I

.field final default_sfactor:I

.field dfactor:I

.field sfactor:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput p1, p0, Lbox2dLight/BlendFunc;->default_sfactor:I

    .line 17
    iput p2, p0, Lbox2dLight/BlendFunc;->default_dfactor:I

    .line 18
    iput p1, p0, Lbox2dLight/BlendFunc;->sfactor:I

    .line 19
    iput p2, p0, Lbox2dLight/BlendFunc;->dfactor:I

    return-void
.end method


# virtual methods
.method public apply()V
    .locals 3

    .line 43
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    iget v1, p0, Lbox2dLight/BlendFunc;->sfactor:I

    iget v2, p0, Lbox2dLight/BlendFunc;->dfactor:I

    invoke-interface {v0, v1, v2}, Lcom/badlogic/gdx/graphics/GL20;->glBlendFunc(II)V

    return-void
.end method

.method public reset()V
    .locals 1

    .line 35
    iget v0, p0, Lbox2dLight/BlendFunc;->default_sfactor:I

    iput v0, p0, Lbox2dLight/BlendFunc;->sfactor:I

    .line 36
    iget v0, p0, Lbox2dLight/BlendFunc;->default_dfactor:I

    iput v0, p0, Lbox2dLight/BlendFunc;->dfactor:I

    return-void
.end method

.method public set(II)V
    .locals 0

    .line 26
    iput p1, p0, Lbox2dLight/BlendFunc;->sfactor:I

    .line 27
    iput p2, p0, Lbox2dLight/BlendFunc;->dfactor:I

    return-void
.end method
