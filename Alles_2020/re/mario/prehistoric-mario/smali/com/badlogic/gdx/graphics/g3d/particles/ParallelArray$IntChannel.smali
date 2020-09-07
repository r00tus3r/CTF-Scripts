.class public Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$IntChannel;
.super Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$Channel;
.source "ParallelArray.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "IntChannel"
.end annotation


# instance fields
.field public data:[I

.field final synthetic this$0:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;III)V
    .locals 0

    .line 107
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$IntChannel;->this$0:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    mul-int p4, p4, p3

    .line 108
    new-array p4, p4, [I

    invoke-direct {p0, p1, p2, p4, p3}, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$Channel;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;ILjava/lang/Object;I)V

    .line 109
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$Channel;->data:Ljava/lang/Object;

    check-cast p1, [I

    check-cast p1, [I

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$IntChannel;->data:[I

    return-void
.end method


# virtual methods
.method public varargs add(I[Ljava/lang/Object;)V
    .locals 4

    .line 114
    iget p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$IntChannel;->strideSize:I

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$IntChannel;->this$0:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    mul-int p1, p1, v0

    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$IntChannel;->strideSize:I

    add-int/2addr v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge p1, v0, :cond_0

    .line 115
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$IntChannel;->data:[I

    aget-object v3, p2, v1

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, v2, p1

    add-int/lit8 p1, p1, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setCapacity(I)V
    .locals 3

    .line 133
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$IntChannel;->strideSize:I

    mul-int v0, v0, p1

    new-array p1, v0, [I

    .line 134
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$IntChannel;->data:[I

    array-length v1, v0

    array-length v2, p1

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    const/4 v2, 0x0

    invoke-static {v0, v2, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 135
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$IntChannel;->data:[I

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$Channel;->data:Ljava/lang/Object;

    return-void
.end method

.method public swap(II)V
    .locals 4

    .line 122
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$IntChannel;->strideSize:I

    mul-int v0, v0, p1

    .line 123
    iget p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$IntChannel;->strideSize:I

    mul-int p1, p1, p2

    .line 124
    iget p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$IntChannel;->strideSize:I

    add-int/2addr p2, v0

    :goto_0
    if-ge v0, p2, :cond_0

    .line 125
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$IntChannel;->data:[I

    aget v2, v1, v0

    .line 126
    aget v3, v1, p1

    aput v3, v1, v0

    .line 127
    aput v2, v1, p1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
