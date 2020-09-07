.class public Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;
.super Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;
.source "FreeTypeFontGenerator.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FreeTypeBitmapFontData"
.end annotation


# instance fields
.field generator:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;

.field glyphs:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;",
            ">;"
        }
    .end annotation
.end field

.field packer:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;

.field parameter:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;

.field regions:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g2d/TextureRegion;",
            ">;"
        }
    .end annotation
.end field

.field stroker:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 585
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;-><init>()V

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .line 632
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->stroker:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;->dispose()V

    .line 633
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->packer:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->dispose()V

    :cond_1
    return-void
.end method

.method public getGlyph(C)Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;
    .locals 10

    .line 597
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->getGlyph(C)Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;

    move-result-object v0

    if-nez v0, :cond_3

    .line 598
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->generator:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;

    if-eqz v1, :cond_3

    if-eqz p1, :cond_3

    .line 599
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->parameter:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;

    iget v0, v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->size:I

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->setPixelSizes(II)V

    .line 600
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->generator:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;

    iget-object v6, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->parameter:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;

    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->stroker:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->ascent:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->capHeight:F

    add-float/2addr v0, v1

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->scaleY:F

    div-float v8, v0, v1

    iget-object v9, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->packer:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;

    move v4, p1

    move-object v5, p0

    invoke-virtual/range {v3 .. v9}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->createGlyph(CLcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;FLcom/badlogic/gdx/graphics/g2d/PixmapPacker;)Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 603
    :cond_0
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->setGlyph(ILcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;)V

    .line 604
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->regions:Lcom/badlogic/gdx/utils/Array;

    iget v3, v0, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->page:I

    invoke-virtual {v1, v3}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->setGlyphRegion(Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    .line 605
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->glyphs:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 607
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->parameter:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;

    iget-boolean v1, v1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->kerning:Z

    if-eqz v1, :cond_3

    .line 608
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->generator:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    .line 609
    invoke-virtual {v1, p1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getCharIndex(I)I

    move-result v3

    .line 610
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->glyphs:Lcom/badlogic/gdx/utils/Array;

    iget v4, v4, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_3

    .line 611
    iget-object v6, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->glyphs:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v6, v5}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;

    .line 612
    iget v7, v6, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->id:I

    invoke-virtual {v1, v7}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getCharIndex(I)I

    move-result v7

    .line 614
    invoke-virtual {v1, v3, v7, v2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getKerning(III)I

    move-result v8

    if-eqz v8, :cond_1

    .line 615
    iget v9, v6, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->id:I

    invoke-static {v8}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->toInt(I)I

    move-result v8

    invoke-virtual {v0, v9, v8}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->setKerning(II)V

    .line 617
    :cond_1
    invoke-virtual {v1, v7, v3, v2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getKerning(III)I

    move-result v7

    if-eqz v7, :cond_2

    .line 618
    invoke-static {v7}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->toInt(I)I

    move-result v7

    invoke-virtual {v6, p1, v7}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->setKerning(II)V

    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_3
    return-object v0
.end method

.method public getGlyphs(Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;Ljava/lang/CharSequence;II)V
    .locals 2

    .line 626
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->packer:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->setPackToTexture(Z)V

    .line 627
    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->getGlyphs(Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;Ljava/lang/CharSequence;II)V

    return-void
.end method
