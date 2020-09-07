package com.uwsoft.editor.renderer.data;

public class ParticleEffectVO extends MainItemVO {
  public float particleHeight = 100.0F;
  
  public String particleName = "";
  
  public float particleWidth = 100.0F;
  
  public ParticleEffectVO() {}
  
  public ParticleEffectVO(ParticleEffectVO paramParticleEffectVO) {
    super(paramParticleEffectVO);
    this.particleName = new String(paramParticleEffectVO.particleName);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/ParticleEffectVO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */