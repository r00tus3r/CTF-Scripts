.class public interface abstract Lcom/uwsoft/editor/renderer/actor/IBaseItem;
.super Ljava/lang/Object;
.source "IBaseItem.java"


# virtual methods
.method public abstract applyResolution(FF)V
.end method

.method public abstract dispose()V
.end method

.method public abstract getBody()Lcom/badlogic/gdx/physics/box2d/Body;
.end method

.method public abstract getCustomVariables()Lcom/uwsoft/editor/renderer/utils/CustomVariables;
.end method

.method public abstract getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;
.end method

.method public abstract getLayerIndex()I
.end method

.method public abstract getParentItem()Lcom/uwsoft/editor/renderer/actor/CompositeItem;
.end method

.method public abstract isComposite()Z
.end method

.method public abstract isLockedByLayer()Z
.end method

.method public abstract renew()V
.end method

.method public abstract setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
.end method

.method public abstract setLayerIndex(I)V
.end method

.method public abstract setLockByLayer(Z)V
.end method

.method public abstract setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
.end method

.method public abstract updateDataVO()V
.end method
