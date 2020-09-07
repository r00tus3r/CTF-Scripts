.class Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$1;
.super Ljava/lang/Object;
.source "PixmapPacker.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy;->sort(Lcom/badlogic/gdx/utils/Array;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/badlogic/gdx/graphics/Pixmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy;)V
    .locals 0

    .line 539
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$1;->this$0:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/badlogic/gdx/graphics/Pixmap;Lcom/badlogic/gdx/graphics/Pixmap;)I
    .locals 1

    .line 541
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {p2}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v0

    invoke-virtual {p2}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result p2

    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    sub-int/2addr p1, p2

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 539
    check-cast p1, Lcom/badlogic/gdx/graphics/Pixmap;

    check-cast p2, Lcom/badlogic/gdx/graphics/Pixmap;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$1;->compare(Lcom/badlogic/gdx/graphics/Pixmap;Lcom/badlogic/gdx/graphics/Pixmap;)I

    move-result p1

    return p1
.end method
