.class public Lcom/badlogic/gdx/scenes/scene2d/ui/Label;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;
.source "Label.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;
    }
.end annotation


# static fields
.field private static final prefSizeLayout:Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;

.field private static final tempColor:Lcom/badlogic/gdx/graphics/Color;


# instance fields
.field private cache:Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;

.field private ellipsis:Ljava/lang/String;

.field private fontScaleChanged:Z

.field private fontScaleX:F

.field private fontScaleY:F

.field private intValue:I

.field private labelAlign:I

.field private lastPrefHeight:F

.field private final layout:Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;

.field private lineAlign:I

.field private final prefSize:Lcom/badlogic/gdx/math/Vector2;

.field private prefSizeInvalid:Z

.field private style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

.field private final text:Lcom/badlogic/gdx/utils/StringBuilder;

.field private wrap:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 34
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/Color;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->tempColor:Lcom/badlogic/gdx/graphics/Color;

    .line 35
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->prefSizeLayout:Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;

    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;)V
    .locals 1

    .line 72
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;-><init>()V

    .line 38
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->layout:Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;

    .line 39
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->prefSize:Lcom/badlogic/gdx/math/Vector2;

    .line 40
    new-instance v0, Lcom/badlogic/gdx/utils/StringBuilder;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->text:Lcom/badlogic/gdx/utils/StringBuilder;

    const/high16 v0, -0x80000000

    .line 41
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->intValue:I

    const/16 v0, 0x8

    .line 43
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->labelAlign:I

    .line 44
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->lineAlign:I

    const/4 v0, 0x1

    .line 47
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->prefSizeInvalid:Z

    const/high16 v0, 0x3f800000    # 1.0f

    .line 48
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->fontScaleX:F

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->fontScaleY:F

    const/4 v0, 0x0

    .line 49
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->fontScaleChanged:Z

    if-eqz p1, :cond_0

    .line 73
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->text:Lcom/badlogic/gdx/utils/StringBuilder;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/CharSequence;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 74
    :cond_0
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->setStyle(Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;)V

    if-eqz p1, :cond_1

    .line 75
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    if-lez p1, :cond_1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->getPrefWidth()F

    move-result p1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->getPrefHeight()F

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->setSize(FF)V

    :cond_1
    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;)V
    .locals 1

    .line 53
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->get(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;-><init>(Ljava/lang/CharSequence;Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;Ljava/lang/String;)V
    .locals 1

    .line 57
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    invoke-virtual {p2, p3, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;-><init>(Ljava/lang/CharSequence;Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;Ljava/lang/String;Lcom/badlogic/gdx/graphics/Color;)V
    .locals 1

    .line 63
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    invoke-virtual {p2, p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->getFont(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    move-result-object p2

    invoke-direct {v0, p2, p4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;-><init>(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Lcom/badlogic/gdx/graphics/Color;)V

    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;-><init>(Ljava/lang/CharSequence;Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 69
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    invoke-virtual {p2, p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->getFont(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    move-result-object p3

    invoke-virtual {p2, p4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->getColor(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/Color;

    move-result-object p2

    invoke-direct {v0, p3, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;-><init>(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Lcom/badlogic/gdx/graphics/Color;)V

    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;-><init>(Ljava/lang/CharSequence;Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;)V

    return-void
.end method

.method private computePrefSize()V
    .locals 8

    const/4 v0, 0x0

    .line 148
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->prefSizeInvalid:Z

    .line 149
    sget-object v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->prefSizeLayout:Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;

    .line 150
    iget-boolean v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->wrap:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->ellipsis:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 151
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->getWidth()F

    move-result v1

    .line 152
    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    iget-object v2, v2, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    iget-object v2, v2, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    invoke-interface {v2}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getLeftWidth()F

    move-result v2

    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    iget-object v3, v3, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    invoke-interface {v3}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getRightWidth()F

    move-result v3

    add-float/2addr v2, v3

    sub-float/2addr v1, v2

    :cond_0
    move v5, v1

    .line 153
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->cache:Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;->getFont()Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    move-result-object v2

    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->text:Lcom/badlogic/gdx/utils/StringBuilder;

    sget-object v4, Lcom/badlogic/gdx/graphics/Color;->WHITE:Lcom/badlogic/gdx/graphics/Color;

    const/16 v6, 0x8

    const/4 v7, 0x1

    move-object v1, v0

    invoke-virtual/range {v1 .. v7}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->setText(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Ljava/lang/CharSequence;Lcom/badlogic/gdx/graphics/Color;FIZ)V

    goto :goto_0

    .line 155
    :cond_1
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->cache:Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;->getFont()Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    move-result-object v1

    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->text:Lcom/badlogic/gdx/utils/StringBuilder;

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->setText(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Ljava/lang/CharSequence;)V

    .line 156
    :goto_0
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->prefSize:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->width:F

    iget v0, v0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->height:F

    invoke-virtual {v1, v2, v0}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    return-void
.end method

.method private scaleAndComputePrefSize()V
    .locals 6

    .line 137
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->cache:Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;->getFont()Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    move-result-object v0

    .line 138
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getScaleX()F

    move-result v1

    .line 139
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getScaleY()F

    move-result v2

    .line 140
    iget-boolean v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->fontScaleChanged:Z

    if-eqz v3, :cond_0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getData()Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;

    move-result-object v3

    iget v4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->fontScaleX:F

    iget v5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->fontScaleY:F

    invoke-virtual {v3, v4, v5}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->setScale(FF)V

    .line 142
    :cond_0
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->computePrefSize()V

    .line 144
    iget-boolean v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->fontScaleChanged:Z

    if-eqz v3, :cond_1

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getData()Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;

    move-result-object v0

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->setScale(FF)V

    :cond_1
    return-void
.end method


# virtual methods
.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V
    .locals 7

    .line 221
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->validate()V

    .line 222
    sget-object v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->tempColor:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    move-result-object v0

    .line 223
    iget v1, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float v1, v1, p2

    iput v1, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    .line 224
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    iget-object p2, p2, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz p2, :cond_0

    .line 225
    iget p2, v0, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v1, v0, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v2, v0, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v3, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {p1, p2, v1, v2, v3}, Lcom/badlogic/gdx/graphics/g2d/Batch;->setColor(FFFF)V

    .line 226
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    iget-object v1, p2, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->getX()F

    move-result v3

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->getY()F

    move-result v4

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->getWidth()F

    move-result v5

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->getHeight()F

    move-result v6

    move-object v2, p1

    invoke-interface/range {v1 .. v6}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    .line 228
    :cond_0
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    iget-object p2, p2, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;->fontColor:Lcom/badlogic/gdx/graphics/Color;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    iget-object p2, p2, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;->fontColor:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/graphics/Color;->mul(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    .line 229
    :cond_1
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->cache:Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;

    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;->tint(Lcom/badlogic/gdx/graphics/Color;)V

    .line 230
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->cache:Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->getX()F

    move-result v0

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->getY()F

    move-result v1

    invoke-virtual {p2, v0, v1}, Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;->setPosition(FF)V

    .line 231
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->cache:Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;

    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;)V

    return-void
.end method

.method protected getBitmapFontCache()Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;
    .locals 1

    .line 344
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->cache:Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;

    return-object v0
.end method

.method public getFontScaleX()F
    .locals 1

    .line 312
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->fontScaleX:F

    return v0
.end method

.method public getFontScaleY()F
    .locals 1

    .line 320
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->fontScaleY:F

    return v0
.end method

.method public getGlyphLayout()Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;
    .locals 1

    .line 254
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->layout:Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;

    return-object v0
.end method

.method public getLabelAlign()I
    .locals 1

    .line 270
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->labelAlign:I

    return v0
.end method

.method public getLineAlign()I
    .locals 1

    .line 274
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->lineAlign:I

    return v0
.end method

.method public getPrefHeight()F
    .locals 3

    .line 244
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->prefSizeInvalid:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->scaleAndComputePrefSize()V

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 246
    iget-boolean v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->fontScaleChanged:Z

    if-eqz v1, :cond_1

    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->fontScaleY:F

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;->font:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getScaleY()F

    move-result v1

    div-float/2addr v0, v1

    .line 247
    :cond_1
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->prefSize:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    iget-object v2, v2, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;->font:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getDescent()F

    move-result v2

    mul-float v2, v2, v0

    const/high16 v0, 0x40000000    # 2.0f

    mul-float v2, v2, v0

    sub-float/2addr v1, v2

    .line 248
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v0, :cond_2

    .line 249
    invoke-interface {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getTopHeight()F

    move-result v2

    invoke-interface {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getBottomHeight()F

    move-result v0

    add-float/2addr v2, v0

    add-float/2addr v1, v2

    :cond_2
    return v1
.end method

.method public getPrefWidth()F
    .locals 3

    .line 235
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->wrap:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 236
    :cond_0
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->prefSizeInvalid:Z

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->scaleAndComputePrefSize()V

    .line 237
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->prefSize:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 238
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v1, :cond_2

    .line 239
    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getLeftWidth()F

    move-result v2

    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getRightWidth()F

    move-result v1

    add-float/2addr v2, v1

    add-float/2addr v0, v2

    :cond_2
    return v0
.end method

.method public getStyle()Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    return-object v0
.end method

.method public getText()Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 1

    .line 128
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->text:Lcom/badlogic/gdx/utils/StringBuilder;

    return-object v0
.end method

.method public invalidate()V
    .locals 1

    .line 132
    invoke-super {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->invalidate()V

    const/4 v0, 0x1

    .line 133
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->prefSizeInvalid:Z

    return-void
.end method

.method public layout()V
    .locals 23

    move-object/from16 v0, p0

    .line 160
    iget-object v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->cache:Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;->getFont()Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    move-result-object v1

    .line 161
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getScaleX()F

    move-result v12

    .line 162
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getScaleY()F

    move-result v13

    .line 163
    iget-boolean v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->fontScaleChanged:Z

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getData()Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;

    move-result-object v2

    iget v3, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->fontScaleX:F

    iget v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->fontScaleY:F

    invoke-virtual {v2, v3, v4}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->setScale(FF)V

    .line 165
    :cond_0
    iget-boolean v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->wrap:Z

    if-eqz v2, :cond_1

    iget-object v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->ellipsis:Ljava/lang/String;

    if-nez v2, :cond_1

    const/4 v2, 0x1

    const/4 v14, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    const/4 v14, 0x0

    :goto_0
    if-eqz v14, :cond_2

    .line 167
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->getPrefHeight()F

    move-result v2

    .line 168
    iget v3, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->lastPrefHeight:F

    cmpl-float v3, v2, v3

    if-eqz v3, :cond_2

    .line 169
    iput v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->lastPrefHeight:F

    .line 170
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->invalidateHierarchy()V

    .line 174
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->getWidth()F

    move-result v2

    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->getHeight()F

    move-result v3

    .line 175
    iget-object v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    iget-object v4, v4, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v4, :cond_3

    .line 178
    invoke-interface {v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getLeftWidth()F

    move-result v5

    .line 179
    invoke-interface {v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getBottomHeight()F

    move-result v6

    .line 180
    invoke-interface {v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getLeftWidth()F

    move-result v7

    invoke-interface {v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getRightWidth()F

    move-result v8

    add-float/2addr v7, v8

    sub-float/2addr v2, v7

    .line 181
    invoke-interface {v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getBottomHeight()F

    move-result v7

    invoke-interface {v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getTopHeight()F

    move-result v4

    add-float/2addr v7, v4

    sub-float/2addr v3, v7

    move/from16 v16, v2

    move/from16 v19, v3

    move/from16 v17, v5

    move/from16 v18, v6

    goto :goto_1

    :cond_3
    move/from16 v16, v2

    move/from16 v19, v3

    const/16 v17, 0x0

    const/16 v18, 0x0

    .line 184
    :goto_1
    iget-object v11, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->layout:Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;

    const/high16 v20, 0x40000000    # 2.0f

    if-nez v14, :cond_5

    .line 186
    iget-object v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->text:Lcom/badlogic/gdx/utils/StringBuilder;

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_4

    goto :goto_2

    .line 200
    :cond_4
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getData()Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;

    move-result-object v2

    iget v2, v2, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->capHeight:F

    move v3, v2

    move-object v15, v11

    move/from16 v8, v16

    goto :goto_4

    .line 188
    :cond_5
    :goto_2
    iget-object v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->text:Lcom/badlogic/gdx/utils/StringBuilder;

    const/4 v5, 0x0

    iget v6, v4, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    sget-object v7, Lcom/badlogic/gdx/graphics/Color;->WHITE:Lcom/badlogic/gdx/graphics/Color;

    iget v9, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->lineAlign:I

    iget-object v10, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->ellipsis:Ljava/lang/String;

    move-object v2, v11

    move-object v3, v1

    move/from16 v8, v16

    move-object/from16 v21, v10

    move v10, v14

    move-object v15, v11

    move-object/from16 v11, v21

    invoke-virtual/range {v2 .. v11}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->setText(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Ljava/lang/CharSequence;IILcom/badlogic/gdx/graphics/Color;FIZLjava/lang/String;)V

    .line 189
    iget v2, v15, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->width:F

    .line 190
    iget v3, v15, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->height:F

    .line 192
    iget v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->labelAlign:I

    and-int/lit8 v5, v4, 0x8

    if-nez v5, :cond_7

    and-int/lit8 v4, v4, 0x10

    if-eqz v4, :cond_6

    sub-float v16, v16, v2

    goto :goto_3

    :cond_6
    sub-float v16, v16, v2

    div-float v16, v16, v20

    :goto_3
    add-float v17, v17, v16

    :cond_7
    move v8, v2

    :goto_4
    move/from16 v11, v17

    .line 203
    iget v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->labelAlign:I

    and-int/lit8 v4, v2, 0x2

    if-eqz v4, :cond_9

    .line 204
    iget-object v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->cache:Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;->getFont()Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    move-result-object v2

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->isFlipped()Z

    move-result v2

    if-eqz v2, :cond_8

    const/4 v2, 0x0

    goto :goto_5

    :cond_8
    sub-float v2, v19, v3

    :goto_5
    add-float v18, v18, v2

    .line 205
    iget-object v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    iget-object v2, v2, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;->font:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getDescent()F

    move-result v2

    add-float v18, v18, v2

    goto :goto_7

    :cond_9
    and-int/lit8 v2, v2, 0x4

    if-eqz v2, :cond_b

    .line 207
    iget-object v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->cache:Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;->getFont()Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    move-result-object v2

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->isFlipped()Z

    move-result v2

    if-eqz v2, :cond_a

    sub-float v2, v19, v3

    goto :goto_6

    :cond_a
    const/4 v2, 0x0

    :goto_6
    add-float v18, v18, v2

    .line 208
    iget-object v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    iget-object v2, v2, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;->font:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getDescent()F

    move-result v2

    sub-float v18, v18, v2

    goto :goto_7

    :cond_b
    sub-float v19, v19, v3

    div-float v19, v19, v20

    add-float v18, v18, v19

    .line 212
    :goto_7
    iget-object v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->cache:Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;->getFont()Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    move-result-object v2

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->isFlipped()Z

    move-result v2

    if-nez v2, :cond_c

    add-float v18, v18, v3

    :cond_c
    move/from16 v10, v18

    .line 214
    iget-object v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->text:Lcom/badlogic/gdx/utils/StringBuilder;

    const/4 v5, 0x0

    iget v6, v4, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    sget-object v7, Lcom/badlogic/gdx/graphics/Color;->WHITE:Lcom/badlogic/gdx/graphics/Color;

    iget v9, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->lineAlign:I

    iget-object v3, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->ellipsis:Ljava/lang/String;

    move-object v2, v15

    move-object/from16 v16, v3

    move-object v3, v1

    move/from16 v22, v10

    move v10, v14

    move v14, v11

    move-object/from16 v11, v16

    invoke-virtual/range {v2 .. v11}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->setText(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Ljava/lang/CharSequence;IILcom/badlogic/gdx/graphics/Color;FIZLjava/lang/String;)V

    .line 215
    iget-object v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->cache:Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;

    move/from16 v3, v22

    invoke-virtual {v2, v15, v14, v3}, Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;->setText(Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;FF)V

    .line 217
    iget-boolean v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->fontScaleChanged:Z

    if-eqz v2, :cond_d

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getData()Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;

    move-result-object v1

    invoke-virtual {v1, v12, v13}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->setScale(FF)V

    :cond_d
    return-void
.end method

.method public setAlignment(I)V
    .locals 0

    .line 281
    invoke-virtual {p0, p1, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->setAlignment(II)V

    return-void
.end method

.method public setAlignment(II)V
    .locals 0

    .line 288
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->labelAlign:I

    and-int/lit8 p1, p2, 0x8

    if-eqz p1, :cond_0

    const/16 p1, 0x8

    .line 291
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->lineAlign:I

    goto :goto_0

    :cond_0
    const/16 p1, 0x10

    and-int/2addr p2, p1

    if-eqz p2, :cond_1

    .line 293
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->lineAlign:I

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    .line 295
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->lineAlign:I

    .line 297
    :goto_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->invalidate()V

    return-void
.end method

.method public setEllipsis(Ljava/lang/String;)V
    .locals 0

    .line 330
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->ellipsis:Ljava/lang/String;

    return-void
.end method

.method public setEllipsis(Z)V
    .locals 0

    if-eqz p1, :cond_0

    const-string p1, "..."

    .line 337
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->ellipsis:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 339
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->ellipsis:Ljava/lang/String;

    :goto_0
    return-void
.end method

.method public setFontScale(F)V
    .locals 0

    .line 301
    invoke-virtual {p0, p1, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->setFontScale(FF)V

    return-void
.end method

.method public setFontScale(FF)V
    .locals 1

    const/4 v0, 0x1

    .line 305
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->fontScaleChanged:Z

    .line 306
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->fontScaleX:F

    .line 307
    iput p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->fontScaleY:F

    .line 308
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->invalidateHierarchy()V

    return-void
.end method

.method public setFontScaleX(F)V
    .locals 1

    .line 316
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->fontScaleY:F

    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->setFontScale(FF)V

    return-void
.end method

.method public setFontScaleY(F)V
    .locals 1

    .line 324
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->fontScaleX:F

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->setFontScale(FF)V

    return-void
.end method

.method public setStyle(Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;)V
    .locals 1

    if-eqz p1, :cond_1

    .line 80
    iget-object v0, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;->font:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    if-eqz v0, :cond_0

    .line 81
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    .line 82
    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;->font:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->newFontCache()Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->cache:Lcom/badlogic/gdx/graphics/g2d/BitmapFontCache;

    .line 83
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->invalidateHierarchy()V

    return-void

    .line 80
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Missing LabelStyle font."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 79
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "style cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .locals 2

    if-nez p1, :cond_0

    const-string p1, ""

    .line 105
    :cond_0
    instance-of v0, p1, Lcom/badlogic/gdx/utils/StringBuilder;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 106
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->text:Lcom/badlogic/gdx/utils/StringBuilder;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 107
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->text:Lcom/badlogic/gdx/utils/StringBuilder;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->setLength(I)V

    .line 108
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->text:Lcom/badlogic/gdx/utils/StringBuilder;

    check-cast p1, Lcom/badlogic/gdx/utils/StringBuilder;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Lcom/badlogic/gdx/utils/StringBuilder;)Lcom/badlogic/gdx/utils/StringBuilder;

    goto :goto_0

    .line 110
    :cond_2
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->textEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    return-void

    .line 111
    :cond_3
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->text:Lcom/badlogic/gdx/utils/StringBuilder;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->setLength(I)V

    .line 112
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->text:Lcom/badlogic/gdx/utils/StringBuilder;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/CharSequence;)Lcom/badlogic/gdx/utils/StringBuilder;

    :goto_0
    const/high16 p1, -0x80000000

    .line 114
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->intValue:I

    .line 115
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->invalidateHierarchy()V

    return-void
.end method

.method public setText(I)Z
    .locals 1

    .line 96
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->intValue:I

    if-ne v0, p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 97
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->setText(Ljava/lang/CharSequence;)V

    .line 98
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->intValue:I

    const/4 p1, 0x1

    return p1
.end method

.method public setWrap(Z)V
    .locals 0

    .line 265
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->wrap:Z

    .line 266
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->invalidateHierarchy()V

    return-void
.end method

.method public textEquals(Ljava/lang/CharSequence;)Z
    .locals 6

    .line 119
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->text:Lcom/badlogic/gdx/utils/StringBuilder;

    iget v0, v0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    .line 120
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->text:Lcom/badlogic/gdx/utils/StringBuilder;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    .line 121
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    const/4 v3, 0x0

    if-eq v0, v2, :cond_0

    return v3

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    .line 123
    aget-char v4, v1, v2

    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    if-eq v4, v5, :cond_1

    return v3

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x1

    return p1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 348
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->getName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 350
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2e

    .line 351
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    add-int/lit8 v1, v1, 0x1

    .line 352
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 353
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v3, 0x24

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-eq v3, v2, :cond_2

    const-string v2, "Label "

    goto :goto_0

    :cond_2
    const-string v2, ""

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ": "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->text:Lcom/badlogic/gdx/utils/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
