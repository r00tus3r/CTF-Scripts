.class public Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;
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
    name = "Face"
.end annotation


# instance fields
.field library:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;


# direct methods
.method public constructor <init>(JLcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;)V
    .locals 0

    .line 116
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Pointer;-><init>(J)V

    .line 117
    iput-object p3, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->library:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;

    return-void
.end method

.method private static native doneFace(J)V
.end method

.method private static native getAscender(J)I
.end method

.method private static native getCharIndex(JI)I
.end method

.method private static native getDescender(J)I
.end method

.method private static native getFaceFlags(J)I
.end method

.method private static native getGlyph(J)J
.end method

.method private static native getHeight(J)I
.end method

.method private static native getKerning(JIII)I
.end method

.method private static native getMaxAdvanceHeight(J)I
.end method

.method private static native getMaxAdvanceWidth(J)I
.end method

.method private static native getNumGlyphs(J)I
.end method

.method private static native getSize(J)J
.end method

.method private static native getStyleFlags(J)I
.end method

.method private static native getUnderlinePosition(J)I
.end method

.method private static native getUnderlineThickness(J)I
.end method

.method private static native hasKerning(J)Z
.end method

.method private static native loadChar(JII)Z
.end method

.method private static native loadGlyph(JII)Z
.end method

.method private static native selectSize(JI)Z
.end method

.method private static native setCharSize(JIIII)Z
.end method

.method private static native setPixelSizes(JII)Z
.end method


# virtual methods
.method public dispose()V
    .locals 4

    .line 122
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->doneFace(J)V

    .line 123
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->library:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;->fontData:Lcom/badlogic/gdx/utils/LongMap;

    iget-wide v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/utils/LongMap;->get(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    .line 125
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->library:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;->fontData:Lcom/badlogic/gdx/utils/LongMap;

    iget-wide v2, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-virtual {v1, v2, v3}, Lcom/badlogic/gdx/utils/LongMap;->remove(J)Ljava/lang/Object;

    .line 126
    invoke-static {v0}, Lcom/badlogic/gdx/utils/BufferUtils;->disposeUnsafeByteBuffer(Ljava/nio/ByteBuffer;)V

    :cond_0
    return-void
.end method

.method public getAscender()I
    .locals 2

    .line 159
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getAscender(J)I

    move-result v0

    return v0
.end method

.method public getCharIndex(I)I
    .locals 2

    .line 290
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-static {v0, v1, p1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getCharIndex(JI)I

    move-result p1

    return p1
.end method

.method public getDescender()I
    .locals 2

    .line 167
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getDescender(J)I

    move-result v0

    return v0
.end method

.method public getFaceFlags()I
    .locals 2

    .line 135
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getFaceFlags(J)I

    move-result v0

    return v0
.end method

.method public getGlyph()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;
    .locals 3

    .line 255
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;

    iget-wide v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-static {v1, v2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getGlyph(J)J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;-><init>(J)V

    return-object v0
.end method

.method public getHeight()I
    .locals 2

    .line 175
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getHeight(J)I

    move-result v0

    return v0
.end method

.method public getKerning(III)I
    .locals 2

    .line 279
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-static {v0, v1, p1, p2, p3}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getKerning(JIII)I

    move-result p1

    return p1
.end method

.method public getMaxAdvanceHeight()I
    .locals 2

    .line 191
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getMaxAdvanceHeight(J)I

    move-result v0

    return v0
.end method

.method public getMaxAdvanceWidth()I
    .locals 2

    .line 183
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getMaxAdvanceWidth(J)I

    move-result v0

    return v0
.end method

.method public getNumGlyphs()I
    .locals 2

    .line 151
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getNumGlyphs(J)I

    move-result v0

    return v0
.end method

.method public getSize()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Size;
    .locals 3

    .line 263
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Size;

    iget-wide v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-static {v1, v2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getSize(J)J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Size;-><init>(J)V

    return-object v0
.end method

.method public getStyleFlags()I
    .locals 2

    .line 143
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getStyleFlags(J)I

    move-result v0

    return v0
.end method

.method public getUnderlinePosition()I
    .locals 2

    .line 199
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getUnderlinePosition(J)I

    move-result v0

    return v0
.end method

.method public getUnderlineThickness()I
    .locals 2

    .line 207
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getUnderlineThickness(J)I

    move-result v0

    return v0
.end method

.method public hasKerning()Z
    .locals 2

    .line 271
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->hasKerning(J)Z

    move-result v0

    return v0
.end method

.method public loadChar(II)Z
    .locals 2

    .line 247
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-static {v0, v1, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->loadChar(JII)Z

    move-result p1

    return p1
.end method

.method public loadGlyph(II)Z
    .locals 2

    .line 239
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-static {v0, v1, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->loadGlyph(JII)Z

    move-result p1

    return p1
.end method

.method public selectSize(I)Z
    .locals 2

    .line 215
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-static {v0, v1, p1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->selectSize(JI)Z

    move-result p1

    return p1
.end method

.method public setCharSize(IIII)Z
    .locals 6

    .line 223
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->setCharSize(JIIII)Z

    move-result p1

    return p1
.end method

.method public setPixelSizes(II)Z
    .locals 2

    .line 231
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->address:J

    invoke-static {v0, v1, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->setPixelSizes(JII)Z

    move-result p1

    return p1
.end method
