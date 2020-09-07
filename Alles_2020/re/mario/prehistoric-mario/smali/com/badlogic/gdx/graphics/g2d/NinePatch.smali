.class public Lcom/badlogic/gdx/graphics/g2d/NinePatch;
.super Ljava/lang/Object;
.source "NinePatch.java"


# static fields
.field public static final BOTTOM_CENTER:I = 0x7

.field public static final BOTTOM_LEFT:I = 0x6

.field public static final BOTTOM_RIGHT:I = 0x8

.field public static final MIDDLE_CENTER:I = 0x4

.field public static final MIDDLE_LEFT:I = 0x3

.field public static final MIDDLE_RIGHT:I = 0x5

.field public static final TOP_CENTER:I = 0x1

.field public static final TOP_LEFT:I = 0x0

.field public static final TOP_RIGHT:I = 0x2

.field private static final tmpDrawColor:Lcom/badlogic/gdx/graphics/Color;


# instance fields
.field private bottomCenter:I

.field private bottomHeight:F

.field private bottomLeft:I

.field private bottomRight:I

.field private final color:Lcom/badlogic/gdx/graphics/Color;

.field private idx:I

.field private leftWidth:F

.field private middleCenter:I

.field private middleHeight:F

.field private middleLeft:I

.field private middleRight:I

.field private middleWidth:F

.field private padBottom:F

.field private padLeft:F

.field private padRight:F

.field private padTop:F

.field private rightWidth:F

.field private texture:Lcom/badlogic/gdx/graphics/Texture;

.field private topCenter:I

.field private topHeight:F

.field private topLeft:I

.field private topRight:I

.field private vertices:[F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 48
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/Color;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->tmpDrawColor:Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/Texture;)V
    .locals 1

    .line 128
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/Texture;)V

    invoke-direct {p0, v0}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/Texture;IIII)V
    .locals 6

    .line 67
    new-instance v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-direct {v1, p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/Texture;)V

    move-object v0, p0

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;IIII)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/Texture;Lcom/badlogic/gdx/graphics/Color;)V
    .locals 0

    .line 122
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;-><init>(Lcom/badlogic/gdx/graphics/Texture;)V

    .line 123
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/NinePatch;)V
    .locals 1

    .line 185
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;-><init>(Lcom/badlogic/gdx/graphics/g2d/NinePatch;Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/NinePatch;Lcom/badlogic/gdx/graphics/Color;)V
    .locals 4

    .line 188
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 51
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomLeft:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomCenter:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomRight:I

    .line 52
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleLeft:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleCenter:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleRight:I

    .line 53
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topLeft:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topCenter:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topRight:I

    const/16 v0, 0xb4

    .line 55
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->vertices:[F

    .line 57
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    sget-object v1, Lcom/badlogic/gdx/graphics/Color;->WHITE:Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(Lcom/badlogic/gdx/graphics/Color;)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->color:Lcom/badlogic/gdx/graphics/Color;

    const/high16 v0, -0x40800000    # -1.0f

    .line 58
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padLeft:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padRight:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padTop:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padBottom:F

    .line 189
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->texture:Lcom/badlogic/gdx/graphics/Texture;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->texture:Lcom/badlogic/gdx/graphics/Texture;

    .line 191
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomLeft:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomLeft:I

    .line 192
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomCenter:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomCenter:I

    .line 193
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomRight:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomRight:I

    .line 194
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleLeft:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleLeft:I

    .line 195
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleCenter:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleCenter:I

    .line 196
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleRight:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleRight:I

    .line 197
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topLeft:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topLeft:I

    .line 198
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topCenter:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topCenter:I

    .line 199
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topRight:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topRight:I

    .line 201
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->leftWidth:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->leftWidth:F

    .line 202
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->rightWidth:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->rightWidth:F

    .line 203
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleWidth:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleWidth:F

    .line 204
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleHeight:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleHeight:F

    .line 205
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topHeight:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topHeight:F

    .line 206
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomHeight:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomHeight:F

    .line 208
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padLeft:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padLeft:F

    .line 209
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padTop:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padTop:F

    .line 210
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padBottom:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padBottom:F

    .line 211
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padRight:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padRight:F

    .line 213
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->vertices:[F

    array-length v0, v0

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->vertices:[F

    .line 214
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->vertices:[F

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->vertices:[F

    array-length v2, v0

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 215
    iget p1, p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->idx:I

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->idx:I

    .line 216
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V
    .locals 3

    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 51
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomLeft:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomCenter:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomRight:I

    .line 52
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleLeft:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleCenter:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleRight:I

    .line 53
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topLeft:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topCenter:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topRight:I

    const/16 v0, 0xb4

    .line 55
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->vertices:[F

    .line 57
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    sget-object v1, Lcom/badlogic/gdx/graphics/Color;->WHITE:Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(Lcom/badlogic/gdx/graphics/Color;)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->color:Lcom/badlogic/gdx/graphics/Color;

    const/high16 v0, -0x40800000    # -1.0f

    .line 58
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padLeft:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padRight:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padTop:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padBottom:F

    const/16 v0, 0x9

    .line 139
    new-array v0, v0, [Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    const/4 v1, 0x0

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const/4 v2, 0x3

    aput-object v1, v0, v2

    const/4 v2, 0x4

    aput-object p1, v0, v2

    const/4 p1, 0x5

    aput-object v1, v0, p1

    const/4 p1, 0x6

    aput-object v1, v0, p1

    const/4 p1, 0x7

    aput-object v1, v0, p1

    const/16 p1, 0x8

    aput-object v1, v0, p1

    invoke-direct {p0, v0}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->load([Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;IIII)V
    .locals 19

    move-object/from16 v0, p0

    .line 76
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    const/4 v1, -0x1

    .line 51
    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomLeft:I

    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomCenter:I

    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomRight:I

    .line 52
    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleLeft:I

    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleCenter:I

    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleRight:I

    .line 53
    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topLeft:I

    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topCenter:I

    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topRight:I

    const/16 v1, 0xb4

    .line 55
    new-array v1, v1, [F

    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->vertices:[F

    .line 57
    new-instance v1, Lcom/badlogic/gdx/graphics/Color;

    sget-object v2, Lcom/badlogic/gdx/graphics/Color;->WHITE:Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v1, v2}, Lcom/badlogic/gdx/graphics/Color;-><init>(Lcom/badlogic/gdx/graphics/Color;)V

    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->color:Lcom/badlogic/gdx/graphics/Color;

    const/high16 v1, -0x40800000    # -1.0f

    .line 58
    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padLeft:F

    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padRight:F

    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padTop:F

    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padBottom:F

    if-eqz p1, :cond_b

    .line 78
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v1

    sub-int v1, v1, p2

    sub-int v7, v1, p3

    .line 79
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v1

    sub-int v1, v1, p4

    sub-int v8, v1, p5

    const/16 v1, 0x9

    .line 81
    new-array v9, v1, [Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    const/4 v10, 0x1

    const/4 v11, 0x2

    if-lez p4, :cond_2

    if-lez p2, :cond_0

    const/4 v12, 0x0

    .line 83
    new-instance v13, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v1, v13

    move-object/from16 v2, p1

    move/from16 v5, p2

    move/from16 v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;IIII)V

    aput-object v13, v9, v12

    :cond_0
    if-lez v7, :cond_1

    .line 84
    new-instance v12, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    const/4 v4, 0x0

    move-object v1, v12

    move-object/from16 v2, p1

    move/from16 v3, p2

    move v5, v7

    move/from16 v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;IIII)V

    aput-object v12, v9, v10

    :cond_1
    if-lez p3, :cond_2

    .line 85
    new-instance v12, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    add-int v3, p2, v7

    const/4 v4, 0x0

    move-object v1, v12

    move-object/from16 v2, p1

    move/from16 v5, p3

    move/from16 v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;IIII)V

    aput-object v12, v9, v11

    :cond_2
    const/4 v12, 0x3

    const/4 v13, 0x4

    const/4 v14, 0x5

    if-lez v8, :cond_5

    if-lez p2, :cond_3

    .line 88
    new-instance v15, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    const/4 v3, 0x0

    move-object v1, v15

    move-object/from16 v2, p1

    move/from16 v4, p4

    move/from16 v5, p2

    move v6, v8

    invoke-direct/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;IIII)V

    aput-object v15, v9, v12

    :cond_3
    if-lez v7, :cond_4

    .line 89
    new-instance v15, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-object v1, v15

    move-object/from16 v2, p1

    move/from16 v3, p2

    move/from16 v4, p4

    move v5, v7

    move v6, v8

    invoke-direct/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;IIII)V

    aput-object v15, v9, v13

    :cond_4
    if-lez p3, :cond_5

    .line 90
    new-instance v15, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    add-int v3, p2, v7

    move-object v1, v15

    move-object/from16 v2, p1

    move/from16 v4, p4

    move/from16 v5, p3

    move v6, v8

    invoke-direct/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;IIII)V

    aput-object v15, v9, v14

    :cond_5
    const/4 v15, 0x6

    const/16 v16, 0x7

    const/16 v17, 0x8

    if-lez p5, :cond_8

    if-lez p2, :cond_6

    .line 93
    new-instance v18, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    const/4 v3, 0x0

    add-int v4, p4, v8

    move-object/from16 v1, v18

    move-object/from16 v2, p1

    move/from16 v5, p2

    move/from16 v6, p5

    invoke-direct/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;IIII)V

    aput-object v18, v9, v15

    :cond_6
    if-lez v7, :cond_7

    .line 94
    new-instance v18, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    add-int v4, p4, v8

    move-object/from16 v1, v18

    move-object/from16 v2, p1

    move/from16 v3, p2

    move v5, v7

    move/from16 v6, p5

    invoke-direct/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;IIII)V

    aput-object v18, v9, v16

    :cond_7
    if-lez p3, :cond_8

    .line 95
    new-instance v18, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    add-int v3, p2, v7

    add-int v4, p4, v8

    move-object/from16 v1, v18

    move-object/from16 v2, p1

    move/from16 v5, p3

    move/from16 v6, p5

    invoke-direct/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;IIII)V

    aput-object v18, v9, v17

    :cond_8
    const/4 v1, 0x0

    if-nez p2, :cond_9

    if-nez v7, :cond_9

    .line 100
    aget-object v2, v9, v11

    aput-object v2, v9, v10

    .line 101
    aget-object v2, v9, v14

    aput-object v2, v9, v13

    .line 102
    aget-object v2, v9, v17

    aput-object v2, v9, v16

    aput-object v1, v9, v11

    aput-object v1, v9, v14

    aput-object v1, v9, v17

    :cond_9
    if-nez p4, :cond_a

    if-nez v8, :cond_a

    .line 109
    aget-object v2, v9, v15

    aput-object v2, v9, v12

    .line 110
    aget-object v2, v9, v16

    aput-object v2, v9, v13

    .line 111
    aget-object v2, v9, v17

    aput-object v2, v9, v14

    aput-object v1, v9, v15

    aput-object v1, v9, v16

    aput-object v1, v9, v17

    .line 117
    :cond_a
    invoke-direct {v0, v9}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->load([Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    return-void

    .line 77
    :cond_b
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "region cannot be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;Lcom/badlogic/gdx/graphics/Color;)V
    .locals 0

    .line 133
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    .line 134
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public varargs constructor <init>([Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V
    .locals 6

    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 51
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomLeft:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomCenter:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomRight:I

    .line 52
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleLeft:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleCenter:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleRight:I

    .line 53
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topLeft:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topCenter:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topRight:I

    const/16 v0, 0xb4

    .line 55
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->vertices:[F

    .line 57
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    sget-object v1, Lcom/badlogic/gdx/graphics/Color;->WHITE:Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(Lcom/badlogic/gdx/graphics/Color;)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->color:Lcom/badlogic/gdx/graphics/Color;

    const/high16 v0, -0x40800000    # -1.0f

    .line 58
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padLeft:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padRight:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padTop:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padBottom:F

    if-eqz p1, :cond_10

    .line 151
    array-length v0, p1

    const/16 v1, 0x9

    if-ne v0, v1, :cond_10

    .line 153
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->load([Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    .line 155
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->getLeftWidth()F

    move-result v0

    const/4 v1, 0x0

    .line 156
    aget-object v2, p1, v1

    if-eqz v2, :cond_0

    aget-object v2, p1, v1

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v2

    int-to-float v2, v2

    cmpl-float v2, v2, v0

    if-nez v2, :cond_2

    :cond_0
    const/4 v2, 0x3

    aget-object v3, p1, v2

    if-eqz v3, :cond_1

    aget-object v2, p1, v2

    .line 157
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v2

    int-to-float v2, v2

    cmpl-float v2, v2, v0

    if-nez v2, :cond_2

    :cond_1
    const/4 v2, 0x6

    aget-object v3, p1, v2

    if-eqz v3, :cond_3

    aget-object v3, p1, v2

    .line 158
    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v3

    int-to-float v3, v3

    cmpl-float v0, v3, v0

    if-nez v0, :cond_2

    goto :goto_0

    .line 159
    :cond_2
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Left side patches must have the same width"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 162
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->getRightWidth()F

    move-result v0

    const/4 v3, 0x2

    .line 163
    aget-object v4, p1, v3

    if-eqz v4, :cond_4

    aget-object v4, p1, v3

    invoke-virtual {v4}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v4

    int-to-float v4, v4

    cmpl-float v4, v4, v0

    if-nez v4, :cond_6

    :cond_4
    const/4 v4, 0x5

    aget-object v5, p1, v4

    if-eqz v5, :cond_5

    aget-object v4, p1, v4

    .line 164
    invoke-virtual {v4}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v4

    int-to-float v4, v4

    cmpl-float v4, v4, v0

    if-nez v4, :cond_6

    :cond_5
    const/16 v4, 0x8

    aget-object v5, p1, v4

    if-eqz v5, :cond_7

    aget-object v5, p1, v4

    .line 165
    invoke-virtual {v5}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v5

    int-to-float v5, v5

    cmpl-float v0, v5, v0

    if-nez v0, :cond_6

    goto :goto_1

    .line 166
    :cond_6
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Right side patches must have the same width"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 169
    :cond_7
    :goto_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->getBottomHeight()F

    move-result v0

    .line 170
    aget-object v5, p1, v2

    if-eqz v5, :cond_8

    aget-object v2, p1, v2

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v2

    int-to-float v2, v2

    cmpl-float v2, v2, v0

    if-nez v2, :cond_a

    :cond_8
    const/4 v2, 0x7

    aget-object v5, p1, v2

    if-eqz v5, :cond_9

    aget-object v2, p1, v2

    .line 171
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v2

    int-to-float v2, v2

    cmpl-float v2, v2, v0

    if-nez v2, :cond_a

    :cond_9
    aget-object v2, p1, v4

    if-eqz v2, :cond_b

    aget-object v2, p1, v4

    .line 172
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v2

    int-to-float v2, v2

    cmpl-float v0, v2, v0

    if-nez v0, :cond_a

    goto :goto_2

    .line 173
    :cond_a
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Bottom side patches must have the same height"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 176
    :cond_b
    :goto_2
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->getTopHeight()F

    move-result v0

    .line 177
    aget-object v2, p1, v1

    if-eqz v2, :cond_c

    aget-object v1, p1, v1

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v1

    int-to-float v1, v1

    cmpl-float v1, v1, v0

    if-nez v1, :cond_e

    :cond_c
    const/4 v1, 0x1

    aget-object v2, p1, v1

    if-eqz v2, :cond_d

    aget-object v1, p1, v1

    .line 178
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v1

    int-to-float v1, v1

    cmpl-float v1, v1, v0

    if-nez v1, :cond_e

    :cond_d
    aget-object v1, p1, v3

    if-eqz v1, :cond_f

    aget-object p1, p1, v3

    .line 179
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result p1

    int-to-float p1, p1

    cmpl-float p1, p1, v0

    if-nez p1, :cond_e

    goto :goto_3

    .line 180
    :cond_e
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Top side patches must have the same height"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_f
    :goto_3
    return-void

    .line 151
    :cond_10
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "NinePatch needs nine TextureRegions"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private add(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FZZ)I
    .locals 5

    .line 275
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->texture:Lcom/badlogic/gdx/graphics/Texture;

    if-nez v0, :cond_0

    .line 276
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getTexture()Lcom/badlogic/gdx/graphics/Texture;

    move-result-object v0

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->texture:Lcom/badlogic/gdx/graphics/Texture;

    goto :goto_0

    .line 277
    :cond_0
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getTexture()Lcom/badlogic/gdx/graphics/Texture;

    move-result-object v1

    if-ne v0, v1, :cond_4

    .line 280
    :goto_0
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    .line 281
    iget v1, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    .line 282
    iget v2, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    .line 283
    iget p1, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    .line 288
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/Texture;->getMagFilter()Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    move-result-object v3

    sget-object v4, Lcom/badlogic/gdx/graphics/Texture$TextureFilter;->Linear:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    if-eq v3, v4, :cond_1

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/Texture;->getMinFilter()Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    move-result-object v3

    sget-object v4, Lcom/badlogic/gdx/graphics/Texture$TextureFilter;->Linear:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    if-ne v3, v4, :cond_3

    :cond_1
    const/high16 v3, 0x3f000000    # 0.5f

    if-eqz p3, :cond_2

    .line 290
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {p3}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result p3

    int-to-float p3, p3

    div-float p3, v3, p3

    add-float/2addr v0, p3

    sub-float/2addr v2, p3

    :cond_2
    if-eqz p4, :cond_3

    .line 295
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {p3}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result p3

    int-to-float p3, p3

    div-float/2addr v3, p3

    sub-float/2addr v1, v3

    add-float/2addr p1, v3

    .line 301
    :cond_3
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->vertices:[F

    .line 303
    iget p4, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->idx:I

    add-int/lit8 v3, p4, 0x2

    aput p2, p3, v3

    add-int/lit8 v3, p4, 0x3

    .line 304
    aput v0, p3, v3

    add-int/lit8 v3, p4, 0x4

    .line 305
    aput v1, p3, v3

    add-int/lit8 v3, p4, 0x7

    .line 307
    aput p2, p3, v3

    add-int/lit8 v3, p4, 0x8

    .line 308
    aput v0, p3, v3

    add-int/lit8 v0, p4, 0x9

    .line 309
    aput p1, p3, v0

    add-int/lit8 v0, p4, 0xc

    .line 311
    aput p2, p3, v0

    add-int/lit8 v0, p4, 0xd

    .line 312
    aput v2, p3, v0

    add-int/lit8 v0, p4, 0xe

    .line 313
    aput p1, p3, v0

    add-int/lit8 p1, p4, 0x11

    .line 315
    aput p2, p3, p1

    add-int/lit8 p1, p4, 0x12

    .line 316
    aput v2, p3, p1

    add-int/lit8 p1, p4, 0x13

    .line 317
    aput v1, p3, p1

    add-int/lit8 p4, p4, 0x14

    .line 318
    iput p4, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->idx:I

    .line 320
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->idx:I

    add-int/lit8 p1, p1, -0x14

    return p1

    .line 278
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "All regions must be from the same texture."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private load([Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V
    .locals 6

    .line 220
    sget v0, Lcom/badlogic/gdx/graphics/Color;->WHITE_FLOAT_BITS:F

    const/4 v1, 0x6

    .line 222
    aget-object v2, p1, v1

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    .line 223
    aget-object v2, p1, v1

    invoke-direct {p0, v2, v0, v3, v3}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->add(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FZZ)I

    move-result v2

    iput v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomLeft:I

    .line 224
    aget-object v2, p1, v1

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v2

    int-to-float v2, v2

    iput v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->leftWidth:F

    .line 225
    aget-object v1, p1, v1

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomHeight:F

    :cond_0
    const/4 v1, 0x7

    .line 227
    aget-object v2, p1, v1

    const/4 v4, 0x1

    if-eqz v2, :cond_1

    .line 228
    aget-object v2, p1, v1

    invoke-direct {p0, v2, v0, v4, v3}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->add(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FZZ)I

    move-result v2

    iput v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomCenter:I

    .line 229
    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleWidth:F

    aget-object v5, p1, v1

    invoke-virtual {v5}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v5

    int-to-float v5, v5

    invoke-static {v2, v5}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleWidth:F

    .line 230
    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomHeight:F

    aget-object v1, p1, v1

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomHeight:F

    :cond_1
    const/16 v1, 0x8

    .line 232
    aget-object v2, p1, v1

    if-eqz v2, :cond_2

    .line 233
    aget-object v2, p1, v1

    invoke-direct {p0, v2, v0, v3, v3}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->add(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FZZ)I

    move-result v2

    iput v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomRight:I

    .line 234
    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->rightWidth:F

    aget-object v5, p1, v1

    invoke-virtual {v5}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v5

    int-to-float v5, v5

    invoke-static {v2, v5}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->rightWidth:F

    .line 235
    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomHeight:F

    aget-object v1, p1, v1

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomHeight:F

    :cond_2
    const/4 v1, 0x3

    .line 237
    aget-object v2, p1, v1

    if-eqz v2, :cond_3

    .line 238
    aget-object v2, p1, v1

    invoke-direct {p0, v2, v0, v3, v4}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->add(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FZZ)I

    move-result v2

    iput v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleLeft:I

    .line 239
    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->leftWidth:F

    aget-object v5, p1, v1

    invoke-virtual {v5}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v5

    int-to-float v5, v5

    invoke-static {v2, v5}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->leftWidth:F

    .line 240
    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleHeight:F

    aget-object v1, p1, v1

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleHeight:F

    :cond_3
    const/4 v1, 0x4

    .line 242
    aget-object v2, p1, v1

    if-eqz v2, :cond_4

    .line 243
    aget-object v2, p1, v1

    invoke-direct {p0, v2, v0, v4, v4}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->add(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FZZ)I

    move-result v2

    iput v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleCenter:I

    .line 244
    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleWidth:F

    aget-object v5, p1, v1

    invoke-virtual {v5}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v5

    int-to-float v5, v5

    invoke-static {v2, v5}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleWidth:F

    .line 245
    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleHeight:F

    aget-object v1, p1, v1

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleHeight:F

    :cond_4
    const/4 v1, 0x5

    .line 247
    aget-object v2, p1, v1

    if-eqz v2, :cond_5

    .line 248
    aget-object v2, p1, v1

    invoke-direct {p0, v2, v0, v3, v4}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->add(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FZZ)I

    move-result v2

    iput v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleRight:I

    .line 249
    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->rightWidth:F

    aget-object v5, p1, v1

    invoke-virtual {v5}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v5

    int-to-float v5, v5

    invoke-static {v2, v5}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->rightWidth:F

    .line 250
    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleHeight:F

    aget-object v1, p1, v1

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleHeight:F

    .line 252
    :cond_5
    aget-object v1, p1, v3

    if-eqz v1, :cond_6

    .line 253
    aget-object v1, p1, v3

    invoke-direct {p0, v1, v0, v3, v3}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->add(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FZZ)I

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topLeft:I

    .line 254
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->leftWidth:F

    aget-object v2, p1, v3

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v2

    int-to-float v2, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->leftWidth:F

    .line 255
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topHeight:F

    aget-object v2, p1, v3

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topHeight:F

    .line 257
    :cond_6
    aget-object v1, p1, v4

    if-eqz v1, :cond_7

    .line 258
    aget-object v1, p1, v4

    invoke-direct {p0, v1, v0, v4, v3}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->add(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FZZ)I

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topCenter:I

    .line 259
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleWidth:F

    aget-object v2, p1, v4

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v2

    int-to-float v2, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleWidth:F

    .line 260
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topHeight:F

    aget-object v2, p1, v4

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topHeight:F

    :cond_7
    const/4 v1, 0x2

    .line 262
    aget-object v2, p1, v1

    if-eqz v2, :cond_8

    .line 263
    aget-object v2, p1, v1

    invoke-direct {p0, v2, v0, v3, v3}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->add(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FZZ)I

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topRight:I

    .line 264
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->rightWidth:F

    aget-object v2, p1, v1

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v2

    int-to-float v2, v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->rightWidth:F

    .line 265
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topHeight:F

    aget-object p1, p1, v1

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result p1

    int-to-float p1, p1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topHeight:F

    .line 267
    :cond_8
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->idx:I

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->vertices:[F

    array-length v1, v0

    if-ge p1, v1, :cond_9

    .line 268
    new-array v1, p1, [F

    .line 269
    invoke-static {v0, v3, v1, v3, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 270
    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->vertices:[F

    :cond_9
    return-void
.end method

.method private prepareVertices(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V
    .locals 16

    move-object/from16 v7, p0

    .line 346
    iget v0, v7, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->leftWidth:F

    add-float v8, p2, v0

    add-float v9, p2, p4

    .line 347
    iget v0, v7, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->rightWidth:F

    sub-float v10, v9, v0

    .line 348
    iget v0, v7, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomHeight:F

    add-float v11, p3, v0

    add-float v12, p3, p5

    .line 349
    iget v0, v7, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topHeight:F

    sub-float v13, v12, v0

    .line 350
    sget-object v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->tmpDrawColor:Lcom/badlogic/gdx/graphics/Color;

    iget-object v1, v7, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    move-result-object v0

    invoke-interface/range {p1 .. p1}, Lcom/badlogic/gdx/graphics/g2d/Batch;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/Color;->mul(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result v14

    .line 352
    iget v1, v7, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomLeft:I

    const/4 v15, -0x1

    if-eq v1, v15, :cond_0

    sub-float v4, v8, p2

    sub-float v5, v11, p3

    move-object/from16 v0, p0

    move/from16 v2, p2

    move/from16 v3, p3

    move v6, v14

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->set(IFFFFF)V

    .line 353
    :cond_0
    iget v1, v7, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomCenter:I

    if-eq v1, v15, :cond_1

    sub-float v4, v10, v8

    sub-float v5, v11, p3

    move-object/from16 v0, p0

    move v2, v8

    move/from16 v3, p3

    move v6, v14

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->set(IFFFFF)V

    .line 354
    :cond_1
    iget v1, v7, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomRight:I

    if-eq v1, v15, :cond_2

    sub-float v4, v9, v10

    sub-float v5, v11, p3

    move-object/from16 v0, p0

    move v2, v10

    move/from16 v3, p3

    move v6, v14

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->set(IFFFFF)V

    .line 355
    :cond_2
    iget v1, v7, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleLeft:I

    if-eq v1, v15, :cond_3

    sub-float v4, v8, p2

    sub-float v5, v13, v11

    move-object/from16 v0, p0

    move/from16 v2, p2

    move v3, v11

    move v6, v14

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->set(IFFFFF)V

    .line 356
    :cond_3
    iget v1, v7, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleCenter:I

    if-eq v1, v15, :cond_4

    sub-float v4, v10, v8

    sub-float v5, v13, v11

    move-object/from16 v0, p0

    move v2, v8

    move v3, v11

    move v6, v14

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->set(IFFFFF)V

    .line 357
    :cond_4
    iget v1, v7, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleRight:I

    if-eq v1, v15, :cond_5

    sub-float v4, v9, v10

    sub-float v5, v13, v11

    move-object/from16 v0, p0

    move v2, v10

    move v3, v11

    move v6, v14

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->set(IFFFFF)V

    .line 358
    :cond_5
    iget v1, v7, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topLeft:I

    if-eq v1, v15, :cond_6

    sub-float v4, v8, p2

    sub-float v5, v12, v13

    move-object/from16 v0, p0

    move/from16 v2, p2

    move v3, v13

    move v6, v14

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->set(IFFFFF)V

    .line 359
    :cond_6
    iget v1, v7, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topCenter:I

    if-eq v1, v15, :cond_7

    sub-float v4, v10, v8

    sub-float v5, v12, v13

    move-object/from16 v0, p0

    move v2, v8

    move v3, v13

    move v6, v14

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->set(IFFFFF)V

    .line 360
    :cond_7
    iget v1, v7, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topRight:I

    if-eq v1, v15, :cond_8

    sub-float v4, v9, v10

    sub-float v5, v12, v13

    move-object/from16 v0, p0

    move v2, v10

    move v3, v13

    move v6, v14

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->set(IFFFFF)V

    :cond_8
    return-void
.end method

.method private set(IFFFFF)V
    .locals 2

    add-float/2addr p4, p2

    add-float/2addr p5, p3

    .line 327
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->vertices:[F

    .line 328
    aput p2, v0, p1

    add-int/lit8 v1, p1, 0x1

    .line 329
    aput p3, v0, v1

    add-int/lit8 v1, p1, 0x2

    .line 330
    aput p6, v0, v1

    add-int/lit8 v1, p1, 0x5

    .line 332
    aput p2, v0, v1

    add-int/lit8 p2, p1, 0x6

    .line 333
    aput p5, v0, p2

    add-int/lit8 p2, p1, 0x7

    .line 334
    aput p6, v0, p2

    add-int/lit8 p2, p1, 0xa

    .line 336
    aput p4, v0, p2

    add-int/lit8 p2, p1, 0xb

    .line 337
    aput p5, v0, p2

    add-int/lit8 p2, p1, 0xc

    .line 338
    aput p6, v0, p2

    add-int/lit8 p2, p1, 0xf

    .line 340
    aput p4, v0, p2

    add-int/lit8 p2, p1, 0x10

    .line 341
    aput p3, v0, p2

    add-int/lit8 p1, p1, 0x11

    .line 342
    aput p6, v0, p1

    return-void
.end method


# virtual methods
.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V
    .locals 0

    .line 364
    invoke-direct/range {p0 .. p5}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->prepareVertices(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    .line 365
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->texture:Lcom/badlogic/gdx/graphics/Texture;

    iget-object p3, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->vertices:[F

    iget p4, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->idx:I

    const/4 p5, 0x0

    invoke-interface {p1, p2, p3, p5, p4}, Lcom/badlogic/gdx/graphics/g2d/Batch;->draw(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFFFFFFF)V
    .locals 14

    move-object v6, p0

    move-object v0, p0

    move-object v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p6

    move/from16 v5, p7

    .line 370
    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->prepareVertices(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    add-float v0, p2, p4

    add-float v1, p3, p5

    .line 372
    iget v2, v6, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->idx:I

    .line 373
    iget-object v3, v6, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->vertices:[F

    const/4 v4, 0x0

    const/4 v5, 0x0

    cmpl-float v5, p10, v5

    if-eqz v5, :cond_0

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v2, :cond_2

    .line 376
    aget v7, v3, v5

    sub-float/2addr v7, v0

    mul-float v7, v7, p8

    add-int/lit8 v8, v5, 0x1

    aget v9, v3, v8

    sub-float/2addr v9, v1

    mul-float v9, v9, p9

    .line 377
    invoke-static/range {p10 .. p10}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v10

    invoke-static/range {p10 .. p10}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result v11

    mul-float v12, v10, v7

    mul-float v13, v11, v9

    sub-float/2addr v12, v13

    add-float/2addr v12, v0

    .line 378
    aput v12, v3, v5

    mul-float v11, v11, v7

    mul-float v10, v10, v9

    add-float/2addr v11, v10

    add-float/2addr v11, v1

    .line 379
    aput v11, v3, v8

    add-int/lit8 v5, v5, 0x5

    goto :goto_0

    :cond_0
    const/high16 v5, 0x3f800000    # 1.0f

    cmpl-float v7, p8, v5

    if-nez v7, :cond_1

    cmpl-float v5, p9, v5

    if-eqz v5, :cond_2

    :cond_1
    const/4 v5, 0x0

    :goto_1
    if-ge v5, v2, :cond_2

    .line 383
    aget v7, v3, v5

    sub-float/2addr v7, v0

    mul-float v7, v7, p8

    add-float/2addr v7, v0

    aput v7, v3, v5

    add-int/lit8 v7, v5, 0x1

    .line 384
    aget v8, v3, v7

    sub-float/2addr v8, v1

    mul-float v8, v8, p9

    add-float/2addr v8, v1

    aput v8, v3, v7

    add-int/lit8 v5, v5, 0x5

    goto :goto_1

    .line 387
    :cond_2
    iget-object v0, v6, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->texture:Lcom/badlogic/gdx/graphics/Texture;

    move-object v1, p1

    invoke-interface {p1, v0, v3, v4, v2}, Lcom/badlogic/gdx/graphics/g2d/Batch;->draw(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    return-void
.end method

.method public getBottomHeight()F
    .locals 1

    .line 428
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomHeight:F

    return v0
.end method

.method public getColor()Lcom/badlogic/gdx/graphics/Color;
    .locals 1

    .line 397
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->color:Lcom/badlogic/gdx/graphics/Color;

    return-object v0
.end method

.method public getLeftWidth()F
    .locals 1

    .line 401
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->leftWidth:F

    return v0
.end method

.method public getMiddleHeight()F
    .locals 1

    .line 448
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleHeight:F

    return v0
.end method

.method public getMiddleWidth()F
    .locals 1

    .line 437
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleWidth:F

    return v0
.end method

.method public getPadBottom()F
    .locals 2

    .line 510
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padBottom:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v1, v0, v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->getBottomHeight()F

    move-result v0

    :cond_0
    return v0
.end method

.method public getPadLeft()F
    .locals 2

    .line 477
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padLeft:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v1, v0, v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->getLeftWidth()F

    move-result v0

    :cond_0
    return v0
.end method

.method public getPadRight()F
    .locals 2

    .line 488
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padRight:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v1, v0, v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->getRightWidth()F

    move-result v0

    :cond_0
    return v0
.end method

.method public getPadTop()F
    .locals 2

    .line 499
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padTop:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v1, v0, v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->getTopHeight()F

    move-result v0

    :cond_0
    return v0
.end method

.method public getRightWidth()F
    .locals 1

    .line 410
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->rightWidth:F

    return v0
.end method

.method public getTexture()Lcom/badlogic/gdx/graphics/Texture;
    .locals 1

    .line 534
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->texture:Lcom/badlogic/gdx/graphics/Texture;

    return-object v0
.end method

.method public getTopHeight()F
    .locals 1

    .line 419
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topHeight:F

    return v0
.end method

.method public getTotalHeight()F
    .locals 2

    .line 463
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topHeight:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleHeight:F

    add-float/2addr v0, v1

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomHeight:F

    add-float/2addr v0, v1

    return v0
.end method

.method public getTotalWidth()F
    .locals 2

    .line 459
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->leftWidth:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleWidth:F

    add-float/2addr v0, v1

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->rightWidth:F

    add-float/2addr v0, v1

    return v0
.end method

.method public scale(FF)V
    .locals 3

    .line 521
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->leftWidth:F

    mul-float v0, v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->leftWidth:F

    .line 522
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->rightWidth:F

    mul-float v0, v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->rightWidth:F

    .line 523
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topHeight:F

    mul-float v0, v0, p2

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topHeight:F

    .line 524
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomHeight:F

    mul-float v0, v0, p2

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomHeight:F

    .line 525
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleWidth:F

    mul-float v0, v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleWidth:F

    .line 526
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleHeight:F

    mul-float v0, v0, p2

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleHeight:F

    .line 527
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padLeft:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v2, v0, v1

    if-eqz v2, :cond_0

    mul-float v0, v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padLeft:F

    .line 528
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padRight:F

    cmpl-float v2, v0, v1

    if-eqz v2, :cond_1

    mul-float v0, v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padRight:F

    .line 529
    :cond_1
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padTop:F

    cmpl-float v0, p1, v1

    if-eqz v0, :cond_2

    mul-float p1, p1, p2

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padTop:F

    .line 530
    :cond_2
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padBottom:F

    cmpl-float v0, p1, v1

    if-eqz v0, :cond_3

    mul-float p1, p1, p2

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padBottom:F

    :cond_3
    return-void
.end method

.method public setBottomHeight(F)V
    .locals 0

    .line 433
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->bottomHeight:F

    return-void
.end method

.method public setColor(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 1

    .line 393
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method

.method public setLeftWidth(F)V
    .locals 0

    .line 406
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->leftWidth:F

    return-void
.end method

.method public setMiddleHeight(F)V
    .locals 0

    .line 455
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleHeight:F

    return-void
.end method

.method public setMiddleWidth(F)V
    .locals 0

    .line 444
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->middleWidth:F

    return-void
.end method

.method public setPadBottom(F)V
    .locals 0

    .line 516
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padBottom:F

    return-void
.end method

.method public setPadLeft(F)V
    .locals 0

    .line 483
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padLeft:F

    return-void
.end method

.method public setPadRight(F)V
    .locals 0

    .line 494
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padRight:F

    return-void
.end method

.method public setPadTop(F)V
    .locals 0

    .line 505
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padTop:F

    return-void
.end method

.method public setPadding(FFFF)V
    .locals 0

    .line 469
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padLeft:F

    .line 470
    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padRight:F

    .line 471
    iput p3, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padTop:F

    .line 472
    iput p4, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->padBottom:F

    return-void
.end method

.method public setRightWidth(F)V
    .locals 0

    .line 415
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->rightWidth:F

    return-void
.end method

.method public setTopHeight(F)V
    .locals 0

    .line 424
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->topHeight:F

    return-void
.end method
