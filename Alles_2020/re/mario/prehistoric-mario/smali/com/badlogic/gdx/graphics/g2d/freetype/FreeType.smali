.class public Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;
.super Ljava/lang/Object;
.source "FreeType.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;,
        Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphMetrics;,
        Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;,
        Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;,
        Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;,
        Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;,
        Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Size;,
        Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;,
        Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;,
        Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Pointer;
    }
.end annotation


# static fields
.field public static FT_ENCODING_ADOBE_CUSTOM:I = 0x0

.field public static FT_ENCODING_ADOBE_EXPERT:I = 0x0

.field public static FT_ENCODING_ADOBE_LATIN_1:I = 0x0

.field public static FT_ENCODING_ADOBE_STANDARD:I = 0x0

.field public static FT_ENCODING_APPLE_ROMAN:I = 0x0

.field public static FT_ENCODING_BIG5:I = 0x0

.field public static FT_ENCODING_GB2312:I = 0x0

.field public static FT_ENCODING_JOHAB:I = 0x0

.field public static FT_ENCODING_MS_SYMBOL:I = 0x0

.field public static FT_ENCODING_NONE:I = 0x0

.field public static FT_ENCODING_OLD_LATIN_2:I = 0x0

.field public static FT_ENCODING_SJIS:I = 0x0

.field public static FT_ENCODING_UNICODE:I = 0x0

.field public static FT_ENCODING_WANSUNG:I = 0x0

.field public static FT_FACE_FLAG_CID_KEYED:I = 0x0

.field public static FT_FACE_FLAG_EXTERNAL_STREAM:I = 0x0

.field public static FT_FACE_FLAG_FAST_GLYPHS:I = 0x0

.field public static FT_FACE_FLAG_FIXED_SIZES:I = 0x0

.field public static FT_FACE_FLAG_FIXED_WIDTH:I = 0x0

.field public static FT_FACE_FLAG_GLYPH_NAMES:I = 0x0

.field public static FT_FACE_FLAG_HINTER:I = 0x0

.field public static FT_FACE_FLAG_HORIZONTAL:I = 0x0

.field public static FT_FACE_FLAG_KERNING:I = 0x0

.field public static FT_FACE_FLAG_MULTIPLE_MASTERS:I = 0x0

.field public static FT_FACE_FLAG_SCALABLE:I = 0x0

.field public static FT_FACE_FLAG_SFNT:I = 0x0

.field public static FT_FACE_FLAG_TRICKY:I = 0x0

.field public static FT_FACE_FLAG_VERTICAL:I = 0x0

.field public static FT_KERNING_DEFAULT:I = 0x0

.field public static FT_KERNING_UNFITTED:I = 0x0

.field public static FT_KERNING_UNSCALED:I = 0x0

.field public static FT_LOAD_CROP_BITMAP:I = 0x0

.field public static FT_LOAD_DEFAULT:I = 0x0

.field public static FT_LOAD_FORCE_AUTOHINT:I = 0x0

.field public static FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH:I = 0x0

.field public static FT_LOAD_IGNORE_TRANSFORM:I = 0x0

.field public static FT_LOAD_LINEAR_DESIGN:I = 0x0

.field public static FT_LOAD_MONOCHROME:I = 0x0

.field public static FT_LOAD_NO_AUTOHINT:I = 0x0

.field public static FT_LOAD_NO_BITMAP:I = 0x0

.field public static FT_LOAD_NO_HINTING:I = 0x0

.field public static FT_LOAD_NO_RECURSE:I = 0x0

.field public static FT_LOAD_NO_SCALE:I = 0x0

.field public static FT_LOAD_PEDANTIC:I = 0x0

.field public static FT_LOAD_RENDER:I = 0x0

.field public static FT_LOAD_VERTICAL_LAYOUT:I = 0x0

.field public static FT_PIXEL_MODE_GRAY:I = 0x2

.field public static FT_PIXEL_MODE_GRAY2:I = 0x3

.field public static FT_PIXEL_MODE_GRAY4:I = 0x4

.field public static FT_PIXEL_MODE_LCD:I = 0x5

.field public static FT_PIXEL_MODE_LCD_V:I = 0x6

.field public static FT_PIXEL_MODE_MONO:I = 0x1

.field public static FT_PIXEL_MODE_NONE:I

.field public static FT_RENDER_MODE_LCD:I

.field public static FT_RENDER_MODE_LCD_V:I

.field public static FT_RENDER_MODE_LIGHT:I

.field public static FT_RENDER_MODE_MAX:I

.field public static FT_RENDER_MODE_MONO:I

.field public static FT_RENDER_MODE_NORMAL:I

.field public static FT_STROKER_LINECAP_BUTT:I

.field public static FT_STROKER_LINECAP_ROUND:I

.field public static FT_STROKER_LINECAP_SQUARE:I

.field public static FT_STROKER_LINEJOIN_BEVEL:I

.field public static FT_STROKER_LINEJOIN_MITER:I

.field public static FT_STROKER_LINEJOIN_MITER_FIXED:I

.field public static FT_STROKER_LINEJOIN_MITER_VARIABLE:I

.field public static FT_STROKER_LINEJOIN_ROUND:I

.field public static FT_STYLE_FLAG_BOLD:I

.field public static FT_STYLE_FLAG_ITALIC:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    const/16 v0, 0x6d

    const/16 v1, 0x62

    const/16 v2, 0x73

    const/16 v3, 0x79

    .line 771
    invoke-static {v2, v3, v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->encode(CCCC)I

    move-result v3

    sput v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_ENCODING_MS_SYMBOL:I

    const/16 v3, 0x69

    const/16 v4, 0x6e

    const/16 v5, 0x75

    const/16 v6, 0x63

    .line 772
    invoke-static {v5, v4, v3, v6}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->encode(CCCC)I

    move-result v5

    sput v5, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_ENCODING_UNICODE:I

    const/16 v5, 0x6a

    .line 773
    invoke-static {v2, v5, v3, v2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->encode(CCCC)I

    move-result v6

    sput v6, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_ENCODING_SJIS:I

    const/16 v6, 0x20

    const/16 v7, 0x67

    .line 774
    invoke-static {v7, v1, v6, v6}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->encode(CCCC)I

    move-result v7

    sput v7, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_ENCODING_GB2312:I

    const/16 v7, 0x67

    const/16 v8, 0x35

    .line 775
    invoke-static {v1, v3, v7, v8}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->encode(CCCC)I

    move-result v1

    sput v1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_ENCODING_BIG5:I

    const/16 v1, 0x61

    const/16 v3, 0x77

    .line 776
    invoke-static {v3, v1, v4, v2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->encode(CCCC)I

    move-result v2

    sput v2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_ENCODING_WANSUNG:I

    const/16 v2, 0x6f

    const/16 v3, 0x68

    .line 777
    invoke-static {v5, v2, v3, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->encode(CCCC)I

    move-result v2

    sput v2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_ENCODING_JOHAB:I

    const/16 v2, 0x42

    const/16 v3, 0x44

    const/16 v5, 0x41

    const/16 v7, 0x4f

    .line 778
    invoke-static {v5, v3, v7, v2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->encode(CCCC)I

    move-result v7

    sput v7, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_ENCODING_ADOBE_STANDARD:I

    const/16 v7, 0x45

    .line 779
    invoke-static {v5, v3, v2, v7}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->encode(CCCC)I

    move-result v7

    sput v7, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_ENCODING_ADOBE_EXPERT:I

    const/16 v7, 0x43

    .line 780
    invoke-static {v5, v3, v2, v7}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->encode(CCCC)I

    move-result v2

    sput v2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_ENCODING_ADOBE_CUSTOM:I

    const/16 v2, 0x6c

    const/16 v3, 0x74

    const/16 v5, 0x31

    .line 781
    invoke-static {v2, v1, v3, v5}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->encode(CCCC)I

    move-result v2

    sput v2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_ENCODING_ADOBE_LATIN_1:I

    const/16 v2, 0x6c

    const/16 v5, 0x32

    .line 782
    invoke-static {v2, v1, v3, v5}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->encode(CCCC)I

    move-result v2

    sput v2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_ENCODING_OLD_LATIN_2:I

    const/16 v2, 0x72

    .line 783
    invoke-static {v1, v2, v0, v4}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->encode(CCCC)I

    move-result v0

    sput v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_ENCODING_APPLE_ROMAN:I

    const/4 v0, 0x1

    .line 785
    sput v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_FACE_FLAG_SCALABLE:I

    const/4 v1, 0x2

    .line 786
    sput v1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_FACE_FLAG_FIXED_SIZES:I

    const/4 v2, 0x4

    .line 787
    sput v2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_FACE_FLAG_FIXED_WIDTH:I

    const/16 v3, 0x8

    .line 788
    sput v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_FACE_FLAG_SFNT:I

    const/16 v3, 0x10

    .line 789
    sput v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_FACE_FLAG_HORIZONTAL:I

    .line 790
    sput v6, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_FACE_FLAG_VERTICAL:I

    const/16 v3, 0x40

    .line 791
    sput v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_FACE_FLAG_KERNING:I

    const/16 v3, 0x80

    .line 792
    sput v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_FACE_FLAG_FAST_GLYPHS:I

    const/16 v3, 0x100

    .line 793
    sput v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_FACE_FLAG_MULTIPLE_MASTERS:I

    const/16 v3, 0x200

    .line 794
    sput v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_FACE_FLAG_GLYPH_NAMES:I

    const/16 v3, 0x400

    .line 795
    sput v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_FACE_FLAG_EXTERNAL_STREAM:I

    const/16 v3, 0x800

    .line 796
    sput v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_FACE_FLAG_HINTER:I

    const/16 v3, 0x1000

    .line 797
    sput v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_FACE_FLAG_CID_KEYED:I

    const/16 v3, 0x2000

    .line 798
    sput v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_FACE_FLAG_TRICKY:I

    .line 800
    sput v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_STYLE_FLAG_ITALIC:I

    .line 801
    sput v1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_STYLE_FLAG_BOLD:I

    const/4 v3, 0x0

    .line 803
    sput v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_DEFAULT:I

    .line 804
    sput v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_NO_SCALE:I

    .line 805
    sput v1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_NO_HINTING:I

    .line 806
    sput v2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_RENDER:I

    const/16 v4, 0x8

    .line 807
    sput v4, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_NO_BITMAP:I

    const/16 v4, 0x10

    .line 808
    sput v4, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_VERTICAL_LAYOUT:I

    .line 809
    sput v6, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_FORCE_AUTOHINT:I

    const/16 v4, 0x40

    .line 810
    sput v4, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_CROP_BITMAP:I

    const/16 v4, 0x80

    .line 811
    sput v4, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_PEDANTIC:I

    const/16 v4, 0x200

    .line 812
    sput v4, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH:I

    const/16 v4, 0x400

    .line 813
    sput v4, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_NO_RECURSE:I

    const/16 v4, 0x800

    .line 814
    sput v4, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_IGNORE_TRANSFORM:I

    const/16 v4, 0x1000

    .line 815
    sput v4, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_MONOCHROME:I

    const/16 v4, 0x2000

    .line 816
    sput v4, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_LINEAR_DESIGN:I

    const v4, 0x8000

    .line 817
    sput v4, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_NO_AUTOHINT:I

    .line 819
    sput v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_RENDER_MODE_NORMAL:I

    .line 820
    sput v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_RENDER_MODE_LIGHT:I

    .line 821
    sput v1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_RENDER_MODE_MONO:I

    const/4 v4, 0x3

    .line 822
    sput v4, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_RENDER_MODE_LCD:I

    .line 823
    sput v2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_RENDER_MODE_LCD_V:I

    const/4 v2, 0x5

    .line 824
    sput v2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_RENDER_MODE_MAX:I

    .line 826
    sput v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_KERNING_DEFAULT:I

    .line 827
    sput v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_KERNING_UNFITTED:I

    .line 828
    sput v1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_KERNING_UNSCALED:I

    .line 830
    sput v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_STROKER_LINECAP_BUTT:I

    .line 831
    sput v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_STROKER_LINECAP_ROUND:I

    .line 832
    sput v1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_STROKER_LINECAP_SQUARE:I

    .line 834
    sput v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_STROKER_LINEJOIN_ROUND:I

    .line 835
    sput v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_STROKER_LINEJOIN_BEVEL:I

    .line 836
    sput v1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_STROKER_LINEJOIN_MITER_VARIABLE:I

    .line 837
    sget v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_STROKER_LINEJOIN_MITER_VARIABLE:I

    sput v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_STROKER_LINEJOIN_MITER:I

    const/4 v0, 0x3

    .line 838
    sput v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_STROKER_LINEJOIN_MITER_FIXED:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static encode(CCCC)I
    .locals 0

    shl-int/lit8 p0, p0, 0x18

    shl-int/lit8 p1, p1, 0x10

    or-int/2addr p0, p1

    shl-int/lit8 p1, p2, 0x8

    or-int/2addr p0, p1

    or-int/2addr p0, p3

    return p0
.end method

.method public static initFreeType()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;
    .locals 5

    .line 841
    new-instance v0, Lcom/badlogic/gdx/utils/SharedLibraryLoader;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/SharedLibraryLoader;-><init>()V

    const-string v1, "gdx-freetype"

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/SharedLibraryLoader;->load(Ljava/lang/String;)V

    .line 842
    invoke-static {}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->initFreeTypeJni()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    .line 844
    new-instance v2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;

    invoke-direct {v2, v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;-><init>(J)V

    return-object v2

    .line 843
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Couldn\'t initialize FreeType library"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static native initFreeTypeJni()J
.end method

.method public static toInt(I)I
    .locals 0

    if-gez p0, :cond_0

    add-int/lit8 p0, p0, -0x20

    :goto_0
    shr-int/lit8 p0, p0, 0x6

    return p0

    :cond_0
    add-int/lit8 p0, p0, 0x20

    goto :goto_0
.end method
