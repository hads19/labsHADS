﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace labsHADS.referenciaHyF {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="referenciaHyF.AverageAsigSoap")]
    public interface AverageAsigSoap {
        
        // CODEGEN: Generating message contract since element name HelloWorldResult from namespace http://tempuri.org/ is not marked nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/HelloWorld", ReplyAction="*")]
        labsHADS.referenciaHyF.HelloWorldResponse HelloWorld(labsHADS.referenciaHyF.HelloWorldRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/HelloWorld", ReplyAction="*")]
        System.Threading.Tasks.Task<labsHADS.referenciaHyF.HelloWorldResponse> HelloWorldAsync(labsHADS.referenciaHyF.HelloWorldRequest request);
        
        // CODEGEN: Generating message contract since element name FuncionaResult from namespace http://tempuri.org/ is not marked nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Funciona", ReplyAction="*")]
        labsHADS.referenciaHyF.FuncionaResponse Funciona(labsHADS.referenciaHyF.FuncionaRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Funciona", ReplyAction="*")]
        System.Threading.Tasks.Task<labsHADS.referenciaHyF.FuncionaResponse> FuncionaAsync(labsHADS.referenciaHyF.FuncionaRequest request);
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class HelloWorldRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="HelloWorld", Namespace="http://tempuri.org/", Order=0)]
        public labsHADS.referenciaHyF.HelloWorldRequestBody Body;
        
        public HelloWorldRequest() {
        }
        
        public HelloWorldRequest(labsHADS.referenciaHyF.HelloWorldRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute()]
    public partial class HelloWorldRequestBody {
        
        public HelloWorldRequestBody() {
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class HelloWorldResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="HelloWorldResponse", Namespace="http://tempuri.org/", Order=0)]
        public labsHADS.referenciaHyF.HelloWorldResponseBody Body;
        
        public HelloWorldResponse() {
        }
        
        public HelloWorldResponse(labsHADS.referenciaHyF.HelloWorldResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class HelloWorldResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string HelloWorldResult;
        
        public HelloWorldResponseBody() {
        }
        
        public HelloWorldResponseBody(string HelloWorldResult) {
            this.HelloWorldResult = HelloWorldResult;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class FuncionaRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="Funciona", Namespace="http://tempuri.org/", Order=0)]
        public labsHADS.referenciaHyF.FuncionaRequestBody Body;
        
        public FuncionaRequest() {
        }
        
        public FuncionaRequest(labsHADS.referenciaHyF.FuncionaRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute()]
    public partial class FuncionaRequestBody {
        
        public FuncionaRequestBody() {
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class FuncionaResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="FuncionaResponse", Namespace="http://tempuri.org/", Order=0)]
        public labsHADS.referenciaHyF.FuncionaResponseBody Body;
        
        public FuncionaResponse() {
        }
        
        public FuncionaResponse(labsHADS.referenciaHyF.FuncionaResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class FuncionaResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string FuncionaResult;
        
        public FuncionaResponseBody() {
        }
        
        public FuncionaResponseBody(string FuncionaResult) {
            this.FuncionaResult = FuncionaResult;
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface AverageAsigSoapChannel : labsHADS.referenciaHyF.AverageAsigSoap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class AverageAsigSoapClient : System.ServiceModel.ClientBase<labsHADS.referenciaHyF.AverageAsigSoap>, labsHADS.referenciaHyF.AverageAsigSoap {
        
        public AverageAsigSoapClient() {
        }
        
        public AverageAsigSoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public AverageAsigSoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public AverageAsigSoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public AverageAsigSoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        labsHADS.referenciaHyF.HelloWorldResponse labsHADS.referenciaHyF.AverageAsigSoap.HelloWorld(labsHADS.referenciaHyF.HelloWorldRequest request) {
            return base.Channel.HelloWorld(request);
        }
        
        public string HelloWorld() {
            labsHADS.referenciaHyF.HelloWorldRequest inValue = new labsHADS.referenciaHyF.HelloWorldRequest();
            inValue.Body = new labsHADS.referenciaHyF.HelloWorldRequestBody();
            labsHADS.referenciaHyF.HelloWorldResponse retVal = ((labsHADS.referenciaHyF.AverageAsigSoap)(this)).HelloWorld(inValue);
            return retVal.Body.HelloWorldResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<labsHADS.referenciaHyF.HelloWorldResponse> labsHADS.referenciaHyF.AverageAsigSoap.HelloWorldAsync(labsHADS.referenciaHyF.HelloWorldRequest request) {
            return base.Channel.HelloWorldAsync(request);
        }
        
        public System.Threading.Tasks.Task<labsHADS.referenciaHyF.HelloWorldResponse> HelloWorldAsync() {
            labsHADS.referenciaHyF.HelloWorldRequest inValue = new labsHADS.referenciaHyF.HelloWorldRequest();
            inValue.Body = new labsHADS.referenciaHyF.HelloWorldRequestBody();
            return ((labsHADS.referenciaHyF.AverageAsigSoap)(this)).HelloWorldAsync(inValue);
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        labsHADS.referenciaHyF.FuncionaResponse labsHADS.referenciaHyF.AverageAsigSoap.Funciona(labsHADS.referenciaHyF.FuncionaRequest request) {
            return base.Channel.Funciona(request);
        }
        
        public string Funciona() {
            labsHADS.referenciaHyF.FuncionaRequest inValue = new labsHADS.referenciaHyF.FuncionaRequest();
            inValue.Body = new labsHADS.referenciaHyF.FuncionaRequestBody();
            labsHADS.referenciaHyF.FuncionaResponse retVal = ((labsHADS.referenciaHyF.AverageAsigSoap)(this)).Funciona(inValue);
            return retVal.Body.FuncionaResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<labsHADS.referenciaHyF.FuncionaResponse> labsHADS.referenciaHyF.AverageAsigSoap.FuncionaAsync(labsHADS.referenciaHyF.FuncionaRequest request) {
            return base.Channel.FuncionaAsync(request);
        }
        
        public System.Threading.Tasks.Task<labsHADS.referenciaHyF.FuncionaResponse> FuncionaAsync() {
            labsHADS.referenciaHyF.FuncionaRequest inValue = new labsHADS.referenciaHyF.FuncionaRequest();
            inValue.Body = new labsHADS.referenciaHyF.FuncionaRequestBody();
            return ((labsHADS.referenciaHyF.AverageAsigSoap)(this)).FuncionaAsync(inValue);
        }
    }
}
