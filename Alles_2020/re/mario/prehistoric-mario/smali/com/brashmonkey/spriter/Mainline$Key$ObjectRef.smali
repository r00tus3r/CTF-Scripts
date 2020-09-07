.class public Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;
.super Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;
.source "Mainline.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/brashmonkey/spriter/Mainline$Key;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ObjectRef"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;",
        "Ljava/lang/Comparable<",
        "Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;",
        ">;"
    }
.end annotation


# instance fields
.field public final zIndex:I


# direct methods
.method public constructor <init>(IIILcom/brashmonkey/spriter/Mainline$Key$BoneRef;I)V
    .locals 0

    .line 201
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;-><init>(IIILcom/brashmonkey/spriter/Mainline$Key$BoneRef;)V

    .line 202
    iput p5, p0, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;->zIndex:I

    return-void
.end method


# virtual methods
.method public compareTo(Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;)I
    .locals 1

    .line 211
    iget v0, p0, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;->zIndex:I

    iget p1, p1, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;->zIndex:I

    sub-int/2addr v0, p1

    int-to-float p1, v0

    invoke-static {p1}, Ljava/lang/Math;->signum(F)F

    move-result p1

    float-to-int p1, p1

    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 197
    check-cast p1, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;->compareTo(Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;)I

    move-result p1

    return p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 206
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", z_index: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;->zIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
