.class public Lcom/badlogic/gdx/utils/BinaryHeap$Node;
.super Ljava/lang/Object;
.source "BinaryHeap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/BinaryHeap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Node"
.end annotation


# instance fields
.field index:I

.field value:F


# direct methods
.method public constructor <init>(F)V
    .locals 0

    .line 228
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 229
    iput p1, p0, Lcom/badlogic/gdx/utils/BinaryHeap$Node;->value:F

    return-void
.end method


# virtual methods
.method public getValue()F
    .locals 1

    .line 233
    iget v0, p0, Lcom/badlogic/gdx/utils/BinaryHeap$Node;->value:F

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 237
    iget v0, p0, Lcom/badlogic/gdx/utils/BinaryHeap$Node;->value:F

    invoke-static {v0}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
