.class final Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$Node;
.super Ljava/lang/Object;
.source "PixmapPacker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Node"
.end annotation


# instance fields
.field public full:Z

.field public leftChild:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$Node;

.field public final rect:Lcom/badlogic/gdx/math/Rectangle;

.field public rightChild:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$Node;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 615
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 618
    new-instance v0, Lcom/badlogic/gdx/math/Rectangle;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Rectangle;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$GuillotineStrategy$Node;->rect:Lcom/badlogic/gdx/math/Rectangle;

    return-void
.end method
