.class public Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;
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
    name = "Glyph"
.end annotation


# instance fields
.field private rendered:Z


# direct methods
.method constructor <init>(J)V
    .locals 0

    .line 487
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Pointer;-><init>(J)V

    return-void
.end method

.method private static native done(J)V
.end method

.method private static native getBitmap(J)J
.end method

.method private static native getLeft(J)I
.end method

.method private static native getTop(J)I
.end method

.method private static native strokeBorder(JJZ)J
.end method

.method private static native toBitmap(JI)J
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .line 492
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->done(J)V

    return-void
.end method

.method public getBitmap()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;
    .locals 3

    .line 524
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->rendered:Z

    if-eqz v0, :cond_0

    .line 527
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;

    iget-wide v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->address:J

    invoke-static {v1, v2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->getBitmap(J)J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;-><init>(J)V

    return-object v0

    .line 525
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Glyph is not yet rendered"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getLeft()I
    .locals 2

    .line 536
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->rendered:Z

    if-eqz v0, :cond_0

    .line 539
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->getLeft(J)I

    move-result v0

    return v0

    .line 537
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Glyph is not yet rendered"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTop()I
    .locals 2

    .line 548
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->rendered:Z

    if-eqz v0, :cond_0

    .line 551
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->getTop(J)I

    move-result v0

    return v0

    .line 549
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Glyph is not yet rendered"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public strokeBorder(Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;Z)V
    .locals 4

    .line 500
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->address:J

    iget-wide v2, p1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;->address:J

    invoke-static {v0, v1, v2, v3, p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->strokeBorder(JJZ)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->address:J

    return-void
.end method

.method public toBitmap(I)V
    .locals 4

    .line 510
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->address:J

    invoke-static {v0, v1, p1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->toBitmap(JI)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-eqz p1, :cond_0

    .line 512
    iput-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->address:J

    const/4 p1, 0x1

    .line 513
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->rendered:Z

    return-void

    .line 511
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Couldn\'t render glyph"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
