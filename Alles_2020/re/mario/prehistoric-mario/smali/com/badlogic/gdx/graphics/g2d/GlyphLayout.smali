.class public Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;
.super Ljava/lang/Object;
.source "GlyphLayout.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Pool$Poolable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;
    }
.end annotation


# instance fields
.field private final colorStack:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/Color;",
            ">;"
        }
    .end annotation
.end field

.field public height:F

.field public final runs:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;",
            ">;"
        }
    .end annotation
.end field

.field public width:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->runs:Lcom/badlogic/gdx/utils/Array;

    .line 38
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->colorStack:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Ljava/lang/CharSequence;)V
    .locals 2

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->runs:Lcom/badlogic/gdx/utils/Array;

    .line 38
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->colorStack:Lcom/badlogic/gdx/utils/Array;

    .line 46
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->setText(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Ljava/lang/CharSequence;IILcom/badlogic/gdx/graphics/Color;FIZLjava/lang/String;)V
    .locals 2

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->runs:Lcom/badlogic/gdx/utils/Array;

    .line 38
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->colorStack:Lcom/badlogic/gdx/utils/Array;

    .line 57
    invoke-virtual/range {p0 .. p9}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->setText(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Ljava/lang/CharSequence;IILcom/badlogic/gdx/graphics/Color;FIZLjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Ljava/lang/CharSequence;Lcom/badlogic/gdx/graphics/Color;FIZ)V
    .locals 2

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->runs:Lcom/badlogic/gdx/utils/Array;

    .line 38
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->colorStack:Lcom/badlogic/gdx/utils/Array;

    .line 51
    invoke-virtual/range {p0 .. p6}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->setText(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Ljava/lang/CharSequence;Lcom/badlogic/gdx/graphics/Color;FIZ)V

    return-void
.end method

.method private adjustLastGlyph(Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;)V
    .locals 2

    .line 420
    iget-object v0, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;

    .line 421
    iget-boolean v1, v0, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->fixedWidth:Z

    if-eqz v1, :cond_0

    return-void

    .line 422
    :cond_0
    iget v1, v0, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->width:I

    iget v0, v0, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->xoffset:I

    add-int/2addr v1, v0

    int-to-float v0, v1

    iget v1, p1, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->scaleX:F

    mul-float v0, v0, v1

    iget p1, p1, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->padRight:F

    sub-float/2addr v0, p1

    .line 423
    iget p1, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    iget-object v1, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/FloatArray;->peek()F

    move-result v1

    sub-float v1, v0, v1

    add-float/2addr p1, v1

    iput p1, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    .line 424
    iget-object p1, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object p2, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    iget p2, p2, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    add-int/lit8 p2, p2, -0x1

    invoke-virtual {p1, p2, v0}, Lcom/badlogic/gdx/utils/FloatArray;->set(IF)V

    return-void
.end method

.method private parseColorMarkup(Ljava/lang/CharSequence;IILcom/badlogic/gdx/utils/Pool;)I
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "II",
            "Lcom/badlogic/gdx/utils/Pool<",
            "Lcom/badlogic/gdx/graphics/Color;",
            ">;)I"
        }
    .end annotation

    const/4 v0, -0x1

    if-ne p2, p3, :cond_0

    return v0

    .line 429
    :cond_0
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    const/16 v2, 0x23

    const/4 v3, 0x0

    const/16 v4, 0x5d

    if-eq v1, v2, :cond_7

    const/16 v2, 0x5b

    if-eq v1, v2, :cond_6

    if-eq v1, v4, :cond_4

    add-int/lit8 v1, p2, 0x1

    :goto_0
    if-ge v1, p3, :cond_3

    .line 466
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    if-eq v2, v4, :cond_1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 468
    :cond_1
    invoke-interface {p1, p2, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/badlogic/gdx/graphics/Colors;->get(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/Color;

    move-result-object p1

    if-nez p1, :cond_2

    return v0

    .line 470
    :cond_2
    invoke-virtual {p4}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/badlogic/gdx/graphics/Color;

    .line 471
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->colorStack:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p4, p3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 472
    invoke-virtual {p3, p1}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    sub-int/2addr v1, p2

    return v1

    :cond_3
    return v0

    .line 460
    :cond_4
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->colorStack:Lcom/badlogic/gdx/utils/Array;

    iget p1, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 p2, 0x1

    if-le p1, p2, :cond_5

    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->colorStack:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Array;->pop()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p4, p1}, Lcom/badlogic/gdx/utils/Pool;->free(Ljava/lang/Object;)V

    :cond_5
    return v3

    :cond_6
    const/4 p1, -0x2

    return p1

    :cond_7
    add-int/lit8 v1, p2, 0x1

    const/4 v2, 0x0

    :goto_1
    if-ge v1, p3, :cond_e

    .line 434
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    if-ne v5, v4, :cond_b

    add-int/lit8 p1, p2, 0x2

    if-lt v1, p1, :cond_e

    add-int/lit8 p1, p2, 0x9

    if-le v1, p1, :cond_8

    goto :goto_5

    :cond_8
    sub-int/2addr v1, p2

    const/4 p1, 0x7

    if-gt v1, p1, :cond_a

    rsub-int/lit8 p1, v1, 0x9

    :goto_2
    if-ge v3, p1, :cond_9

    shl-int/lit8 v2, v2, 0x4

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_9
    or-int/lit16 v2, v2, 0xff

    .line 442
    :cond_a
    invoke-virtual {p4}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/Color;

    .line 443
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->colorStack:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 444
    invoke-static {p1, v2}, Lcom/badlogic/gdx/graphics/Color;->rgba8888ToColor(Lcom/badlogic/gdx/graphics/Color;I)V

    return v1

    :cond_b
    const/16 v6, 0x30

    if-lt v5, v6, :cond_c

    const/16 v6, 0x39

    if-gt v5, v6, :cond_c

    mul-int/lit8 v2, v2, 0x10

    add-int/lit8 v5, v5, -0x30

    :goto_3
    add-int/2addr v2, v5

    goto :goto_4

    :cond_c
    const/16 v6, 0x61

    if-lt v5, v6, :cond_d

    const/16 v6, 0x66

    if-gt v5, v6, :cond_d

    mul-int/lit8 v2, v2, 0x10

    add-int/lit8 v5, v5, -0x57

    goto :goto_3

    :cond_d
    const/16 v6, 0x41

    if-lt v5, v6, :cond_e

    const/16 v6, 0x46

    if-gt v5, v6, :cond_e

    mul-int/lit8 v2, v2, 0x10

    add-int/lit8 v5, v5, -0x37

    goto :goto_3

    :goto_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_e
    :goto_5
    return v0
.end method

.method private truncate(Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;FLjava/lang/String;ILcom/badlogic/gdx/utils/Pool;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;",
            "Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;",
            "F",
            "Ljava/lang/String;",
            "I",
            "Lcom/badlogic/gdx/utils/Pool<",
            "Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;",
            ">;)V"
        }
    .end annotation

    .line 316
    invoke-virtual {p6}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;

    .line 317
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object v0, p1

    move-object v1, p5

    move-object v2, p4

    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->getGlyphs(Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;Ljava/lang/CharSequence;IILcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;)V

    .line 319
    iget-object p4, p5, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    iget p4, p4, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-lez p4, :cond_1

    .line 320
    invoke-direct {p0, p1, p5}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->adjustLastGlyph(Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;)V

    .line 321
    iget-object p4, p5, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    iget p4, p4, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    :goto_0
    if-ge v1, p4, :cond_0

    .line 322
    iget-object v3, p5, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    invoke-virtual {v3, v1}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v3

    add-float/2addr v2, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    move v1, v2

    :cond_1
    sub-float/2addr p3, v1

    .line 328
    iget p4, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->x:F

    const/4 v2, 0x0

    move v3, p4

    const/4 p4, 0x0

    .line 329
    :goto_1
    iget-object v4, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    iget v4, v4, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    if-ge p4, v4, :cond_3

    .line 330
    iget-object v4, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    invoke-virtual {v4, p4}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v4

    add-float/2addr v3, v4

    cmpl-float v5, v3, p3

    if-lez v5, :cond_2

    .line 333
    iget p3, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->x:F

    sub-float/2addr v3, p3

    sub-float/2addr v3, v4

    iput v3, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    goto :goto_2

    :cond_2
    add-int/lit8 p4, p4, 0x1

    goto :goto_1

    :cond_3
    :goto_2
    if-le p4, v0, :cond_4

    .line 341
    iget-object p3, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    add-int/lit8 v2, p4, -0x1

    invoke-virtual {p3, v2}, Lcom/badlogic/gdx/utils/Array;->truncate(I)V

    .line 342
    iget-object p3, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    invoke-virtual {p3, p4}, Lcom/badlogic/gdx/utils/FloatArray;->truncate(I)V

    .line 343
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->adjustLastGlyph(Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;)V

    .line 344
    iget-object p1, p5, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    iget p1, p1, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    if-lez p1, :cond_5

    iget-object p1, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object p3, p5, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object p4, p5, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    iget p4, p4, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    sub-int/2addr p4, v0

    invoke-virtual {p1, p3, v0, p4}, Lcom/badlogic/gdx/utils/FloatArray;->addAll(Lcom/badlogic/gdx/utils/FloatArray;II)V

    goto :goto_3

    .line 347
    :cond_4
    iget-object p1, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 348
    iget-object p1, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/FloatArray;->clear()V

    .line 349
    iget-object p1, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object p3, p5, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    invoke-virtual {p1, p3}, Lcom/badlogic/gdx/utils/FloatArray;->addAll(Lcom/badlogic/gdx/utils/FloatArray;)V

    .line 350
    iget-object p1, p5, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    iget p1, p1, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    if-lez p1, :cond_5

    iget p1, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    iget-object p3, p5, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    invoke-virtual {p3, v2}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result p3

    add-float/2addr p1, p3

    iput p1, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    .line 352
    :cond_5
    :goto_3
    iget-object p1, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    iget-object p3, p5, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, p3}, Lcom/badlogic/gdx/utils/Array;->addAll(Lcom/badlogic/gdx/utils/Array;)V

    .line 353
    iget p1, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    add-float/2addr p1, v1

    iput p1, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    .line 355
    invoke-virtual {p6, p5}, Lcom/badlogic/gdx/utils/Pool;->free(Ljava/lang/Object;)V

    return-void
.end method

.method private wrap(Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;Lcom/badlogic/gdx/utils/Pool;II)Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;",
            "Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;",
            "Lcom/badlogic/gdx/utils/Pool<",
            "Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;",
            ">;II)",
            "Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;"
        }
    .end annotation

    .line 361
    iget-object v0, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    .line 362
    iget-object v1, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    .line 363
    iget-object v2, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    move v3, p4

    :goto_0
    if-lez v3, :cond_1

    add-int/lit8 v4, v3, -0x1

    .line 368
    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;

    iget v4, v4, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->id:I

    int-to-char v4, v4

    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->isWhitespace(C)Z

    move-result v4

    if-nez v4, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    :cond_1
    :goto_1
    if-ge p4, v1, :cond_3

    .line 373
    invoke-virtual {v0, p4}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;

    iget v4, v4, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->id:I

    int-to-char v4, v4

    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->isWhitespace(C)Z

    move-result v4

    if-nez v4, :cond_2

    goto :goto_2

    :cond_2
    add-int/lit8 p4, p4, 0x1

    goto :goto_1

    :cond_3
    :goto_2
    if-ge p5, v3, :cond_4

    .line 377
    iget v4, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    add-int/lit8 v5, p5, 0x1

    invoke-virtual {v2, p5}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result p5

    add-float/2addr v4, p5

    iput v4, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    move p5, v5

    goto :goto_2

    :cond_4
    add-int/lit8 v4, v3, 0x1

    :goto_3
    if-le p5, v4, :cond_5

    .line 381
    iget v5, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    add-int/lit8 p5, p5, -0x1

    invoke-virtual {v2, p5}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v6

    sub-float/2addr v5, v6

    iput v5, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    goto :goto_3

    :cond_5
    const/4 p5, 0x0

    if-ge p4, v1, :cond_6

    .line 387
    invoke-virtual {p3}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;

    .line 388
    iget-object v1, p5, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->color:Lcom/badlogic/gdx/graphics/Color;

    iget-object v5, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v1, v5}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    .line 390
    iget-object v1, p5, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    const/4 v5, 0x0

    .line 391
    invoke-virtual {v1, v0, v5, v3}, Lcom/badlogic/gdx/utils/Array;->addAll(Lcom/badlogic/gdx/utils/Array;II)V

    add-int/lit8 v6, p4, -0x1

    .line 392
    invoke-virtual {v0, v5, v6}, Lcom/badlogic/gdx/utils/Array;->removeRange(II)V

    .line 393
    iput-object v1, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    .line 394
    iput-object v0, p5, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    .line 396
    iget-object v1, p5, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    .line 397
    invoke-virtual {v1, v2, v5, v4}, Lcom/badlogic/gdx/utils/FloatArray;->addAll(Lcom/badlogic/gdx/utils/FloatArray;II)V

    const/4 v4, 0x1

    .line 398
    invoke-virtual {v2, v4, p4}, Lcom/badlogic/gdx/utils/FloatArray;->removeRange(II)V

    .line 399
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->first()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;

    iget p4, p4, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->xoffset:I

    neg-int p4, p4

    int-to-float p4, p4

    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->scaleX:F

    mul-float p4, p4, v0

    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->padLeft:F

    sub-float/2addr p4, v0

    invoke-virtual {v2, v5, p4}, Lcom/badlogic/gdx/utils/FloatArray;->set(IF)V

    .line 400
    iput-object v1, p2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    .line 401
    iput-object v2, p5, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    goto :goto_4

    .line 404
    :cond_6
    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/Array;->truncate(I)V

    .line 405
    invoke-virtual {v2, v4}, Lcom/badlogic/gdx/utils/FloatArray;->truncate(I)V

    :goto_4
    if-nez v3, :cond_7

    .line 410
    invoke-virtual {p3, p2}, Lcom/badlogic/gdx/utils/Pool;->free(Ljava/lang/Object;)V

    .line 411
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->runs:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Array;->pop()Ljava/lang/Object;

    goto :goto_5

    .line 413
    :cond_7
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->adjustLastGlyph(Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;)V

    :goto_5
    return-object p5
.end method


# virtual methods
.method public reset()V
    .locals 2

    .line 479
    const-class v0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;

    invoke-static {v0}, Lcom/badlogic/gdx/utils/Pools;->get(Ljava/lang/Class;)Lcom/badlogic/gdx/utils/Pool;

    move-result-object v0

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->runs:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Pool;->freeAll(Lcom/badlogic/gdx/utils/Array;)V

    .line 480
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->runs:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    const/4 v0, 0x0

    .line 482
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->width:F

    .line 483
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->height:F

    return-void
.end method

.method public setText(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Ljava/lang/CharSequence;)V
    .locals 10

    .line 63
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v4

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v5

    const/4 v3, 0x0

    const/4 v6, 0x0

    const/16 v7, 0x8

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v9}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->setText(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Ljava/lang/CharSequence;IILcom/badlogic/gdx/graphics/Color;FIZLjava/lang/String;)V

    return-void
.end method

.method public setText(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Ljava/lang/CharSequence;IILcom/badlogic/gdx/graphics/Color;FIZLjava/lang/String;)V
    .locals 29

    move-object/from16 v7, p0

    move-object/from16 v6, p2

    move/from16 v8, p4

    move-object/from16 v0, p1

    .line 83
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->data:Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;

    if-eqz p9, :cond_0

    const/4 v12, 0x1

    goto :goto_0

    .line 87
    :cond_0
    iget v0, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->spaceXadvance:F

    const/high16 v1, 0x40400000    # 3.0f

    mul-float v0, v0, v1

    cmpg-float v0, p6, v0

    if-gtz v0, :cond_1

    const/4 v12, 0x0

    goto :goto_0

    :cond_1
    move/from16 v12, p8

    .line 90
    :goto_0
    iget-boolean v13, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->markupEnabled:Z

    .line 92
    const-class v0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;

    invoke-static {v0}, Lcom/badlogic/gdx/utils/Pools;->get(Ljava/lang/Class;)Lcom/badlogic/gdx/utils/Pool;

    move-result-object v14

    .line 93
    iget-object v15, v7, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->runs:Lcom/badlogic/gdx/utils/Array;

    .line 94
    invoke-virtual {v14, v15}, Lcom/badlogic/gdx/utils/Pool;->freeAll(Lcom/badlogic/gdx/utils/Array;)V

    .line 95
    invoke-virtual {v15}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 101
    iget-object v5, v7, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->colorStack:Lcom/badlogic/gdx/utils/Array;

    move-object/from16 v0, p5

    .line 103
    invoke-virtual {v5, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 104
    const-class v1, Lcom/badlogic/gdx/graphics/Color;

    invoke-static {v1}, Lcom/badlogic/gdx/utils/Pools;->get(Ljava/lang/Class;)Lcom/badlogic/gdx/utils/Pool;

    move-result-object v4

    const/16 v16, 0x0

    move/from16 v2, p3

    move-object v3, v0

    move-object/from16 v22, v3

    move-object/from16 v1, v16

    const/4 v11, 0x0

    const/16 v17, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    move v0, v2

    :goto_1
    if-ne v0, v8, :cond_3

    if-ne v2, v8, :cond_2

    move-object/from16 v26, v4

    move-object v13, v5

    move/from16 v0, v17

    move/from16 v8, v19

    :goto_2
    move/from16 v1, v20

    goto/16 :goto_b

    :cond_2
    move-object/from16 p5, v1

    move v10, v8

    move-object/from16 v25, v22

    const/16 v24, 0x0

    move/from16 v22, v0

    goto :goto_4

    :cond_3
    add-int/lit8 v10, v0, 0x1

    .line 116
    invoke-interface {v6, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    move-object/from16 p5, v1

    const/16 v1, 0xa

    if-eq v0, v1, :cond_7

    const/16 v1, 0x5b

    if-eq v0, v1, :cond_4

    goto :goto_3

    :cond_4
    if-eqz v13, :cond_6

    .line 125
    invoke-direct {v7, v6, v10, v8, v4}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->parseColorMarkup(Ljava/lang/CharSequence;IILcom/badlogic/gdx/utils/Pool;)I

    move-result v0

    if-ltz v0, :cond_5

    add-int/lit8 v1, v10, -0x1

    add-int/lit8 v0, v0, 0x1

    add-int/2addr v10, v0

    .line 129
    invoke-virtual {v5}, Lcom/badlogic/gdx/utils/Array;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/Color;

    move-object/from16 v25, v0

    move/from16 v22, v10

    const/4 v0, -0x1

    const/16 v24, 0x0

    move v10, v1

    goto :goto_5

    :cond_5
    const/4 v1, -0x2

    if-ne v0, v1, :cond_6

    add-int/lit8 v0, v10, 0x1

    move-object/from16 v1, p5

    goto :goto_1

    :cond_6
    :goto_3
    move-object/from16 v25, v22

    const/4 v0, -0x1

    const/16 v24, 0x0

    move/from16 v22, v10

    const/4 v10, -0x1

    goto :goto_5

    :cond_7
    add-int/lit8 v0, v10, -0x1

    move-object/from16 v25, v22

    const/16 v24, 0x1

    move/from16 v22, v10

    move v10, v0

    :goto_4
    const/4 v0, -0x1

    :goto_5
    if-eq v10, v0, :cond_2b

    if-eq v10, v2, :cond_28

    .line 143
    invoke-virtual {v14}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;

    .line 144
    iget-object v0, v1, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    move-object v0, v9

    move-object v3, v1

    move/from16 p3, v2

    move-object/from16 v2, p2

    move-object v6, v3

    move/from16 p1, v13

    const/4 v13, 0x0

    move/from16 v3, p3

    move-object v13, v4

    move v4, v10

    move-object/from16 v26, v13

    move-object v13, v5

    move-object/from16 v5, p5

    .line 145
    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->getGlyphs(Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;Ljava/lang/CharSequence;IILcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;)V

    .line 146
    iget-object v0, v6, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    if-nez v0, :cond_8

    .line 147
    invoke-virtual {v14, v6}, Lcom/badlogic/gdx/utils/Pool;->free(Ljava/lang/Object;)V

    move-object/from16 v0, p5

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/16 v23, 0x1

    goto/16 :goto_19

    :cond_8
    move-object/from16 v0, p5

    if-eqz v0, :cond_a

    .line 151
    iget-boolean v1, v0, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->fixedWidth:Z

    if-eqz v1, :cond_9

    iget v0, v0, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->xadvance:I

    int-to-float v0, v0

    iget v1, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->scaleX:F

    mul-float v0, v0, v1

    goto :goto_6

    :cond_9
    iget v1, v0, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->width:I

    iget v0, v0, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->xoffset:I

    add-int/2addr v1, v0

    int-to-float v0, v1

    iget v1, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->scaleX:F

    mul-float v0, v0, v1

    iget v1, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->padRight:F

    sub-float/2addr v0, v1

    :goto_6
    sub-float v17, v17, v0

    :cond_a
    move/from16 v0, v17

    .line 154
    iget-object v1, v6, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;

    .line 155
    iput v0, v6, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->x:F

    .line 156
    iput v11, v6, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->y:F

    if-nez v24, :cond_b

    if-ne v10, v8, :cond_c

    .line 157
    :cond_b
    invoke-direct {v7, v9, v6}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->adjustLastGlyph(Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;)V

    .line 158
    :cond_c
    invoke-virtual {v15, v6}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 160
    iget-object v2, v6, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v2, v2, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    .line 161
    iget-object v3, v6, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    iget v3, v3, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    if-nez v12, :cond_e

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_7
    if-ge v4, v3, :cond_d

    .line 165
    aget v17, v2, v4

    add-float v5, v5, v17

    add-int/lit8 v4, v4, 0x1

    goto :goto_7

    :cond_d
    add-float/2addr v0, v5

    .line 167
    iput v5, v6, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    goto :goto_8

    :cond_e
    const/4 v4, 0x0

    .line 172
    aget v5, v2, v4

    add-float/2addr v0, v5

    .line 173
    aget v5, v2, v4

    iput v5, v6, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    const/4 v4, 0x1

    if-ge v3, v4, :cond_f

    :goto_8
    move v3, v0

    move/from16 v6, v19

    const/4 v2, 0x0

    :goto_9
    const/4 v5, 0x0

    const/16 v23, 0x1

    goto/16 :goto_1a

    .line 175
    :cond_f
    aget v5, v2, v4

    add-float/2addr v0, v5

    .line 176
    iget v5, v6, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    aget v17, v2, v4

    add-float v5, v5, v17

    iput v5, v6, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    const/16 v17, 0x2

    const/4 v5, 0x2

    move/from16 v28, v11

    move-object v11, v6

    move/from16 v6, v19

    move/from16 v19, v28

    :goto_a
    if-ge v5, v3, :cond_27

    .line 178
    iget-object v4, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    move-object/from16 p5, v1

    add-int/lit8 v1, v5, -0x1

    invoke-virtual {v4, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;

    move/from16 v27, v1

    .line 179
    iget v1, v4, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->width:I

    iget v4, v4, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->xoffset:I

    add-int/2addr v1, v4

    int-to-float v1, v1

    iget v4, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->scaleX:F

    mul-float v1, v1, v4

    iget v4, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->padRight:F

    sub-float/2addr v1, v4

    add-float/2addr v1, v0

    cmpg-float v1, v1, p6

    if-gtz v1, :cond_10

    .line 182
    aget v1, v2, v5

    add-float/2addr v0, v1

    .line 183
    iget v1, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    aget v4, v2, v5

    add-float/2addr v1, v4

    iput v1, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    move-object/from16 v4, p5

    move-object v1, v2

    move/from16 v18, v5

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/16 v23, 0x1

    goto/16 :goto_18

    :cond_10
    if-eqz p9, :cond_1a

    move-object/from16 v0, p0

    move-object v1, v9

    move-object v2, v11

    move/from16 v3, p6

    move-object/from16 v4, p9

    move v8, v6

    move-object v6, v14

    .line 189
    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->truncate(Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;FLjava/lang/String;ILcom/badlogic/gdx/utils/Pool;)V

    .line 190
    iget v0, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->x:F

    iget v1, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    add-float v17, v0, v1

    move/from16 v0, v17

    goto/16 :goto_2

    .line 275
    :goto_b
    invoke-static {v8, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 277
    iget v2, v13, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v3, 0x1

    :goto_c
    if-ge v3, v2, :cond_11

    .line 278
    invoke-virtual {v13, v3}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v6, v26

    invoke-virtual {v6, v4}, Lcom/badlogic/gdx/utils/Pool;->free(Ljava/lang/Object;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    .line 279
    :cond_11
    invoke-virtual {v13}, Lcom/badlogic/gdx/utils/Array;->clear()V

    and-int/lit8 v2, p7, 0x8

    if-nez v2, :cond_18

    const/4 v2, 0x1

    and-int/lit8 v3, p7, 0x1

    if-eqz v3, :cond_12

    const/16 v18, 0x1

    goto :goto_d

    :cond_12
    const/16 v18, 0x0

    :goto_d
    const/high16 v2, -0x31000000

    .line 285
    iget v3, v15, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/high16 v5, -0x31000000

    const/16 v23, 0x0

    :goto_e
    const/high16 v6, 0x40000000    # 2.0f

    if-ge v2, v3, :cond_16

    .line 287
    invoke-virtual {v15, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;

    .line 288
    iget v10, v8, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->y:F

    cmpl-float v10, v10, v5

    if-eqz v10, :cond_15

    .line 289
    iget v5, v8, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->y:F

    sub-float v4, p6, v4

    if-eqz v18, :cond_13

    div-float/2addr v4, v6

    :cond_13
    move v6, v4

    move/from16 v4, v23

    :goto_f
    if-ge v4, v2, :cond_14

    add-int/lit8 v10, v4, 0x1

    .line 293
    invoke-virtual {v15, v4}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;

    iget v11, v4, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->x:F

    add-float/2addr v11, v6

    iput v11, v4, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->x:F

    move v4, v10

    goto :goto_f

    :cond_14
    move/from16 v23, v4

    const/4 v4, 0x0

    .line 296
    :cond_15
    iget v6, v8, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->x:F

    iget v8, v8, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    add-float/2addr v6, v8

    invoke-static {v4, v6}, Ljava/lang/Math;->max(FF)F

    move-result v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    :cond_16
    sub-float v2, p6, v4

    if-eqz v18, :cond_17

    div-float/2addr v2, v6

    :cond_17
    move v4, v2

    move/from16 v2, v23

    :goto_10
    if-ge v2, v3, :cond_18

    add-int/lit8 v5, v2, 0x1

    .line 301
    invoke-virtual {v15, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;

    iget v6, v2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->x:F

    add-float/2addr v6, v4

    iput v6, v2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->x:F

    move v2, v5

    goto :goto_10

    .line 304
    :cond_18
    iput v0, v7, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->width:F

    .line 305
    iget-boolean v0, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->flipped:Z

    if-eqz v0, :cond_19

    .line 306
    iget v0, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->capHeight:F

    int-to-float v1, v1

    iget v2, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->down:F

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    move/from16 v4, v21

    int-to-float v1, v4

    iget v2, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->down:F

    mul-float v1, v1, v2

    iget v2, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->blankLineScale:F

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    iput v0, v7, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->height:F

    goto :goto_11

    :cond_19
    move/from16 v4, v21

    .line 308
    iget v0, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->capHeight:F

    int-to-float v1, v1

    iget v2, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->down:F

    neg-float v2, v2

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    int-to-float v1, v4

    iget v2, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->down:F

    neg-float v2, v2

    mul-float v1, v1, v2

    iget v2, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->blankLineScale:F

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    iput v0, v7, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->height:F

    :goto_11
    return-void

    :cond_1a
    move v3, v6

    move/from16 v4, v21

    move-object/from16 v6, v26

    .line 195
    iget-object v0, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v9, v0, v5}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->getWrapIndex(Lcom/badlogic/gdx/utils/Array;I)I

    move-result v0

    .line 196
    iget v1, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->x:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-nez v1, :cond_1b

    if-eqz v0, :cond_1d

    :cond_1b
    iget-object v1, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-lt v0, v1, :cond_1c

    goto :goto_12

    :cond_1c
    move/from16 v27, v0

    :cond_1d
    :goto_12
    if-nez v27, :cond_24

    const/4 v0, 0x0

    .line 203
    iput v0, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    .line 206
    iget-object v0, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    move/from16 v1, v27

    :goto_13
    if-ge v1, v0, :cond_1f

    .line 207
    iget-object v2, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;

    iget v2, v2, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->id:I

    int-to-char v2, v2

    invoke-virtual {v9, v2}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->isWhitespace(C)Z

    move-result v2

    if-nez v2, :cond_1e

    goto :goto_14

    :cond_1e
    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    :cond_1f
    :goto_14
    if-lez v1, :cond_20

    .line 209
    iget-object v0, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    add-int/lit8 v2, v1, -0x1

    const/4 v5, 0x0

    invoke-virtual {v0, v5, v2}, Lcom/badlogic/gdx/utils/Array;->removeRange(II)V

    .line 210
    iget-object v0, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/utils/FloatArray;->removeRange(II)V

    .line 212
    :cond_20
    iget-object v0, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v1, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->first()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;

    iget v1, v1, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->xoffset:I

    neg-int v1, v1

    int-to-float v1, v1

    iget v2, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->scaleX:F

    mul-float v1, v1, v2

    iget v2, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->padLeft:F

    sub-float/2addr v1, v2

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/utils/FloatArray;->set(IF)V

    .line 214
    iget v0, v15, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_23

    .line 216
    iget v0, v15, Lcom/badlogic/gdx/utils/Array;->size:I

    add-int/lit8 v0, v0, -0x2

    invoke-virtual {v15, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;

    .line 217
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    iget v2, v2, Lcom/badlogic/gdx/utils/Array;->size:I

    sub-int/2addr v2, v1

    :goto_15
    if-lez v2, :cond_22

    .line 219
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;

    .line 220
    iget v1, v1, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->id:I

    int-to-char v1, v1

    invoke-virtual {v9, v1}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->isWhitespace(C)Z

    move-result v1

    if-nez v1, :cond_21

    goto :goto_16

    .line 221
    :cond_21
    iget v1, v0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    move/from16 v21, v4

    add-int/lit8 v4, v2, 0x1

    invoke-virtual {v5, v4}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v4

    sub-float/2addr v1, v4

    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    add-int/lit8 v2, v2, -0x1

    move/from16 v4, v21

    goto :goto_15

    :cond_22
    :goto_16
    move/from16 v21, v4

    .line 223
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->glyphs:Lcom/badlogic/gdx/utils/Array;

    add-int/lit8 v4, v2, 0x1

    invoke-virtual {v1, v4}, Lcom/badlogic/gdx/utils/Array;->truncate(I)V

    .line 224
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    add-int/lit8 v2, v2, 0x2

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/FloatArray;->truncate(I)V

    .line 225
    invoke-direct {v7, v9, v0}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->adjustLastGlyph(Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;)V

    .line 226
    iget v1, v0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->x:F

    iget v0, v0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    add-float/2addr v1, v0

    invoke-static {v3, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    move-object/from16 v26, v6

    move v6, v0

    goto :goto_17

    :cond_23
    move/from16 v21, v4

    move-object/from16 v26, v6

    move v6, v3

    goto :goto_17

    :cond_24
    move/from16 v21, v4

    move-object/from16 v0, p0

    move-object v1, v9

    move-object v2, v11

    move v4, v3

    move-object v3, v14

    move-object/from16 v26, v6

    move v6, v4

    move/from16 v4, v27

    .line 229
    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->wrap(Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;Lcom/badlogic/gdx/utils/Pool;II)Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;

    move-result-object v0

    .line 230
    iget v1, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->x:F

    iget v2, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    add-float/2addr v1, v2

    invoke-static {v6, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    if-nez v0, :cond_25

    .line 233
    iget v0, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->down:F

    add-float v11, v19, v0

    add-int/lit8 v20, v20, 0x1

    move v6, v1

    move-object/from16 v1, v16

    const/4 v2, 0x0

    const/4 v3, 0x0

    goto/16 :goto_9

    .line 238
    :cond_25
    invoke-virtual {v15, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    move-object v11, v0

    move v6, v1

    .line 242
    :goto_17
    iget-object v0, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    iget v0, v0, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    .line 243
    iget-object v1, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->xAdvances:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    const/4 v2, 0x0

    .line 244
    aget v3, v1, v2

    const/4 v4, 0x1

    if-le v0, v4, :cond_26

    .line 245
    aget v5, v1, v4

    add-float/2addr v3, v5

    .line 246
    :cond_26
    iget v4, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    add-float/2addr v4, v3

    iput v4, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->width:F

    .line 247
    iget v4, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->down:F

    add-float v4, v19, v4

    add-int/lit8 v20, v20, 0x1

    const/4 v5, 0x0

    .line 249
    iput v5, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->x:F

    .line 250
    iput v4, v11, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->y:F

    move/from16 v19, v4

    move-object/from16 v4, v16

    const/16 v18, 0x1

    const/16 v23, 0x1

    move/from16 v28, v3

    move v3, v0

    move/from16 v0, v28

    :goto_18
    add-int/lit8 v18, v18, 0x1

    move-object v2, v1

    move-object v1, v4

    move/from16 v5, v18

    goto/16 :goto_a

    :cond_27
    move-object/from16 p5, v1

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/16 v23, 0x1

    move v3, v0

    move/from16 v11, v19

    goto :goto_1a

    :cond_28
    move-object/from16 v0, p5

    move/from16 p3, v2

    move-object/from16 v26, v4

    move/from16 p1, v13

    const/4 v2, 0x0

    const/16 v23, 0x1

    move-object v13, v5

    const/4 v5, 0x0

    :goto_19
    move-object v1, v0

    move/from16 v3, v17

    move/from16 v6, v19

    :goto_1a
    if-eqz v24, :cond_2a

    .line 259
    invoke-static {v6, v3}, Ljava/lang/Math;->max(FF)F

    move-result v6

    .line 261
    iget v0, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->down:F

    move/from16 v1, p3

    if-ne v10, v1, :cond_29

    .line 263
    iget v1, v9, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->blankLineScale:F

    mul-float v0, v0, v1

    add-int/lit8 v21, v21, 0x1

    goto :goto_1b

    :cond_29
    add-int/lit8 v20, v20, 0x1

    :goto_1b
    add-float/2addr v11, v0

    move-object/from16 v1, v16

    const/4 v3, 0x0

    :cond_2a
    move/from16 v17, v3

    move/from16 v19, v6

    move/from16 v0, v22

    move-object/from16 v3, v25

    goto :goto_1c

    :cond_2b
    move-object/from16 v0, p5

    move v1, v2

    move-object/from16 v26, v4

    move/from16 p1, v13

    const/4 v2, 0x0

    const/16 v23, 0x1

    move-object v13, v5

    const/4 v5, 0x0

    move/from16 v28, v1

    move-object v1, v0

    move/from16 v0, v28

    :goto_1c
    move-object/from16 v6, p2

    move v2, v0

    move-object v5, v13

    move/from16 v0, v22

    move-object/from16 v22, v25

    move-object/from16 v4, v26

    move/from16 v13, p1

    goto/16 :goto_1
.end method

.method public setText(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Ljava/lang/CharSequence;Lcom/badlogic/gdx/graphics/Color;FIZ)V
    .locals 10

    .line 69
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v4

    const/4 v3, 0x0

    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    move v6, p4

    move v7, p5

    move/from16 v8, p6

    invoke-virtual/range {v0 .. v9}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->setText(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Ljava/lang/CharSequence;IILcom/badlogic/gdx/graphics/Color;FIZLjava/lang/String;)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 487
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->runs:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    if-nez v0, :cond_0

    const-string v0, ""

    return-object v0

    .line 488
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 489
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->width:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const/16 v1, 0x78

    .line 490
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 491
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->height:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const/16 v1, 0xa

    .line 492
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    .line 493
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->runs:Lcom/badlogic/gdx/utils/Array;

    iget v3, v3, Lcom/badlogic/gdx/utils/Array;->size:I

    :goto_0
    if-ge v2, v3, :cond_1

    .line 494
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->runs:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v4, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;

    invoke-virtual {v4}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 495
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 497
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 498
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
