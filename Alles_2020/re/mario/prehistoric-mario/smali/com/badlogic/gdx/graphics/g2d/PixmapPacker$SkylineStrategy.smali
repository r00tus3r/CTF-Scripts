.class public Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy;
.super Ljava/lang/Object;
.source "PixmapPacker.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$PackStrategy;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SkylineStrategy"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage;
    }
.end annotation


# instance fields
.field comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/badlogic/gdx/graphics/Pixmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 638
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public pack(Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;Ljava/lang/String;Lcom/badlogic/gdx/math/Rectangle;)Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$Page;
    .locals 16

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    .line 653
    iget v2, v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->padding:I

    .line 654
    iget v3, v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->pageWidth:I

    mul-int/lit8 v4, v2, 0x2

    sub-int/2addr v3, v4

    iget v5, v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->pageHeight:I

    sub-int/2addr v5, v4

    .line 655
    iget v4, v1, Lcom/badlogic/gdx/math/Rectangle;->width:F

    float-to-int v4, v4

    add-int/2addr v4, v2

    iget v6, v1, Lcom/badlogic/gdx/math/Rectangle;->height:F

    float-to-int v6, v6

    add-int/2addr v6, v2

    .line 656
    iget-object v7, v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->pages:Lcom/badlogic/gdx/utils/Array;

    iget v7, v7, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v9, 0x0

    :goto_0
    if-ge v9, v7, :cond_a

    .line 657
    iget-object v10, v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->pages:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v10, v9}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage;

    const/4 v11, 0x0

    .line 660
    iget-object v12, v10, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage;->rows:Lcom/badlogic/gdx/utils/Array;

    iget v12, v12, Lcom/badlogic/gdx/utils/Array;->size:I

    add-int/lit8 v12, v12, -0x1

    move-object v13, v11

    const/4 v11, 0x0

    :goto_1
    if-ge v11, v12, :cond_5

    .line 661
    iget-object v14, v10, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage;->rows:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v14, v11}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;

    .line 662
    iget v15, v14, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->x:I

    add-int/2addr v15, v4

    if-lt v15, v3, :cond_0

    goto :goto_2

    .line 663
    :cond_0
    iget v15, v14, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->y:I

    add-int/2addr v15, v6

    if-lt v15, v5, :cond_1

    goto :goto_2

    .line 664
    :cond_1
    iget v15, v14, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->height:I

    if-le v6, v15, :cond_2

    goto :goto_2

    :cond_2
    if-eqz v13, :cond_3

    .line 665
    iget v15, v14, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->height:I

    iget v8, v13, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->height:I

    if-ge v15, v8, :cond_4

    :cond_3
    move-object v13, v14

    :cond_4
    :goto_2
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    :cond_5
    if-nez v13, :cond_8

    .line 669
    iget-object v8, v10, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage;->rows:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v8}, Lcom/badlogic/gdx/utils/Array;->peek()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;

    .line 670
    iget v11, v8, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->y:I

    add-int/2addr v11, v6

    if-lt v11, v5, :cond_6

    goto :goto_4

    .line 671
    :cond_6
    iget v11, v8, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->x:I

    add-int/2addr v11, v4

    if-ge v11, v3, :cond_7

    .line 672
    iget v11, v8, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->height:I

    invoke-static {v11, v6}, Ljava/lang/Math;->max(II)I

    move-result v11

    iput v11, v8, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->height:I

    move-object v13, v8

    goto :goto_3

    .line 674
    :cond_7
    iget v11, v8, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->y:I

    iget v12, v8, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->height:I

    add-int/2addr v11, v12

    add-int/2addr v11, v6

    if-ge v11, v5, :cond_8

    .line 676
    new-instance v13, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;

    invoke-direct {v13}, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;-><init>()V

    .line 677
    iget v11, v8, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->y:I

    iget v8, v8, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->height:I

    add-int/2addr v11, v8

    iput v11, v13, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->y:I

    .line 678
    iput v6, v13, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->height:I

    .line 679
    iget-object v8, v10, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage;->rows:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v8, v13}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    :cond_8
    :goto_3
    if-eqz v13, :cond_9

    .line 683
    iget v0, v13, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->x:I

    int-to-float v0, v0

    iput v0, v1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    .line 684
    iget v0, v13, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->y:I

    int-to-float v0, v0

    iput v0, v1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    .line 685
    iget v0, v13, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->x:I

    add-int/2addr v0, v4

    iput v0, v13, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->x:I

    return-object v10

    :cond_9
    :goto_4
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_0

    .line 690
    :cond_a
    new-instance v3, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage;

    invoke-direct {v3, v0}, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage;-><init>(Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;)V

    .line 691
    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->pages:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 692
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;-><init>()V

    add-int/2addr v4, v2

    .line 693
    iput v4, v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->x:I

    .line 694
    iput v2, v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->y:I

    .line 695
    iput v6, v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;->height:I

    .line 696
    iget-object v4, v3, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage;->rows:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v4, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    int-to-float v0, v2

    .line 697
    iput v0, v1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    .line 698
    iput v0, v1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    return-object v3
.end method

.method public sort(Lcom/badlogic/gdx/utils/Array;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/Pixmap;",
            ">;)V"
        }
    .end annotation

    .line 642
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy;->comparator:Ljava/util/Comparator;

    if-nez v0, :cond_0

    .line 643
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$1;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$1;-><init>(Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy;)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy;->comparator:Ljava/util/Comparator;

    .line 649
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy;->comparator:Ljava/util/Comparator;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/Array;->sort(Ljava/util/Comparator;)V

    return-void
.end method
