resource "aws_key_pair" "sshdeploy" {
  key_name   = "aws-ssh-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdKQD3XZN2Z5rEG21PSkEv2FF4lZDgqCOKQarOtb5B5zkBIEpJFzVP22QoaYAi+eZcBn//gCe82xLLj44RPmS4iHlwqABMwGX7r2tv0LEAGULocvru0TBuS4OzxepJPGKDR25s0NCaKs/h48UL515qb/hP3jPJm5B+h+ibeiGBDfO/LQfiJDgtUyj3uv0gRXSqiTKr/sBKqOgKwV4XDQuFENKY8XAGIDWFG/ZSFDmi1X/2Q9xHWtB4Tu+221gRzvWExDVMKjXpMl2VriuhFnWfFVIA57TxGLmK6Y0X4kKo0E3Hk8AB/4mTzDBG4GcNiIVJNQZjeHkiPweABhG6oCTZ julien@private"
  lifecycle {
    create_before_destroy = true
  }

}
