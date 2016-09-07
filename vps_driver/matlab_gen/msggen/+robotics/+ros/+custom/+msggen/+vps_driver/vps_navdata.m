classdef vps_navdata < robotics.ros.Message
    %vps_navdata MATLAB implementation of vps_driver/vps_navdata
    %   This class was automatically generated by
    %   robotics.ros.msg.internal.gen.MessageClassGenerator.
    
    %   Copyright 2016 The MathWorks, Inc.
    
    %#ok<*INUSD>
    
    properties (Constant)
        MessageType = 'vps_driver/vps_navdata' % The ROS message type
    end
    
    properties (Constant, Hidden)
        MD5Checksum = 'c4eef18fb11b4e171c74d891b3a64c8d' % The MD5 Checksum of the message definition
    end
    
    properties (Access = protected)
        JavaMessage % The Java message object
    end
    
    properties (Dependent)
        XE
        YE
        ZE
        YawE
        VxE
        VyE
        VzE
    end
    
    properties (Constant, Hidden)
        PropertyList = {'VxE', 'VyE', 'VzE', 'XE', 'YE', 'YawE', 'ZE'} % List of non-constant message properties
        ROSPropertyList = {'Vx_e', 'Vy_e', 'Vz_e', 'X_e', 'Y_e', 'yaw_e', 'Z_e'} % List of non-constant ROS message properties
    end
    
    methods
        function obj = vps_navdata(msg)
            %vps_navdata Construct the message object vps_navdata
            import com.mathworks.toolbox.robotics.ros.message.MessageInfo;
            
            % Support default constructor
            if nargin == 0
                obj.JavaMessage = obj.createNewJavaMessage;
                return;
            end
            
            % Construct appropriate empty array
            if isempty(msg)
                obj = obj.empty(0,1);
                return;
            end
            
            % Make scalar construction fast
            if isscalar(msg)
                % Check for correct input class
                if ~MessageInfo.compareTypes(msg(1), obj.MessageType)
                    error(message('robotics:ros:message:NoTypeMatch', obj.MessageType, ...
                        char(MessageInfo.getType(msg(1))) ));
                end
                obj.JavaMessage = msg(1);
                return;
            end
            
            % Check that this is a vector of scalar messages. Since this
            % is an object array, use arrayfun to verify.
            if ~all(arrayfun(@isscalar, msg))
                error(message('robotics:ros:message:MessageArraySizeError'));
            end
            
            % Check that all messages in the array have the correct type
            if ~all(arrayfun(@(x) MessageInfo.compareTypes(x, obj.MessageType), msg))
                error(message('robotics:ros:message:NoTypeMatchArray', obj.MessageType));
            end
            
            % Construct array of objects if necessary
            objType = class(obj);
            for i = 1:length(msg)
                obj(i,1) = feval(objType, msg(i)); %#ok<AGROW>
            end
        end
        
        function xe = get.XE(obj)
            %get.XE Get the value for property XE
            xe = double(obj.JavaMessage.getXE);
        end
        
        function set.XE(obj, xe)
            %set.XE Set the value for property XE
            validateattributes(xe, {'numeric'}, {'nonempty', 'scalar'}, 'vps_navdata', 'xe');
            
            obj.JavaMessage.setXE(xe);
        end
        
        function ye = get.YE(obj)
            %get.YE Get the value for property YE
            ye = double(obj.JavaMessage.getYE);
        end
        
        function set.YE(obj, ye)
            %set.YE Set the value for property YE
            validateattributes(ye, {'numeric'}, {'nonempty', 'scalar'}, 'vps_navdata', 'ye');
            
            obj.JavaMessage.setYE(ye);
        end
        
        function ze = get.ZE(obj)
            %get.ZE Get the value for property ZE
            ze = double(obj.JavaMessage.getZE);
        end
        
        function set.ZE(obj, ze)
            %set.ZE Set the value for property ZE
            validateattributes(ze, {'numeric'}, {'nonempty', 'scalar'}, 'vps_navdata', 'ze');
            
            obj.JavaMessage.setZE(ze);
        end
        
        function yawe = get.YawE(obj)
            %get.YawE Get the value for property YawE
            yawe = double(obj.JavaMessage.getYawE);
        end
        
        function set.YawE(obj, yawe)
            %set.YawE Set the value for property YawE
            validateattributes(yawe, {'numeric'}, {'nonempty', 'scalar'}, 'vps_navdata', 'yawe');
            
            obj.JavaMessage.setYawE(yawe);
        end
        
        function vxe = get.VxE(obj)
            %get.VxE Get the value for property VxE
            vxe = double(obj.JavaMessage.getVxE);
        end
        
        function set.VxE(obj, vxe)
            %set.VxE Set the value for property VxE
            validateattributes(vxe, {'numeric'}, {'nonempty', 'scalar'}, 'vps_navdata', 'vxe');
            
            obj.JavaMessage.setVxE(vxe);
        end
        
        function vye = get.VyE(obj)
            %get.VyE Get the value for property VyE
            vye = double(obj.JavaMessage.getVyE);
        end
        
        function set.VyE(obj, vye)
            %set.VyE Set the value for property VyE
            validateattributes(vye, {'numeric'}, {'nonempty', 'scalar'}, 'vps_navdata', 'vye');
            
            obj.JavaMessage.setVyE(vye);
        end
        
        function vze = get.VzE(obj)
            %get.VzE Get the value for property VzE
            vze = double(obj.JavaMessage.getVzE);
        end
        
        function set.VzE(obj, vze)
            %set.VzE Set the value for property VzE
            validateattributes(vze, {'numeric'}, {'nonempty', 'scalar'}, 'vps_navdata', 'vze');
            
            obj.JavaMessage.setVzE(vze);
        end
    end
    
    methods (Access = protected)
        function cpObj = copyElement(obj)
            %copyElement Implements deep copy behavior for message
            
            % Call default copy method for shallow copy
            cpObj = copyElement@robotics.ros.Message(obj);
            
            % Create a new Java message object
            cpObj.JavaMessage = obj.createNewJavaMessage;
            
            % Iterate over all primitive properties
            cpObj.XE = obj.XE;
            cpObj.YE = obj.YE;
            cpObj.ZE = obj.ZE;
            cpObj.YawE = obj.YawE;
            cpObj.VxE = obj.VxE;
            cpObj.VyE = obj.VyE;
            cpObj.VzE = obj.VzE;
        end
        
        function reload(obj, strObj)
            %reload Called by loadobj to assign properties
            obj.XE = strObj.XE;
            obj.YE = strObj.YE;
            obj.ZE = strObj.ZE;
            obj.YawE = strObj.YawE;
            obj.VxE = strObj.VxE;
            obj.VyE = strObj.VyE;
            obj.VzE = strObj.VzE;
        end
    end
    
    methods (Access = ?robotics.ros.Message)
        function strObj = saveobj(obj)
            %saveobj Implements saving of message to MAT file
            
            % Return an empty element if object array is empty
            if isempty(obj)
                strObj = struct.empty;
                return
            end
            
            strObj.XE = obj.XE;
            strObj.YE = obj.YE;
            strObj.ZE = obj.ZE;
            strObj.YawE = obj.YawE;
            strObj.VxE = obj.VxE;
            strObj.VyE = obj.VyE;
            strObj.VzE = obj.VzE;
        end
    end
    
    methods (Static, Access = {?matlab.unittest.TestCase, ?robotics.ros.Message})
        function obj = loadobj(strObj)
            %loadobj Implements loading of message from MAT file
            
            % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = robotics.ros.custom.msggen.vps_driver.vps_navdata.empty(0,1);
                return
            end
            
            % Create an empty message object
            obj = robotics.ros.custom.msggen.vps_driver.vps_navdata;
            obj.reload(strObj);
        end
    end
end