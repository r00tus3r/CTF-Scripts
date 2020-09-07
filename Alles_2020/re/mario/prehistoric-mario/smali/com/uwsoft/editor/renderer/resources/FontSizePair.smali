.class public Lcom/uwsoft/editor/renderer/resources/FontSizePair;
.super Ljava/lang/Object;
.source "FontSizePair.java"


# instance fields
.field public fontName:Ljava/lang/String;

.field public fontSize:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/resources/FontSizePair;->fontName:Ljava/lang/String;

    .line 13
    iput p2, p0, Lcom/uwsoft/editor/renderer/resources/FontSizePair;->fontSize:I

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 18
    check-cast p1, Lcom/uwsoft/editor/renderer/resources/FontSizePair;

    .line 19
    iget-object v0, p1, Lcom/uwsoft/editor/renderer/resources/FontSizePair;->fontName:Ljava/lang/String;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/resources/FontSizePair;->fontName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget p1, p1, Lcom/uwsoft/editor/renderer/resources/FontSizePair;->fontSize:I

    iget v0, p0, Lcom/uwsoft/editor/renderer/resources/FontSizePair;->fontSize:I

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public hashCode()I
    .locals 2

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/resources/FontSizePair;->fontName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/uwsoft/editor/renderer/resources/FontSizePair;->fontSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/resources/FontSizePair;->fontName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/uwsoft/editor/renderer/resources/FontSizePair;->fontSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
