.class public Lcom/badlogic/gdx/graphics/Color;
.super Ljava/lang/Object;
.source "Color.java"


# static fields
.field public static final BLACK:Lcom/badlogic/gdx/graphics/Color;

.field public static final BLUE:Lcom/badlogic/gdx/graphics/Color;

.field public static final BROWN:Lcom/badlogic/gdx/graphics/Color;

.field public static final CHARTREUSE:Lcom/badlogic/gdx/graphics/Color;

.field public static final CLEAR:Lcom/badlogic/gdx/graphics/Color;

.field public static final CORAL:Lcom/badlogic/gdx/graphics/Color;

.field public static final CYAN:Lcom/badlogic/gdx/graphics/Color;

.field public static final DARK_GRAY:Lcom/badlogic/gdx/graphics/Color;

.field public static final FIREBRICK:Lcom/badlogic/gdx/graphics/Color;

.field public static final FOREST:Lcom/badlogic/gdx/graphics/Color;

.field public static final GOLD:Lcom/badlogic/gdx/graphics/Color;

.field public static final GOLDENROD:Lcom/badlogic/gdx/graphics/Color;

.field public static final GRAY:Lcom/badlogic/gdx/graphics/Color;

.field public static final GREEN:Lcom/badlogic/gdx/graphics/Color;

.field public static final LIGHT_GRAY:Lcom/badlogic/gdx/graphics/Color;

.field public static final LIME:Lcom/badlogic/gdx/graphics/Color;

.field public static final MAGENTA:Lcom/badlogic/gdx/graphics/Color;

.field public static final MAROON:Lcom/badlogic/gdx/graphics/Color;

.field public static final NAVY:Lcom/badlogic/gdx/graphics/Color;

.field public static final OLIVE:Lcom/badlogic/gdx/graphics/Color;

.field public static final ORANGE:Lcom/badlogic/gdx/graphics/Color;

.field public static final PINK:Lcom/badlogic/gdx/graphics/Color;

.field public static final PURPLE:Lcom/badlogic/gdx/graphics/Color;

.field public static final RED:Lcom/badlogic/gdx/graphics/Color;

.field public static final ROYAL:Lcom/badlogic/gdx/graphics/Color;

.field public static final SALMON:Lcom/badlogic/gdx/graphics/Color;

.field public static final SCARLET:Lcom/badlogic/gdx/graphics/Color;

.field public static final SKY:Lcom/badlogic/gdx/graphics/Color;

.field public static final SLATE:Lcom/badlogic/gdx/graphics/Color;

.field public static final TAN:Lcom/badlogic/gdx/graphics/Color;

.field public static final TEAL:Lcom/badlogic/gdx/graphics/Color;

.field public static final VIOLET:Lcom/badlogic/gdx/graphics/Color;

.field public static final WHITE:Lcom/badlogic/gdx/graphics/Color;

.field public static final WHITE_FLOAT_BITS:F

.field public static final YELLOW:Lcom/badlogic/gdx/graphics/Color;


# instance fields
.field public a:F

.field public b:F

.field public g:F

.field public r:F


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 26
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v1, v1, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->WHITE:Lcom/badlogic/gdx/graphics/Color;

    .line 27
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v2, -0x40404001

    invoke-direct {v0, v2}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->LIGHT_GRAY:Lcom/badlogic/gdx/graphics/Color;

    .line 28
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v2, 0x7f7f7fff

    invoke-direct {v0, v2}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->GRAY:Lcom/badlogic/gdx/graphics/Color;

    .line 29
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v2, 0x3f3f3fff

    invoke-direct {v0, v2}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->DARK_GRAY:Lcom/badlogic/gdx/graphics/Color;

    .line 30
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const/4 v2, 0x0

    invoke-direct {v0, v2, v2, v2, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->BLACK:Lcom/badlogic/gdx/graphics/Color;

    .line 33
    sget-object v0, Lcom/badlogic/gdx/graphics/Color;->WHITE:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result v0

    sput v0, Lcom/badlogic/gdx/graphics/Color;->WHITE_FLOAT_BITS:F

    .line 35
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v0, v2, v2, v2, v2}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->CLEAR:Lcom/badlogic/gdx/graphics/Color;

    .line 37
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v0, v2, v2, v1, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->BLUE:Lcom/badlogic/gdx/graphics/Color;

    .line 38
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-direct {v0, v2, v2, v3, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->NAVY:Lcom/badlogic/gdx/graphics/Color;

    .line 39
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v4, 0x4169e1ff

    invoke-direct {v0, v4}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->ROYAL:Lcom/badlogic/gdx/graphics/Color;

    .line 40
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v4, 0x708090ff

    invoke-direct {v0, v4}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->SLATE:Lcom/badlogic/gdx/graphics/Color;

    .line 41
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v4, -0x78311401

    invoke-direct {v0, v4}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->SKY:Lcom/badlogic/gdx/graphics/Color;

    .line 42
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v0, v2, v1, v1, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->CYAN:Lcom/badlogic/gdx/graphics/Color;

    .line 43
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v0, v2, v3, v3, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->TEAL:Lcom/badlogic/gdx/graphics/Color;

    .line 45
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v3, 0xff00ff

    invoke-direct {v0, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->GREEN:Lcom/badlogic/gdx/graphics/Color;

    .line 46
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v3, 0x7fff00ff

    invoke-direct {v0, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->CHARTREUSE:Lcom/badlogic/gdx/graphics/Color;

    .line 47
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v3, 0x32cd32ff

    invoke-direct {v0, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->LIME:Lcom/badlogic/gdx/graphics/Color;

    .line 48
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v3, 0x228b22ff

    invoke-direct {v0, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->FOREST:Lcom/badlogic/gdx/graphics/Color;

    .line 49
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v3, 0x6b8e23ff

    invoke-direct {v0, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->OLIVE:Lcom/badlogic/gdx/graphics/Color;

    .line 51
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v3, -0xff01

    invoke-direct {v0, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->YELLOW:Lcom/badlogic/gdx/graphics/Color;

    .line 52
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v3, -0x28ff01

    invoke-direct {v0, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->GOLD:Lcom/badlogic/gdx/graphics/Color;

    .line 53
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v3, -0x255adf01

    invoke-direct {v0, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->GOLDENROD:Lcom/badlogic/gdx/graphics/Color;

    .line 54
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v3, -0x5aff01

    invoke-direct {v0, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->ORANGE:Lcom/badlogic/gdx/graphics/Color;

    .line 56
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v3, -0x74baec01

    invoke-direct {v0, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->BROWN:Lcom/badlogic/gdx/graphics/Color;

    .line 57
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v3, -0x2d4b7301

    invoke-direct {v0, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->TAN:Lcom/badlogic/gdx/graphics/Color;

    .line 58
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v3, -0x4ddddd01

    invoke-direct {v0, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->FIREBRICK:Lcom/badlogic/gdx/graphics/Color;

    .line 60
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v3, -0xffff01

    invoke-direct {v0, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->RED:Lcom/badlogic/gdx/graphics/Color;

    .line 61
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v3, -0xcbe301

    invoke-direct {v0, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->SCARLET:Lcom/badlogic/gdx/graphics/Color;

    .line 62
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v3, -0x80af01

    invoke-direct {v0, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->CORAL:Lcom/badlogic/gdx/graphics/Color;

    .line 63
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v3, -0x57f8d01

    invoke-direct {v0, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->SALMON:Lcom/badlogic/gdx/graphics/Color;

    .line 64
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v3, -0x964b01

    invoke-direct {v0, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->PINK:Lcom/badlogic/gdx/graphics/Color;

    .line 65
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v0, v1, v2, v1, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->MAGENTA:Lcom/badlogic/gdx/graphics/Color;

    .line 67
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v1, -0x5fdf0f01

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->PURPLE:Lcom/badlogic/gdx/graphics/Color;

    .line 68
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v1, -0x117d1101

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->VIOLET:Lcom/badlogic/gdx/graphics/Color;

    .line 69
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const v1, -0x4fcf9f01

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Color;->MAROON:Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(FFFF)V
    .locals 0

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput p1, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    .line 91
    iput p2, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    .line 92
    iput p3, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    .line 93
    iput p4, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    .line 94
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Color;->clamp()Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    invoke-static {p0, p1}, Lcom/badlogic/gdx/graphics/Color;->rgba8888ToColor(Lcom/badlogic/gdx/graphics/Color;I)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 0

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method

.method public static abgr8888ToColor(Lcom/badlogic/gdx/graphics/Color;F)V
    .locals 2

    .line 487
    invoke-static {p1}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToIntColor(F)I

    move-result p1

    const/high16 v0, -0x1000000

    and-int/2addr v0, p1

    ushr-int/lit8 v0, v0, 0x18

    int-to-float v0, v0

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr v0, v1

    .line 488
    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    const/high16 v0, 0xff0000

    and-int/2addr v0, p1

    ushr-int/lit8 v0, v0, 0x10

    int-to-float v0, v0

    div-float/2addr v0, v1

    .line 489
    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    const v0, 0xff00

    and-int/2addr v0, p1

    ushr-int/lit8 v0, v0, 0x8

    int-to-float v0, v0

    div-float/2addr v0, v1

    .line 490
    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    and-int/lit16 p1, p1, 0xff

    int-to-float p1, p1

    div-float/2addr p1, v1

    .line 491
    iput p1, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    return-void
.end method

.method public static alpha(F)I
    .locals 1

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float p0, p0, v0

    float-to-int p0, p0

    return p0
.end method

.method public static argb8888(FFFF)I
    .locals 1

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float p0, p0, v0

    float-to-int p0, p0

    shl-int/lit8 p0, p0, 0x18

    mul-float p1, p1, v0

    float-to-int p1, p1

    shl-int/lit8 p1, p1, 0x10

    or-int/2addr p0, p1

    mul-float p2, p2, v0

    float-to-int p1, p2

    shl-int/lit8 p1, p1, 0x8

    or-int/2addr p0, p1

    mul-float p3, p3, v0

    float-to-int p1, p3

    or-int/2addr p0, p1

    return p0
.end method

.method public static argb8888(Lcom/badlogic/gdx/graphics/Color;)I
    .locals 3

    .line 423
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    const/high16 v1, 0x437f0000    # 255.0f

    mul-float v0, v0, v1

    float-to-int v0, v0

    shl-int/lit8 v0, v0, 0x18

    iget v2, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    mul-float v2, v2, v1

    float-to-int v2, v2

    shl-int/lit8 v2, v2, 0x10

    or-int/2addr v0, v2

    iget v2, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    mul-float v2, v2, v1

    float-to-int v2, v2

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v0, v2

    iget p0, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    mul-float p0, p0, v1

    float-to-int p0, p0

    or-int/2addr p0, v0

    return p0
.end method

.method public static argb8888ToColor(Lcom/badlogic/gdx/graphics/Color;I)V
    .locals 2

    const/high16 v0, -0x1000000

    and-int/2addr v0, p1

    ushr-int/lit8 v0, v0, 0x18

    int-to-float v0, v0

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr v0, v1

    .line 478
    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    const/high16 v0, 0xff0000

    and-int/2addr v0, p1

    ushr-int/lit8 v0, v0, 0x10

    int-to-float v0, v0

    div-float/2addr v0, v1

    .line 479
    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    const v0, 0xff00

    and-int/2addr v0, p1

    ushr-int/lit8 v0, v0, 0x8

    int-to-float v0, v0

    div-float/2addr v0, v1

    .line 480
    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    and-int/lit16 p1, p1, 0xff

    int-to-float p1, p1

    div-float/2addr p1, v1

    .line 481
    iput p1, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    return-void
.end method

.method public static luminanceAlpha(FF)I
    .locals 1

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float p0, p0, v0

    float-to-int p0, p0

    shl-int/lit8 p0, p0, 0x8

    mul-float p1, p1, v0

    float-to-int p1, p1

    or-int/2addr p0, p1

    return p0
.end method

.method public static rgb565(FFF)I
    .locals 2

    const/high16 v0, 0x41f80000    # 31.0f

    mul-float p0, p0, v0

    float-to-int p0, p0

    shl-int/lit8 p0, p0, 0xb

    const/high16 v1, 0x427c0000    # 63.0f

    mul-float p1, p1, v1

    float-to-int p1, p1

    shl-int/lit8 p1, p1, 0x5

    or-int/2addr p0, p1

    mul-float p2, p2, v0

    float-to-int p1, p2

    or-int/2addr p0, p1

    return p0
.end method

.method public static rgb565(Lcom/badlogic/gdx/graphics/Color;)I
    .locals 4

    .line 407
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    const/high16 v1, 0x41f80000    # 31.0f

    mul-float v0, v0, v1

    float-to-int v0, v0

    shl-int/lit8 v0, v0, 0xb

    iget v2, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    const/high16 v3, 0x427c0000    # 63.0f

    mul-float v2, v2, v3

    float-to-int v2, v2

    shl-int/lit8 v2, v2, 0x5

    or-int/2addr v0, v2

    iget p0, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    mul-float p0, p0, v1

    float-to-int p0, p0

    or-int/2addr p0, v0

    return p0
.end method

.method public static rgb565ToColor(Lcom/badlogic/gdx/graphics/Color;I)V
    .locals 3

    const v0, 0xf800

    and-int/2addr v0, p1

    ushr-int/lit8 v0, v0, 0xb

    int-to-float v0, v0

    const/high16 v1, 0x41f80000    # 31.0f

    div-float/2addr v0, v1

    .line 432
    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    and-int/lit16 v0, p1, 0x7e0

    ushr-int/lit8 v0, v0, 0x5

    int-to-float v0, v0

    const/high16 v2, 0x427c0000    # 63.0f

    div-float/2addr v0, v2

    .line 433
    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    and-int/lit8 p1, p1, 0x1f

    ushr-int/lit8 p1, p1, 0x0

    int-to-float p1, p1

    div-float/2addr p1, v1

    .line 434
    iput p1, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    return-void
.end method

.method public static rgb888(FFF)I
    .locals 1

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float p0, p0, v0

    float-to-int p0, p0

    shl-int/lit8 p0, p0, 0x10

    mul-float p1, p1, v0

    float-to-int p1, p1

    shl-int/lit8 p1, p1, 0x8

    or-int/2addr p0, p1

    mul-float p2, p2, v0

    float-to-int p1, p2

    or-int/2addr p0, p1

    return p0
.end method

.method public static rgb888(Lcom/badlogic/gdx/graphics/Color;)I
    .locals 3

    .line 415
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    const/high16 v1, 0x437f0000    # 255.0f

    mul-float v0, v0, v1

    float-to-int v0, v0

    shl-int/lit8 v0, v0, 0x10

    iget v2, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    mul-float v2, v2, v1

    float-to-int v2, v2

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v0, v2

    iget p0, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    mul-float p0, p0, v1

    float-to-int p0, p0

    or-int/2addr p0, v0

    return p0
.end method

.method public static rgb888ToColor(Lcom/badlogic/gdx/graphics/Color;I)V
    .locals 2

    const/high16 v0, 0xff0000

    and-int/2addr v0, p1

    ushr-int/lit8 v0, v0, 0x10

    int-to-float v0, v0

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr v0, v1

    .line 455
    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    const v0, 0xff00

    and-int/2addr v0, p1

    ushr-int/lit8 v0, v0, 0x8

    int-to-float v0, v0

    div-float/2addr v0, v1

    .line 456
    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    and-int/lit16 p1, p1, 0xff

    int-to-float p1, p1

    div-float/2addr p1, v1

    .line 457
    iput p1, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    return-void
.end method

.method public static rgba4444(FFFF)I
    .locals 1

    const/high16 v0, 0x41700000    # 15.0f

    mul-float p0, p0, v0

    float-to-int p0, p0

    shl-int/lit8 p0, p0, 0xc

    mul-float p1, p1, v0

    float-to-int p1, p1

    shl-int/lit8 p1, p1, 0x8

    or-int/2addr p0, p1

    mul-float p2, p2, v0

    float-to-int p1, p2

    shl-int/lit8 p1, p1, 0x4

    or-int/2addr p0, p1

    mul-float p3, p3, v0

    float-to-int p1, p3

    or-int/2addr p0, p1

    return p0
.end method

.method public static rgba4444(Lcom/badlogic/gdx/graphics/Color;)I
    .locals 3

    .line 411
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    const/high16 v1, 0x41700000    # 15.0f

    mul-float v0, v0, v1

    float-to-int v0, v0

    shl-int/lit8 v0, v0, 0xc

    iget v2, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    mul-float v2, v2, v1

    float-to-int v2, v2

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v0, v2

    iget v2, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    mul-float v2, v2, v1

    float-to-int v2, v2

    shl-int/lit8 v2, v2, 0x4

    or-int/2addr v0, v2

    iget p0, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float p0, p0, v1

    float-to-int p0, p0

    or-int/2addr p0, v0

    return p0
.end method

.method public static rgba4444ToColor(Lcom/badlogic/gdx/graphics/Color;I)V
    .locals 2

    const v0, 0xf000

    and-int/2addr v0, p1

    ushr-int/lit8 v0, v0, 0xc

    int-to-float v0, v0

    const/high16 v1, 0x41700000    # 15.0f

    div-float/2addr v0, v1

    .line 443
    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    and-int/lit16 v0, p1, 0xf00

    ushr-int/lit8 v0, v0, 0x8

    int-to-float v0, v0

    div-float/2addr v0, v1

    .line 444
    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    and-int/lit16 v0, p1, 0xf0

    ushr-int/lit8 v0, v0, 0x4

    int-to-float v0, v0

    div-float/2addr v0, v1

    .line 445
    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    and-int/lit8 p1, p1, 0xf

    int-to-float p1, p1

    div-float/2addr p1, v1

    .line 446
    iput p1, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    return-void
.end method

.method public static rgba8888(FFFF)I
    .locals 1

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float p0, p0, v0

    float-to-int p0, p0

    shl-int/lit8 p0, p0, 0x18

    mul-float p1, p1, v0

    float-to-int p1, p1

    shl-int/lit8 p1, p1, 0x10

    or-int/2addr p0, p1

    mul-float p2, p2, v0

    float-to-int p1, p2

    shl-int/lit8 p1, p1, 0x8

    or-int/2addr p0, p1

    mul-float p3, p3, v0

    float-to-int p1, p3

    or-int/2addr p0, p1

    return p0
.end method

.method public static rgba8888(Lcom/badlogic/gdx/graphics/Color;)I
    .locals 3

    .line 419
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    const/high16 v1, 0x437f0000    # 255.0f

    mul-float v0, v0, v1

    float-to-int v0, v0

    shl-int/lit8 v0, v0, 0x18

    iget v2, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    mul-float v2, v2, v1

    float-to-int v2, v2

    shl-int/lit8 v2, v2, 0x10

    or-int/2addr v0, v2

    iget v2, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    mul-float v2, v2, v1

    float-to-int v2, v2

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v0, v2

    iget p0, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float p0, p0, v1

    float-to-int p0, p0

    or-int/2addr p0, v0

    return p0
.end method

.method public static rgba8888ToColor(Lcom/badlogic/gdx/graphics/Color;I)V
    .locals 2

    const/high16 v0, -0x1000000

    and-int/2addr v0, p1

    ushr-int/lit8 v0, v0, 0x18

    int-to-float v0, v0

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr v0, v1

    .line 466
    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    const/high16 v0, 0xff0000

    and-int/2addr v0, p1

    ushr-int/lit8 v0, v0, 0x10

    int-to-float v0, v0

    div-float/2addr v0, v1

    .line 467
    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    const v0, 0xff00

    and-int/2addr v0, p1

    ushr-int/lit8 v0, v0, 0x8

    int-to-float v0, v0

    div-float/2addr v0, v1

    .line 468
    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    and-int/lit16 p1, p1, 0xff

    int-to-float p1, p1

    div-float/2addr p1, v1

    .line 469
    iput p1, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    return-void
.end method

.method public static toFloatBits(FFFF)F
    .locals 1

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float p3, p3, v0

    float-to-int p3, p3

    shl-int/lit8 p3, p3, 0x18

    mul-float p2, p2, v0

    float-to-int p2, p2

    shl-int/lit8 p2, p2, 0x10

    or-int/2addr p2, p3

    mul-float p1, p1, v0

    float-to-int p1, p1

    shl-int/lit8 p1, p1, 0x8

    or-int/2addr p1, p2

    mul-float p0, p0, v0

    float-to-int p0, p0

    or-int/2addr p0, p1

    .line 364
    invoke-static {p0}, Lcom/badlogic/gdx/utils/NumberUtils;->intToFloatColor(I)F

    move-result p0

    return p0
.end method

.method public static toFloatBits(IIII)F
    .locals 0

    shl-int/lit8 p3, p3, 0x18

    shl-int/lit8 p2, p2, 0x10

    or-int/2addr p2, p3

    shl-int/lit8 p1, p1, 0x8

    or-int/2addr p1, p2

    or-int/2addr p0, p1

    .line 355
    invoke-static {p0}, Lcom/badlogic/gdx/utils/NumberUtils;->intToFloatColor(I)F

    move-result p0

    return p0
.end method

.method public static toIntBits(IIII)I
    .locals 0

    shl-int/lit8 p3, p3, 0x18

    shl-int/lit8 p2, p2, 0x10

    or-int/2addr p2, p3

    shl-int/lit8 p1, p1, 0x8

    or-int/2addr p1, p2

    or-int/2addr p0, p1

    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/Color;
    .locals 7

    const/4 v0, 0x0

    .line 337
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x23

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    :cond_0
    const/4 v1, 0x2

    .line 338
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x10

    invoke-static {v0, v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v3, 0x4

    .line 339
    invoke-virtual {p0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v4, 0x6

    .line 340
    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 341
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    const/16 v6, 0x8

    if-eq v5, v6, :cond_1

    const/16 p0, 0xff

    goto :goto_0

    :cond_1
    invoke-virtual {p0, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    .line 342
    :goto_0
    new-instance v2, Lcom/badlogic/gdx/graphics/Color;

    int-to-float v0, v0

    const/high16 v4, 0x437f0000    # 255.0f

    div-float/2addr v0, v4

    int-to-float v1, v1

    div-float/2addr v1, v4

    int-to-float v3, v3

    div-float/2addr v3, v4

    int-to-float p0, p0

    div-float/2addr p0, v4

    invoke-direct {v2, v0, v1, v3, p0}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    return-object v2
.end method


# virtual methods
.method public add(FFFF)Lcom/badlogic/gdx/graphics/Color;
    .locals 1

    .line 218
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    .line 219
    iget p1, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    add-float/2addr p1, p2

    iput p1, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    .line 220
    iget p1, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    add-float/2addr p1, p3

    iput p1, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    .line 221
    iget p1, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    add-float/2addr p1, p4

    iput p1, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    .line 222
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Color;->clamp()Lcom/badlogic/gdx/graphics/Color;

    move-result-object p1

    return-object p1
.end method

.method public add(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;
    .locals 2

    .line 144
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    add-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    .line 145
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    add-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    .line 146
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    add-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    .line 147
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    iget p1, p1, Lcom/badlogic/gdx/graphics/Color;->a:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    .line 148
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Color;->clamp()Lcom/badlogic/gdx/graphics/Color;

    move-result-object p1

    return-object p1
.end method

.method public clamp()Lcom/badlogic/gdx/graphics/Color;
    .locals 4

    .line 166
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    cmpg-float v3, v0, v2

    if-gez v3, :cond_0

    .line 167
    iput v2, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    goto :goto_0

    :cond_0
    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    .line 168
    iput v1, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    .line 170
    :cond_1
    :goto_0
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    cmpg-float v3, v0, v2

    if-gez v3, :cond_2

    .line 171
    iput v2, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    goto :goto_1

    :cond_2
    cmpl-float v0, v0, v1

    if-lez v0, :cond_3

    .line 172
    iput v1, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    .line 174
    :cond_3
    :goto_1
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    cmpg-float v3, v0, v2

    if-gez v3, :cond_4

    .line 175
    iput v2, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    goto :goto_2

    :cond_4
    cmpl-float v0, v0, v1

    if-lez v0, :cond_5

    .line 176
    iput v1, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    .line 178
    :cond_5
    :goto_2
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    cmpg-float v3, v0, v2

    if-gez v3, :cond_6

    .line 179
    iput v2, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    goto :goto_3

    :cond_6
    cmpl-float v0, v0, v1

    if-lez v0, :cond_7

    .line 180
    iput v1, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    :cond_7
    :goto_3
    return-object p0
.end method

.method public cpy()Lcom/badlogic/gdx/graphics/Color;
    .locals 1

    .line 580
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/Color;-><init>(Lcom/badlogic/gdx/graphics/Color;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    .line 297
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 298
    :cond_1
    check-cast p1, Lcom/badlogic/gdx/graphics/Color;

    .line 299
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Color;->toIntBits()I

    move-result v2

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Color;->toIntBits()I

    move-result p1

    if-ne v2, p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_3
    :goto_1
    return v1
.end method

.method public fromHsv(FFF)Lcom/badlogic/gdx/graphics/Color;
    .locals 4

    const/high16 v0, 0x42700000    # 60.0f

    div-float/2addr p1, v0

    const/high16 v0, 0x40c00000    # 6.0f

    add-float/2addr p1, v0

    rem-float/2addr p1, v0

    float-to-int v0, p1

    int-to-float v1, v0

    sub-float/2addr p1, v1

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v2, v1, p2

    mul-float v2, v2, p3

    mul-float v3, p2, p1

    sub-float v3, v1, v3

    mul-float v3, v3, p3

    sub-float p1, v1, p1

    mul-float p2, p2, p1

    sub-float/2addr v1, p2

    mul-float v1, v1, p3

    if-eqz v0, :cond_4

    const/4 p1, 0x1

    if-eq v0, p1, :cond_3

    const/4 p1, 0x2

    if-eq v0, p1, :cond_2

    const/4 p1, 0x3

    if-eq v0, p1, :cond_1

    const/4 p1, 0x4

    if-eq v0, p1, :cond_0

    .line 534
    iput p3, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    .line 535
    iput v2, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    .line 536
    iput v3, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    goto :goto_0

    .line 529
    :cond_0
    iput v1, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    .line 530
    iput v2, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    .line 531
    iput p3, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    goto :goto_0

    .line 524
    :cond_1
    iput v2, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    .line 525
    iput v3, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    .line 526
    iput p3, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    goto :goto_0

    .line 519
    :cond_2
    iput v2, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    .line 520
    iput p3, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    .line 521
    iput v1, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    goto :goto_0

    .line 514
    :cond_3
    iput v3, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    .line 515
    iput p3, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    .line 516
    iput v2, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    goto :goto_0

    .line 509
    :cond_4
    iput p3, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    .line 510
    iput v1, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    .line 511
    iput v2, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    .line 539
    :goto_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Color;->clamp()Lcom/badlogic/gdx/graphics/Color;

    move-result-object p1

    return-object p1
.end method

.method public fromHsv([F)Lcom/badlogic/gdx/graphics/Color;
    .locals 3

    const/4 v0, 0x0

    .line 547
    aget v0, p1, v0

    const/4 v1, 0x1

    aget v1, p1, v1

    const/4 v2, 0x2

    aget p1, p1, v2

    invoke-virtual {p0, v0, v1, p1}, Lcom/badlogic/gdx/graphics/Color;->fromHsv(FFF)Lcom/badlogic/gdx/graphics/Color;

    move-result-object p1

    return-object p1
.end method

.method public hashCode()I
    .locals 5

    .line 304
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    const/4 v1, 0x0

    const/4 v2, 0x0

    cmpl-float v3, v0, v2

    if-eqz v3, :cond_0

    invoke-static {v0}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToIntBits(F)I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    .line 305
    iget v3, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    cmpl-float v4, v3, v2

    if-eqz v4, :cond_1

    invoke-static {v3}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToIntBits(F)I

    move-result v3

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    :goto_1
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x1f

    .line 306
    iget v3, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    cmpl-float v4, v3, v2

    if-eqz v4, :cond_2

    invoke-static {v3}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToIntBits(F)I

    move-result v3

    goto :goto_2

    :cond_2
    const/4 v3, 0x0

    :goto_2
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x1f

    .line 307
    iget v3, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    cmpl-float v2, v3, v2

    if-eqz v2, :cond_3

    invoke-static {v3}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToIntBits(F)I

    move-result v1

    :cond_3
    add-int/2addr v0, v1

    return v0
.end method

.method public lerp(FFFFF)Lcom/badlogic/gdx/graphics/Color;
    .locals 1

    .line 279
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    sub-float/2addr p1, v0

    mul-float p1, p1, p5

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    .line 280
    iget p1, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    sub-float/2addr p2, p1

    mul-float p2, p2, p5

    add-float/2addr p1, p2

    iput p1, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    .line 281
    iget p1, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    sub-float/2addr p3, p1

    mul-float p3, p3, p5

    add-float/2addr p1, p3

    iput p1, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    .line 282
    iget p1, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    sub-float/2addr p4, p1

    mul-float p5, p5, p4

    add-float/2addr p1, p5

    iput p1, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    .line 283
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Color;->clamp()Lcom/badlogic/gdx/graphics/Color;

    move-result-object p1

    return-object p1
.end method

.method public lerp(Lcom/badlogic/gdx/graphics/Color;F)Lcom/badlogic/gdx/graphics/Color;
    .locals 2

    .line 263
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    sub-float/2addr v1, v0

    mul-float v1, v1, p2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    .line 264
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    sub-float/2addr v1, v0

    mul-float v1, v1, p2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    .line 265
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    sub-float/2addr v1, v0

    mul-float v1, v1, p2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    .line 266
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    iget p1, p1, Lcom/badlogic/gdx/graphics/Color;->a:F

    sub-float/2addr p1, v0

    mul-float p2, p2, p1

    add-float/2addr v0, p2

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    .line 267
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Color;->clamp()Lcom/badlogic/gdx/graphics/Color;

    move-result-object p1

    return-object p1
.end method

.method public mul(F)Lcom/badlogic/gdx/graphics/Color;
    .locals 1

    .line 132
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    mul-float v0, v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    .line 133
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    mul-float v0, v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    .line 134
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    mul-float v0, v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    .line 135
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float v0, v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    .line 136
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Color;->clamp()Lcom/badlogic/gdx/graphics/Color;

    move-result-object p1

    return-object p1
.end method

.method public mul(FFFF)Lcom/badlogic/gdx/graphics/Color;
    .locals 1

    .line 250
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    mul-float v0, v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    .line 251
    iget p1, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    mul-float p1, p1, p2

    iput p1, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    .line 252
    iget p1, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    mul-float p1, p1, p3

    iput p1, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    .line 253
    iget p1, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float p1, p1, p4

    iput p1, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    .line 254
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Color;->clamp()Lcom/badlogic/gdx/graphics/Color;

    move-result-object p1

    return-object p1
.end method

.method public mul(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;
    .locals 2

    .line 120
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    mul-float v0, v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    .line 121
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    mul-float v0, v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    .line 122
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    mul-float v0, v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    .line 123
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    iget p1, p1, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float v0, v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    .line 124
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Color;->clamp()Lcom/badlogic/gdx/graphics/Color;

    move-result-object p1

    return-object p1
.end method

.method public premultiplyAlpha()Lcom/badlogic/gdx/graphics/Color;
    .locals 2

    .line 288
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float v0, v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    .line 289
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    mul-float v0, v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    .line 290
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    mul-float v0, v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    return-object p0
.end method

.method public set(FFFF)Lcom/badlogic/gdx/graphics/Color;
    .locals 0

    .line 193
    iput p1, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    .line 194
    iput p2, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    .line 195
    iput p3, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    .line 196
    iput p4, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    .line 197
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Color;->clamp()Lcom/badlogic/gdx/graphics/Color;

    move-result-object p1

    return-object p1
.end method

.method public set(I)Lcom/badlogic/gdx/graphics/Color;
    .locals 0

    .line 205
    invoke-static {p0, p1}, Lcom/badlogic/gdx/graphics/Color;->rgba8888ToColor(Lcom/badlogic/gdx/graphics/Color;I)V

    return-object p0
.end method

.method public set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;
    .locals 1

    .line 108
    iget v0, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    .line 109
    iget v0, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    .line 110
    iget v0, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    .line 111
    iget p1, p1, Lcom/badlogic/gdx/graphics/Color;->a:F

    iput p1, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    return-object p0
.end method

.method public sub(FFFF)Lcom/badlogic/gdx/graphics/Color;
    .locals 1

    .line 234
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    sub-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    .line 235
    iget p1, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    sub-float/2addr p1, p2

    iput p1, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    .line 236
    iget p1, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    sub-float/2addr p1, p3

    iput p1, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    .line 237
    iget p1, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    sub-float/2addr p1, p4

    iput p1, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    .line 238
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Color;->clamp()Lcom/badlogic/gdx/graphics/Color;

    move-result-object p1

    return-object p1
.end method

.method public sub(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;
    .locals 2

    .line 156
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    .line 157
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    .line 158
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    .line 159
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    iget p1, p1, Lcom/badlogic/gdx/graphics/Color;->a:F

    sub-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    .line 160
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Color;->clamp()Lcom/badlogic/gdx/graphics/Color;

    move-result-object p1

    return-object p1
.end method

.method public toFloatBits()F
    .locals 3

    .line 315
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    const/high16 v1, 0x437f0000    # 255.0f

    mul-float v0, v0, v1

    float-to-int v0, v0

    shl-int/lit8 v0, v0, 0x18

    iget v2, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    mul-float v2, v2, v1

    float-to-int v2, v2

    shl-int/lit8 v2, v2, 0x10

    or-int/2addr v0, v2

    iget v2, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    mul-float v2, v2, v1

    float-to-int v2, v2

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v0, v2

    iget v2, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    mul-float v2, v2, v1

    float-to-int v1, v2

    or-int/2addr v0, v1

    .line 316
    invoke-static {v0}, Lcom/badlogic/gdx/utils/NumberUtils;->intToFloatColor(I)F

    move-result v0

    return v0
.end method

.method public toHsv([F)[F
    .locals 9

    .line 554
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iget v1, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 555
    iget v1, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v2, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iget v2, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    sub-float v2, v0, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    cmpl-float v5, v2, v4

    if-nez v5, :cond_0

    .line 558
    aput v4, p1, v3

    goto :goto_0

    .line 559
    :cond_0
    iget v5, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    const/high16 v6, 0x42700000    # 60.0f

    cmpl-float v7, v0, v5

    if-nez v7, :cond_1

    .line 560
    iget v5, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v7, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    sub-float/2addr v5, v7

    mul-float v5, v5, v6

    div-float/2addr v5, v2

    const/high16 v2, 0x43b40000    # 360.0f

    add-float/2addr v5, v2

    rem-float/2addr v5, v2

    aput v5, p1, v3

    goto :goto_0

    .line 561
    :cond_1
    iget v7, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    cmpl-float v8, v0, v7

    if-nez v8, :cond_2

    .line 562
    iget v7, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    sub-float/2addr v7, v5

    mul-float v7, v7, v6

    div-float/2addr v7, v2

    const/high16 v2, 0x42f00000    # 120.0f

    add-float/2addr v7, v2

    aput v7, p1, v3

    goto :goto_0

    :cond_2
    sub-float/2addr v5, v7

    mul-float v5, v5, v6

    div-float/2addr v5, v2

    const/high16 v2, 0x43700000    # 240.0f

    add-float/2addr v5, v2

    .line 564
    aput v5, p1, v3

    :goto_0
    const/4 v2, 0x1

    cmpl-float v3, v0, v4

    if-lez v3, :cond_3

    const/high16 v3, 0x3f800000    # 1.0f

    div-float/2addr v1, v0

    sub-float/2addr v3, v1

    .line 568
    aput v3, p1, v2

    goto :goto_1

    .line 570
    :cond_3
    aput v4, p1, v2

    :goto_1
    const/4 v1, 0x2

    .line 573
    aput v0, p1, v1

    return-object p1
.end method

.method public toIntBits()I
    .locals 3

    .line 322
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    const/high16 v1, 0x437f0000    # 255.0f

    mul-float v0, v0, v1

    float-to-int v0, v0

    shl-int/lit8 v0, v0, 0x18

    iget v2, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    mul-float v2, v2, v1

    float-to-int v2, v2

    shl-int/lit8 v2, v2, 0x10

    or-int/2addr v0, v2

    iget v2, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    mul-float v2, v2, v1

    float-to-int v2, v2

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v0, v2

    iget v2, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    mul-float v2, v2, v1

    float-to-int v1, v2

    or-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 327
    iget v0, p0, Lcom/badlogic/gdx/graphics/Color;->r:F

    const/high16 v1, 0x437f0000    # 255.0f

    mul-float v0, v0, v1

    float-to-int v0, v0

    shl-int/lit8 v0, v0, 0x18

    iget v2, p0, Lcom/badlogic/gdx/graphics/Color;->g:F

    mul-float v2, v2, v1

    float-to-int v2, v2

    shl-int/lit8 v2, v2, 0x10

    or-int/2addr v0, v2

    iget v2, p0, Lcom/badlogic/gdx/graphics/Color;->b:F

    mul-float v2, v2, v1

    float-to-int v2, v2

    const/16 v3, 0x8

    shl-int/2addr v2, v3

    or-int/2addr v0, v2

    iget v2, p0, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float v2, v2, v1

    float-to-int v1, v2

    or-int/2addr v0, v1

    .line 328
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    .line 329
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v1, v3, :cond_0

    .line 330
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    return-object v0
.end method
