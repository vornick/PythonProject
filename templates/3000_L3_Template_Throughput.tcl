#################################################
# IxLoad ScriptGen created TCL script
# Test1 serialized using version 6.30.0.378
# 3000.tcl made on Sep 08 2016 16:50
#################################################

#################################################
# Copy content of setup_ixload_paths.tcl
#################################################

package require IxLoad

::IxLoad connect 1.2.3.4

if [catch {

set logtag "IxLoad-api"
set logName "?NameResult?"
set logger [::IxLoad new ixLogger $logtag 1]
set logEngine [$logger getEngine]
$logEngine setLevels $::ixLogger(kLevelDebug) $::ixLogger(kLevelInfo)
$logEngine setFile $logName 2 256 1

global ixAppPluginManager
$ixAppPluginManager load "HTTP"

package require statCollectorUtils
set scu_version [package require statCollectorUtils]
puts "statCollectorUtils package version = $scu_version"

#################################################
# Build chassis chain
#################################################
set chassisChain [::IxLoad new ixChassisChain]
$chassisChain addChassis 172.17.5.220

set my_ixEventHandlerSettings [::IxLoad new ixEventHandlerSettings]
$my_ixEventHandlerSettings config \
	-disabledEventClasses                    "" \
	-disabledPorts                           "" 

set my_ixViewOptions [::IxLoad new ixViewOptions]
$my_ixViewOptions config \
	-runMode                                 1 \
	-captureRunDuration                      0 \
	-captureRunAfter                         0 \
	-collectScheme                           0 \
	-allocatedBufferMemoryPercentage         30 

set Test1 [::IxLoad new ixTest]

set scenarioElementFactory [$Test1 getScenarioElementFactory]


set scenarioFactory [$Test1 getScenarioFactory]


$Test1 scenarioList.clear

set Scenario1 [$scenarioFactory create "Scenario"]
$Scenario1 columnList.clear

set Originate [::IxLoad new ixTrafficColumn]
$Originate elementList.clear

#################################################
# Create ScenarioElement kNetTraffic
#################################################
set Traffic1_Network1 [$scenarioElementFactory create $::ixScenarioElementType(kNetTraffic)]

#################################################
# Network Network1 of NetTraffic Traffic1@Network1
#################################################
set Network1 [$Traffic1_Network1 cget -network]
$Network1 portList.appendItem \
	-chassisId 1 \
	-cardId 1 \
	-portId 1
?Agregation_Resources?
$Network1 portList.appendItem \
	-chassisId 1 \
	-cardId 1 \
	-portId 2

$Network1 portList.appendItem \
	-chassisId 1 \
	-cardId 1 \
	-portId 3

$Network1 portList.appendItem \
	-chassisId 1 \
	-cardId 1 \
	-portId 4

$Network1 portList.appendItem \
	-chassisId 1 \
	-cardId 1 \
	-portId 5

$Network1 portList.appendItem \
	-chassisId 1 \
	-cardId 1 \
	-portId 6

$Network1 portList.appendItem \
	-chassisId 1 \
	-cardId 1 \
	-portId 7

$Network1 portList.appendItem \
	-chassisId 1 \
	-cardId 1 \
	-portId 8

$Network1 portList.appendItem \
	-chassisId 1 \
	-cardId 1 \
	-portId 9

$Network1 portList.appendItem \
	-chassisId 1 \
	-cardId 1 \
	-portId 10

$Network1 portList.appendItem \
	-chassisId 1 \
	-cardId 1 \
	-portId 11

$Network1 portList.appendItem \
	-chassisId 1 \
	-cardId 1 \
	-portId 12

$Network1 globalPlugins.clear


set Settings_1 [::IxLoad new ixNetIxLoadSettingsPlugin]
# ixNet objects needs to be added in the list before they are configured!
$Network1 globalPlugins.appendItem -object $Settings_1

$Settings_1 config \
	-teardownInterfaceWithUser               false \
	-_Stale                                  false \
	-interfaceBehavior                       0 

set Filter_1 [::IxLoad new ixNetFilterPlugin]
# ixNet objects needs to be added in the list before they are configured!
$Network1 globalPlugins.appendItem -object $Filter_1

$Filter_1 config \
	-all                                     false \
	-pppoecontrol                            false \
	-isis                                    false \
	-auto                                    true \
	-udp                                     "" \
	-tcp                                     "" \
	-mac                                     "" \
	-_Stale                                  false \
	-pppoenetwork                            false \
	-ip                                      "" \
	-icmp                                    "" 

set GratARP_1 [::IxLoad new ixNetGratArpPlugin]
# ixNet objects needs to be added in the list before they are configured!
$Network1 globalPlugins.appendItem -object $GratARP_1

$GratARP_1 config \
	-forwardGratArp                          false \
	-enabled                                 true \
	-maxFramesPerSecond                      0 \
	-_Stale                                  false \
	-rateControlEnabled                      false 

set TCP_1 [::IxLoad new ixNetTCPPlugin]
# ixNet objects needs to be added in the list before they are configured!
$Network1 globalPlugins.appendItem -object $TCP_1

$TCP_1 config \
	-tcp_bic                                 0 \
	-tcp_tw_recycle                          true \
	-tcp_retries2                            5 \
	-disable_min_max_buffer_size             true \
	-tcp_retries1                            3 \
	-tcp_keepalive_time                      7200 \
	-tcp_rfc1337                             false \
	-tcp_ipfrag_time                         30 \
	-tcp_rto_max                             120000 \
	-tcp_window_scaling                      false \
	-delayed_acks                            true \
	-udp_port_randomization                  false \
	-tcp_vegas_alpha                         2 \
	-tcp_vegas_beta                          6 \
	-tcp_wmem_max                            262144 \
	-tcp_ecn                                 false \
	-tcp_westwood                            0 \
	-tcp_rto_min                             200 \
	-delayed_acks_segments                   0 \
	-inter_packet_delay                      0 \
	-tcp_vegas_cong_avoid                    0 \
	-tcp_keepalive_intvl                     75 \
	-tcp_rmem_max                            262144 \
	-tcp_orphan_retries                      0 \
	-bestPerfSettings                        false \
	-tcp_max_tw_buckets                      180000 \
	-_Stale                                  false \
	-tcp_low_latency                         0 \
	-tcp_rmem_min                            4096 \
	-accept_ra_all                           false \
	-tcp_adv_win_scale                       2 \
	-tcp_wmem_default                        4096 \
	-tcp_wmem_min                            4096 \
	-tcp_port_min                            1024 \
	-tcp_stdurg                              false \
	-tcp_port_max                            65535 \
	-tcp_fin_timeout                         60 \
	-tcp_no_metrics_save                     false \
	-tcp_dsack                               true \
	-tcp_abort_on_overflow                   false \
	-tcp_frto                                0 \
	-tcp_mem_pressure                        32768 \
	-tcp_app_win                             31 \
	-ip_no_pmtu_disc                         true \
	-llm_hdr_gap                             8 \
	-tcp_max_orphans                         8192 \
	-accept_ra_default                       false \
	-tcp_syn_retries                         5 \
	-tcp_moderate_rcvbuf                     0 \
	-tcp_max_syn_backlog                     1024 \
	-tcp_mem_low                             24576 \
	-tcp_tw_rfc1323_strict                   false \
	-tcp_fack                                true \
	-tcp_retrans_collapse                    true \
	-llm_hdr_gap_ns                          10 \
	-tcp_rmem_default                        32768 \
	-tcp_keepalive_probes                    9 \
	-tcp_mem_high                            49152 \
	-tcp_tw_reuse                            false \
	-delayed_acks_timeout                    0 \
	-tcp_vegas_gamma                         2 \
	-tcp_synack_retries                      5 \
	-tcp_timestamps                          true \
	-tcp_reordering                          3 \
	-rps_needed                              false \
	-tcp_sack                                true \
	-tcp_bic_fast_convergence                1 \
	-tcp_bic_low_window                      14 

set DNS_1 [::IxLoad new ixNetDnsPlugin]
# ixNet objects needs to be added in the list before they are configured!
$Network1 globalPlugins.appendItem -object $DNS_1

$DNS_1 hostList.clear


$DNS_1 searchList.clear


$DNS_1 nameServerList.clear


$DNS_1 config \
	-domain                                  "" \
	-_Stale                                  false \
	-timeout                                 30 

set Meshing_1 [::IxLoad new ixNetMeshingPlugin]
# ixNet objects needs to be added in the list before they are configured!
$Network1 globalPlugins.appendItem -object $Meshing_1

$Meshing_1 trafficMaps.clear


set HTTPClient1_Traffic2_HTTPServer1 [::IxLoad new ixNetMeshingTrafficMap]
# ixNet objects needs to be added in the list before they are configured!
$Meshing_1 trafficMaps.appendItem -object $HTTPClient1_Traffic2_HTTPServer1

$HTTPClient1_Traffic2_HTTPServer1 config \
	-ipPreference                            2 \
	-name                                    "HTTPClient1!Traffic2_HTTPServer1" \
	-portRangesString                        "" \
	-_Stale                                  false \
	-meshingType                             2 \
	-sourceActivityId                        0 \
	-configMapFilename                       "HTTPClient1Script.configmap" 

$Meshing_1 config \
	-_Stale                                  false 

$Network1 config \
	-comment                                 "" \
	-cpuAggregation                          false \
	-name                                    "Network1" \
	-lineSpeed                               "Default" \
	-aggregation                             2 

set Ethernet_1 [$Network1 getL1Plugin]

set my_ixNetDataCenterSettings [::IxLoad new ixNetDataCenterSettings]
$my_ixNetDataCenterSettings config \
	-dcSupported                             true \
	-dcEnabled                               false \
	-dcPfcPauseDelay                         1 \
	-_Stale                                  false \
	-dcMode                                  2 \
	-dcPfcPauseEnable                        false \
	-dcFlowControl                           0 

set my_ixNetEthernetELMPlugin [::IxLoad new ixNetEthernetELMPlugin]
$my_ixNetEthernetELMPlugin config \
	-negotiationType                         "master" \
	-_Stale                                  false \
	-negotiateMasterSlave                    true 

set my_ixNetDualPhyPlugin [::IxLoad new ixNetDualPhyPlugin]
$my_ixNetDualPhyPlugin config \
	-medium                                  "auto" \
	-_Stale                                  false 

$Ethernet_1 childrenList.clear


set MAC_VLAN_1 [::IxLoad new ixNetL2EthernetPlugin]
# ixNet objects needs to be added in the list before they are configured!
$Ethernet_1 childrenList.appendItem -object $MAC_VLAN_1

$MAC_VLAN_1 childrenList.clear


set IP_1 [::IxLoad new ixNetIpV4V6Plugin]
# ixNet objects needs to be added in the list before they are configured!
$MAC_VLAN_1 childrenList.appendItem -object $IP_1

$IP_1 childrenList.clear


$IP_1 extensionList.clear


$IP_1 config \
	-_Stale                                  false 

$MAC_VLAN_1 extensionList.clear


$MAC_VLAN_1 config \
	-_Stale                                  false 

$Ethernet_1 extensionList.clear


$Ethernet_1 config \
	-advertise10Full                         true \
	-directedAddress                         "01:80:C2:00:00:01" \
	-autoNegotiate                           true \
	-advertise100Half                        true \
	-advertise10Half                         true \
	-enableFlowControl                       false \
	-_Stale                                  false \
	-speed                                   "k100FD" \
	-advertise1000Full                       true \
	-advertise100Full                        true \
	-dataCenter                              $my_ixNetDataCenterSettings \
	-cardElm                                 $my_ixNetEthernetELMPlugin \
	-cardDualPhy                             $my_ixNetDualPhyPlugin 

#################################################
# Setting the ranges starting with the plugins that need to be script gen first
#################################################
$IP_1 rangeList.clear

set IP_R1 [::IxLoad new ixNetIpV4V6Range]
# ixNet objects needs to be added in the list before they are configured.
$IP_1 rangeList.appendItem -object $IP_R1

$IP_R1 config \
	-count                                   4 \
	-enableGatewayArp                        false \
	-prefix                                  16 \
	-randomizeSeed                           50235888 \
	-generateStatistics                      false \
	-autoCountEnabled                        false \
	-enabled                                 true \
	-autoMacGeneration                       true \
	-publishStats                            false \
	-incrementBy                             "0.0.0.1" \
	-netTraffic                              "Network1" \
	-_Stale                                  false \
	-gatewayIncrement                        "0.0.0.0" \
	-gatewayIncrementMode                    "perSubnet" \
	-mss                                     1460 \
	-randomizeAddress                        false \
	-gatewayAddress                          ?GatewayClient? \ \
	-ipAddress                               ?IPAdressClient? \
	-ipType                                  "IPv4" 

set MAC_R1 [$IP_R1 getLowerRelatedRange "MacRange"]

$MAC_R1 config \
	-count                                   4 \
	-enabled                                 true \
	-mac                                     "00:01:01:01:02:00" \
	-incrementBy                             "00:00:00:00:00:01" \
	-netTraffic                              "Network1" \
	-_Stale                                  false \
	-mtu                                     1500 

set VLAN_R1 [$IP_R1 getLowerRelatedRange "VlanIdRange"]

$VLAN_R1 config \
	-incrementStep                           1 \
	-innerIncrement                          1 \
	-uniqueCount                             4094 \
	-increment                               1 \
	-tpid                                    "0x8100" \
	-idIncrMode                              2 \
	-enabled                                 false \
	-innerFirstId                            1 \
	-innerIncrementStep                      1 \
	-priority                                1 \
	-netTraffic                              "Network1" \
	-_Stale                                  false \
	-firstId                                 1 \
	-innerTpid                               "0x8100" \
	-innerUniqueCount                        4094 \
	-innerEnable                             false \
	-innerPriority                           1 

#################################################
# Creating the IP Distribution Groups
#################################################
$IP_1 rangeGroups.clear


set DistGroup1 [::IxLoad new ixNetRangeGroup]
# ixNet objects needs to be added in the list before they are configured!
$IP_1 rangeGroups.appendItem -object $DistGroup1

$DistGroup1 rangeList.clear

$DistGroup1 rangeList.appendItem -object $IP_R1

$DistGroup1 config \
	-distribType                             0 \
	-_Stale                                  false \
	-name                                    "DistGroup1" 

$Traffic1_Network1 config \
	-enable                                  true \
	-tcpAccelerationAllowedFlag              true \
	-network                                 $Network1 

#################################################
# Activity HTTPClient1 of NetTraffic Traffic1@Network1
#################################################
set Activity_HTTPClient1 [$Traffic1_Network1 activityList.appendItem \
	-protocolAndType                         "HTTP Client" ]

#################################################
# Timeline1 for activities HTTPClient1
#################################################
set Timeline1 [::IxLoad new ixTimeline]
$Timeline1 config \
	-name                                    "Timeline1" \
	-offlineTime                             0 \
	-rampDownTime                            10 \
	-standbyTime                             0 \
	-rampDownValue                           0 \
	-iterations                              1 \
	-sustainTime                             ?TestTime? \
	-timelineType                            0 

$Activity_HTTPClient1 config \
	-enable                                  1 \
	-name                                    "HTTPClient1" \
	-userIpMapping                           "1:1" \
	-enableConstraint                        false \
	-constraintValue                         100 \
	-userObjectiveValue                      4 \
	-constraintType                          "SimulatedUserConstraint" \
	-userObjectiveType                       "throughputGbps" \
	-destinationIpMapping                    "Consecutive" \
	-timeline                                $Timeline1 

$Activity_HTTPClient1 agent.actionList.clear

set my_ixLoopBeginCommand [::IxLoad new ixLoopBeginCommand]
$my_ixLoopBeginCommand config \
	-commandType                             "LoopBeginCommand" \
	-LoopCount                               160 \
	-cmdName                                 "Loop Begin 2" 

$Activity_HTTPClient1 agent.actionList.appendItem -object $my_ixLoopBeginCommand

set my_ixHttpCommand [::IxLoad new ixHttpCommand]
$my_ixHttpCommand config \
	-profile                                 -1 \
	-enableDi                                0 \
	-namevalueargs                           "" \
	-destination                             "Traffic2_HTTPServer1:80" \
	-sendMD5ChkSumHeader                     0 \
	-cmdName                                 "Get 1" \
	-commandType                             "GET" \
	-abort                                   "None" \
	-arguments                               "" \
	-pageObject                              "/1024k.html" \
	-sendingChunkSize                        "None" 

$Activity_HTTPClient1 agent.actionList.appendItem -object $my_ixHttpCommand

set my_ixLoopEndCommand [::IxLoad new ixLoopEndCommand]
$my_ixLoopEndCommand config \
	-commandType                             "LoopEndCommand" \
	-cmdName                                 "Loop End 3" 

$Activity_HTTPClient1 agent.actionList.appendItem -object $my_ixLoopEndCommand

$Activity_HTTPClient1 agent.headerList.clear

set my_ixHttpHeaderString [::IxLoad new ixHttpHeaderString]
$my_ixHttpHeaderString config \
	-data                                    "Accept: */*" 

$Activity_HTTPClient1 agent.headerList.appendItem -object $my_ixHttpHeaderString

set my_ixHttpHeaderString1 [::IxLoad new ixHttpHeaderString]
$my_ixHttpHeaderString1 config \
	-data                                    "Accept-Language: en-us" 

$Activity_HTTPClient1 agent.headerList.appendItem -object $my_ixHttpHeaderString1

set my_ixHttpHeaderString2 [::IxLoad new ixHttpHeaderString]
$my_ixHttpHeaderString2 config \
	-data                                    "Accept-Encoding: gzip, deflate" 

$Activity_HTTPClient1 agent.headerList.appendItem -object $my_ixHttpHeaderString2

set my_ixHttpHeaderString3 [::IxLoad new ixHttpHeaderString]
$my_ixHttpHeaderString3 config \
	-data                                    "User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.1.4322)" 

$Activity_HTTPClient1 agent.headerList.appendItem -object $my_ixHttpHeaderString3

$Activity_HTTPClient1 agent.profileList.clear

$Activity_HTTPClient1 agent.config \
	-cmdListLoops                            0 \
	-vlanPriority                            0 \
	-enableDecompressSupport                 0 \
	-exactTransactions                       0 \
	-enableHttpsProxy                        0 \
	-perHeaderPercentDist                    0 \
	-enableSsl                               0 \
	-enablePerConnCookieSupport              0 \
	-enableUnidirectionalClose               0 \
	-httpsTunnel                             "0.0.0.0" \
	-piggybackAck                            1 \
	-maxPersistentRequests                   0 \
	-enableEsm                               true \
	-certificate                             "" \
	-sequentialSessionReuse                  0 \
	-browserEmulationName                    "Custom1" \
	-enableSslSendCloseNotify                0 \
	-maxPipeline                             1 \
	-maxHeaderLen                            1024 \
	-maxSessions                             20 \
	-enableHttpProxy                         0 \
	-disableDnsResolutionCache               0 \
	-enableTos                               0 \
	-cookieRejectProbability                 0.0 \
	-ipPreference                            2 \
	-flowPercentage                          100.0 \
	-cookieJarSize                           10 \
	-sslRecordSize                           "16384" \
	-privateKey                              "" \
	-commandTimeout                          600 \
	-enablemetaRedirectSupport               0 \
	-enableIntegrityCheckSupport             0 \
	-commandTimeout_ms                       0 \
	-privateKeyPassword                      "" \
	-urlStatsCount                           10 \
	-followHttpRedirects                     0 \
	-tcpCloseOption                          0 \
	-enableVlanPriority                      0 \
	-esm                                     ?FrameResult? \
	-httpVersion                             0 \
	-enablesslRecordSize                     0 \
	-enableHttpsTunnel                       0 \
	-sslVersion                              3 \
	-enableLargeHeader                       0 \
	-enableCookieSupport                     0 \
	-enableConsecutiveIpsPerSession          0 \
	-clientCiphers                           "DEFAULT" \
	-enableAchieveCCFirst                    0 \
	-tos                                     0 \
	-httpProxy                               "0.0.0.0" \
	-keepAlive                               true \
	-enableCRCCheckSupport                   0 \
	-httpsProxy                              "0.0.0.0" 

$Activity_HTTPClient1 agent.cmdPercentagePool.percentageCommandList.clear

$Activity_HTTPClient1 agent.cmdPercentagePool.config \
	-seed                                    1 

$Traffic1_Network1 traffic.config \
	-name                                    "Traffic1" 

$Traffic1_Network1 setPortOperationModeAllowed $::ixPort(kOperationModeThroughputAcceleration) false
$Traffic1_Network1 setPortOperationModeAllowed $::ixPort(kOperationModeFCoEOffload) true
$Traffic1_Network1 setTcpAccelerationAllowed $::ixAgent(kTcpAcceleration) true
$Originate elementList.appendItem -object $Traffic1_Network1

$Originate config \
	-name                                    "Originate" 

$Scenario1 columnList.appendItem -object $Originate

set DUT [::IxLoad new ixTrafficColumn]
$DUT elementList.clear

$DUT config \
	-name                                    "DUT" 

$Scenario1 columnList.appendItem -object $DUT

set Terminate [::IxLoad new ixTrafficColumn]
$Terminate elementList.clear

#################################################
# Create ScenarioElement kNetTraffic
#################################################
set Traffic2_Network2 [$scenarioElementFactory create $::ixScenarioElementType(kNetTraffic)]

#################################################
# Network Network2 of NetTraffic Traffic2@Network2
#################################################
set Network2 [$Traffic2_Network2 cget -network]
$Network2 portList.appendItem \
	-chassisId 1 \
	-cardId 2 \
	-portId 1
?Agregation_Resources?
$Network2 portList.appendItem \
	-chassisId 1 \
	-cardId 2 \
	-portId 2

$Network2 portList.appendItem \
	-chassisId 1 \
	-cardId 2 \
	-portId 3

$Network2 portList.appendItem \
	-chassisId 1 \
	-cardId 2 \
	-portId 4

$Network2 portList.appendItem \
	-chassisId 1 \
	-cardId 2 \
	-portId 5

$Network2 portList.appendItem \
	-chassisId 1 \
	-cardId 2 \
	-portId 6

$Network2 portList.appendItem \
	-chassisId 1 \
	-cardId 2 \
	-portId 7

$Network2 portList.appendItem \
	-chassisId 1 \
	-cardId 2 \
	-portId 8

$Network2 portList.appendItem \
	-chassisId 1 \
	-cardId 2 \
	-portId 9

$Network2 portList.appendItem \
	-chassisId 1 \
	-cardId 2 \
	-portId 10

$Network2 portList.appendItem \
	-chassisId 1 \
	-cardId 2 \
	-portId 11

$Network2 portList.appendItem \
	-chassisId 1 \
	-cardId 2 \
	-portId 12

$Network2 globalPlugins.clear


set Settings_2 [::IxLoad new ixNetIxLoadSettingsPlugin]
# ixNet objects needs to be added in the list before they are configured!
$Network2 globalPlugins.appendItem -object $Settings_2

$Settings_2 config \
	-teardownInterfaceWithUser               false \
	-_Stale                                  false \
	-interfaceBehavior                       0 

set Filter_2 [::IxLoad new ixNetFilterPlugin]
# ixNet objects needs to be added in the list before they are configured!
$Network2 globalPlugins.appendItem -object $Filter_2

$Filter_2 config \
	-all                                     false \
	-pppoecontrol                            false \
	-isis                                    false \
	-auto                                    true \
	-udp                                     "" \
	-tcp                                     "" \
	-mac                                     "" \
	-_Stale                                  false \
	-pppoenetwork                            false \
	-ip                                      "" \
	-icmp                                    "" 

set GratARP_2 [::IxLoad new ixNetGratArpPlugin]
# ixNet objects needs to be added in the list before they are configured!
$Network2 globalPlugins.appendItem -object $GratARP_2

$GratARP_2 config \
	-forwardGratArp                          false \
	-enabled                                 true \
	-maxFramesPerSecond                      0 \
	-_Stale                                  false \
	-rateControlEnabled                      false 

set TCP_2 [::IxLoad new ixNetTCPPlugin]
# ixNet objects needs to be added in the list before they are configured!
$Network2 globalPlugins.appendItem -object $TCP_2

$TCP_2 config \
	-tcp_bic                                 0 \
	-tcp_tw_recycle                          true \
	-tcp_retries2                            5 \
	-disable_min_max_buffer_size             true \
	-tcp_retries1                            3 \
	-tcp_keepalive_time                      7200 \
	-tcp_rfc1337                             false \
	-tcp_ipfrag_time                         30 \
	-tcp_rto_max                             120000 \
	-tcp_window_scaling                      false \
	-delayed_acks                            true \
	-udp_port_randomization                  false \
	-tcp_vegas_alpha                         2 \
	-tcp_vegas_beta                          6 \
	-tcp_wmem_max                            262144 \
	-tcp_ecn                                 false \
	-tcp_westwood                            0 \
	-tcp_rto_min                             200 \
	-delayed_acks_segments                   0 \
	-inter_packet_delay                      0 \
	-tcp_vegas_cong_avoid                    0 \
	-tcp_keepalive_intvl                     75 \
	-tcp_rmem_max                            262144 \
	-tcp_orphan_retries                      0 \
	-bestPerfSettings                        false \
	-tcp_max_tw_buckets                      180000 \
	-_Stale                                  false \
	-tcp_low_latency                         0 \
	-tcp_rmem_min                            4096 \
	-accept_ra_all                           false \
	-tcp_adv_win_scale                       2 \
	-tcp_wmem_default                        32768 \
	-tcp_wmem_min                            4096 \
	-tcp_port_min                            1024 \
	-tcp_stdurg                              false \
	-tcp_port_max                            65535 \
	-tcp_fin_timeout                         60 \
	-tcp_no_metrics_save                     false \
	-tcp_dsack                               true \
	-tcp_abort_on_overflow                   false \
	-tcp_frto                                0 \
	-tcp_mem_pressure                        32768 \
	-tcp_app_win                             31 \
	-ip_no_pmtu_disc                         true \
	-llm_hdr_gap                             8 \
	-tcp_max_orphans                         8192 \
	-accept_ra_default                       false \
	-tcp_syn_retries                         5 \
	-tcp_moderate_rcvbuf                     0 \
	-tcp_max_syn_backlog                     1024 \
	-tcp_mem_low                             24576 \
	-tcp_tw_rfc1323_strict                   false \
	-tcp_fack                                true \
	-tcp_retrans_collapse                    true \
	-llm_hdr_gap_ns                          10 \
	-tcp_rmem_default                        4096 \
	-tcp_keepalive_probes                    9 \
	-tcp_mem_high                            49152 \
	-tcp_tw_reuse                            false \
	-delayed_acks_timeout                    0 \
	-tcp_vegas_gamma                         2 \
	-tcp_synack_retries                      5 \
	-tcp_timestamps                          true \
	-tcp_reordering                          3 \
	-rps_needed                              false \
	-tcp_sack                                true \
	-tcp_bic_fast_convergence                1 \
	-tcp_bic_low_window                      14 

set DNS_2 [::IxLoad new ixNetDnsPlugin]
# ixNet objects needs to be added in the list before they are configured!
$Network2 globalPlugins.appendItem -object $DNS_2

$DNS_2 hostList.clear


$DNS_2 searchList.clear


$DNS_2 nameServerList.clear


$DNS_2 config \
	-domain                                  "" \
	-_Stale                                  false \
	-timeout                                 30 

$Network2 config \
	-comment                                 "" \
	-cpuAggregation                          false \
	-name                                    "Network2" \
	-lineSpeed                               "Default" \
	-aggregation                             2 

set Ethernet_2 [$Network2 getL1Plugin]

set my_ixNetDataCenterSettings1 [::IxLoad new ixNetDataCenterSettings]
$my_ixNetDataCenterSettings1 config \
	-dcSupported                             true \
	-dcEnabled                               false \
	-dcPfcPauseDelay                         1 \
	-_Stale                                  false \
	-dcMode                                  2 \
	-dcPfcPauseEnable                        false \
	-dcFlowControl                           0 

set my_ixNetEthernetELMPlugin1 [::IxLoad new ixNetEthernetELMPlugin]
$my_ixNetEthernetELMPlugin1 config \
	-negotiationType                         "master" \
	-_Stale                                  false \
	-negotiateMasterSlave                    true 

set my_ixNetDualPhyPlugin1 [::IxLoad new ixNetDualPhyPlugin]
$my_ixNetDualPhyPlugin1 config \
	-medium                                  "auto" \
	-_Stale                                  false 

$Ethernet_2 childrenList.clear


set MAC_VLAN_2 [::IxLoad new ixNetL2EthernetPlugin]
# ixNet objects needs to be added in the list before they are configured!
$Ethernet_2 childrenList.appendItem -object $MAC_VLAN_2

$MAC_VLAN_2 childrenList.clear


set IP_2 [::IxLoad new ixNetIpV4V6Plugin]
# ixNet objects needs to be added in the list before they are configured!
$MAC_VLAN_2 childrenList.appendItem -object $IP_2

$IP_2 childrenList.clear


$IP_2 extensionList.clear


$IP_2 config \
	-_Stale                                  false 

$MAC_VLAN_2 extensionList.clear


$MAC_VLAN_2 config \
	-_Stale                                  false 

$Ethernet_2 extensionList.clear


$Ethernet_2 config \
	-advertise10Full                         true \
	-directedAddress                         "01:80:C2:00:00:01" \
	-autoNegotiate                           true \
	-advertise100Half                        true \
	-advertise10Half                         true \
	-enableFlowControl                       false \
	-_Stale                                  false \
	-speed                                   "k100FD" \
	-advertise1000Full                       true \
	-advertise100Full                        true \
	-dataCenter                              $my_ixNetDataCenterSettings1 \
	-cardElm                                 $my_ixNetEthernetELMPlugin1 \
	-cardDualPhy                             $my_ixNetDualPhyPlugin1 

#################################################
# Setting the ranges starting with the plugins that need to be script gen first
#################################################
$IP_2 rangeList.clear

set IP_R2 [::IxLoad new ixNetIpV4V6Range]
# ixNet objects needs to be added in the list before they are configured.
$IP_2 rangeList.appendItem -object $IP_R2

$IP_R2 config \
	-count                                   4 \
	-enableGatewayArp                        false \
	-prefix                                  16 \
	-randomizeSeed                           3893034837 \
	-generateStatistics                      false \
	-autoCountEnabled                        false \
	-enabled                                 true \
	-autoMacGeneration                       false \
	-publishStats                            false \
	-incrementBy                             "0.0.0.1" \
	-netTraffic                              "Network2" \
	-_Stale                                  false \
	-gatewayIncrement                        "0.0.0.0" \
	-gatewayIncrementMode                    "perSubnet" \
	-mss                                     1460 \
	-randomizeAddress                        false \
	-gatewayAddress                          ?GatewayServer? \
	-ipAddress                               ?IPAdressServer? \
	-ipType                                  "IPv4" 

set MAC_R2 [$IP_R2 getLowerRelatedRange "MacRange"]

$MAC_R2 config \
	-count                                   4 \
	-enabled                                 true \
	-mac                                     "60:48:07:A3:0C:00" \
	-incrementBy                             "00:00:00:00:00:06" \
	-netTraffic                              "Network2" \
	-_Stale                                  false \
	-mtu                                     1500 

set VLAN_R2 [$IP_R2 getLowerRelatedRange "VlanIdRange"]

$VLAN_R2 config \
	-incrementStep                           1 \
	-innerIncrement                          1 \
	-uniqueCount                             4094 \
	-increment                               1 \
	-tpid                                    "0x8100" \
	-idIncrMode                              2 \
	-enabled                                 false \
	-innerFirstId                            1 \
	-innerIncrementStep                      1 \
	-priority                                1 \
	-netTraffic                              "Network2" \
	-_Stale                                  false \
	-firstId                                 1 \
	-innerTpid                               "0x8100" \
	-innerUniqueCount                        4094 \
	-innerEnable                             false \
	-innerPriority                           1 

#################################################
# Creating the IP Distribution Groups
#################################################
$IP_2 rangeGroups.clear


set DistGroup2 [::IxLoad new ixNetRangeGroup]
# ixNet objects needs to be added in the list before they are configured!
$IP_2 rangeGroups.appendItem -object $DistGroup2

$DistGroup2 rangeList.clear

$DistGroup2 rangeList.appendItem -object $IP_R2

$DistGroup2 config \
	-distribType                             0 \
	-_Stale                                  false \
	-name                                    "DistGroup1" 

$Traffic2_Network2 config \
	-enable                                  1 \
	-tcpAccelerationAllowedFlag              true \
	-network                                 $Network2 

#################################################
# Activity HTTPServer1 of NetTraffic Traffic2@Network2
#################################################
set Activity_HTTPServer1 [$Traffic2_Network2 activityList.appendItem \
	-protocolAndType                         "HTTP Server" ]

set _Match_Longest_ [::IxLoad new ixMatchLongestTimeline]

$Activity_HTTPServer1 config \
	-enable                                  1 \
	-name                                    "HTTPServer1" \
	-timeline                                $_Match_Longest_ 

$Activity_HTTPServer1 agent.webPageList.clear

set _200_OK [::IxLoad new ResponseHeader]
$_200_OK responseList.clear

$_200_OK config \
	-mimeType                                "text/plain" \
	-expirationMode                          0 \
	-code                                    "200" \
	-dateIncrementFor                        1 \
	-name                                    "200_OK" \
	-lastModifiedMode                        1 \
	-lastModifiedIncrementEnable             false \
	-dateIncrementEnable                     false \
	-lastModifiedDateTimeValue               "2013/11/22 06:02:58" \
	-lastModifiedIncrementFor                1 \
	-expirationAfterLastModifiedValue        3600 \
	-dateTimeValue                           "2013/11/22 06:02:58" \
	-dateZone                                "GMT" \
	-dateMode                                2 \
	-expirationAfterRequestValue             3600 \
	-dateIncrementBy                         5 \
	-expirationDateTimeValue                 "2013/12/22 06:02:58" \
	-lastModifiedIncrementBy                 5 \
	-description                             "OK" 

set my_PageObject [::IxLoad new PageObject]
$my_PageObject config \
	-chunkSize                               "1" \
	-Md5Option                               3 \
	-payloadSize                             "1-1" \
	-customPayloadId                         -1 \
	-payloadType                             "range" \
	-payloadFile                             "<specify file>" \
	-page                                    "/1b.html" \
	-response                                $_200_OK 

$Activity_HTTPServer1 agent.webPageList.appendItem -object $my_PageObject

set my_PageObject1 [::IxLoad new PageObject]
$my_PageObject1 config \
	-chunkSize                               "512-1024" \
	-Md5Option                               3 \
	-payloadSize                             "4096-4096" \
	-customPayloadId                         -1 \
	-payloadType                             "range" \
	-payloadFile                             "<specify file>" \
	-page                                    "/4k.html" \
	-response                                $_200_OK 

$Activity_HTTPServer1 agent.webPageList.appendItem -object $my_PageObject1

set my_PageObject2 [::IxLoad new PageObject]
$my_PageObject2 config \
	-chunkSize                               "512-1024" \
	-Md5Option                               3 \
	-payloadSize                             "8192-8192" \
	-customPayloadId                         -1 \
	-payloadType                             "range" \
	-payloadFile                             "<specify file>" \
	-page                                    "/8k.html" \
	-response                                $_200_OK 

$Activity_HTTPServer1 agent.webPageList.appendItem -object $my_PageObject2

set my_PageObject3 [::IxLoad new PageObject]
$my_PageObject3 config \
	-chunkSize                               "512-1024" \
	-Md5Option                               3 \
	-payloadSize                             "16536-16536" \
	-customPayloadId                         -1 \
	-payloadType                             "range" \
	-payloadFile                             "<specify file>" \
	-page                                    "/16k.html" \
	-response                                $_200_OK 

$Activity_HTTPServer1 agent.webPageList.appendItem -object $my_PageObject3

set my_PageObject4 [::IxLoad new PageObject]
$my_PageObject4 config \
	-chunkSize                               "512-1024" \
	-Md5Option                               3 \
	-payloadSize                             "32768" \
	-customPayloadId                         -1 \
	-payloadType                             "range" \
	-payloadFile                             "<specify file>" \
	-page                                    "/32k.html" \
	-response                                $_200_OK 

$Activity_HTTPServer1 agent.webPageList.appendItem -object $my_PageObject4

set my_PageObject5 [::IxLoad new PageObject]
$my_PageObject5 config \
	-chunkSize                               "512-1024" \
	-Md5Option                               3 \
	-payloadSize                             "65536" \
	-customPayloadId                         -1 \
	-payloadType                             "range" \
	-payloadFile                             "<specify file>" \
	-page                                    "/64k.html" \
	-response                                $_200_OK 

$Activity_HTTPServer1 agent.webPageList.appendItem -object $my_PageObject5

set my_PageObject6 [::IxLoad new PageObject]
$my_PageObject6 config \
	-chunkSize                               "512-1024" \
	-Md5Option                               3 \
	-payloadSize                             "131072" \
	-customPayloadId                         -1 \
	-payloadType                             "range" \
	-payloadFile                             "<specify file>" \
	-page                                    "/128k.html" \
	-response                                $_200_OK 

$Activity_HTTPServer1 agent.webPageList.appendItem -object $my_PageObject6

set my_PageObject7 [::IxLoad new PageObject]
$my_PageObject7 config \
	-chunkSize                               "512-1024" \
	-Md5Option                               3 \
	-payloadSize                             "262144" \
	-customPayloadId                         -1 \
	-payloadType                             "range" \
	-payloadFile                             "<specify file>" \
	-page                                    "/256k.html" \
	-response                                $_200_OK 

$Activity_HTTPServer1 agent.webPageList.appendItem -object $my_PageObject7

set my_PageObject8 [::IxLoad new PageObject]
$my_PageObject8 config \
	-chunkSize                               "512-1024" \
	-Md5Option                               3 \
	-payloadSize                             "524288" \
	-customPayloadId                         -1 \
	-payloadType                             "range" \
	-payloadFile                             "<specify file>" \
	-page                                    "/512k.html" \
	-response                                $_200_OK 

$Activity_HTTPServer1 agent.webPageList.appendItem -object $my_PageObject8

set _201 [::IxLoad new ResponseHeader]
$_201 responseList.clear

$_201 config \
	-mimeType                                "text/plain" \
	-expirationMode                          0 \
	-code                                    "200" \
	-dateIncrementFor                        1 \
	-name                                    "200_OK" \
	-lastModifiedMode                        1 \
	-lastModifiedIncrementEnable             false \
	-dateIncrementEnable                     false \
	-lastModifiedDateTimeValue               "2013/11/22 06:02:58" \
	-lastModifiedIncrementFor                1 \
	-expirationAfterLastModifiedValue        3600 \
	-dateTimeValue                           "2013/11/22 06:02:58" \
	-dateZone                                "GMT" \
	-dateMode                                2 \
	-expirationAfterRequestValue             3600 \
	-dateIncrementBy                         5 \
	-expirationDateTimeValue                 "2013/12/22 06:02:58" \
	-lastModifiedIncrementBy                 5 \
	-description                             "OK" 

set my_PageObject9 [::IxLoad new PageObject]
$my_PageObject9 config \
	-chunkSize                               "512-1024" \
	-Md5Option                               3 \
	-payloadSize                             "1048576" \
	-customPayloadId                         -1 \
	-payloadType                             "range" \
	-payloadFile                             "<specify file>" \
	-page                                    "/1024k.html" \
	-response                                $_201 

$Activity_HTTPServer1 agent.webPageList.appendItem -object $my_PageObject9

set _202 [::IxLoad new ResponseHeader]
$_202 responseList.clear

$_202 config \
	-mimeType                                "text/plain" \
	-expirationMode                          0 \
	-code                                    "200" \
	-dateIncrementFor                        1 \
	-name                                    "200_OK" \
	-lastModifiedMode                        1 \
	-lastModifiedIncrementEnable             false \
	-dateIncrementEnable                     false \
	-lastModifiedDateTimeValue               "2013/11/25 09:43:53" \
	-lastModifiedIncrementFor                1 \
	-expirationAfterLastModifiedValue        3600 \
	-dateTimeValue                           "2013/11/25 09:43:53" \
	-dateZone                                "GMT" \
	-dateMode                                2 \
	-expirationAfterRequestValue             3600 \
	-dateIncrementBy                         5 \
	-expirationDateTimeValue                 "2013/12/25 09:43:53" \
	-lastModifiedIncrementBy                 5 \
	-description                             "OK" 

set my_PageObject10 [::IxLoad new PageObject]
$my_PageObject10 config \
	-chunkSize                               "512-1024" \
	-Md5Option                               3 \
	-payloadSize                             "2147483647" \
	-customPayloadId                         -1 \
	-payloadType                             "range" \
	-payloadFile                             "<specify file>" \
	-page                                    "/newPage1.html" \
	-response                                $_202 

$Activity_HTTPServer1 agent.webPageList.appendItem -object $my_PageObject10

$Activity_HTTPServer1 agent.cookieList.clear

set UserCookie [::IxLoad new CookieObject]
$UserCookie cookieContentList.clear

set firstName [::IxLoad new ixCookieContent]
$firstName config \
	-domain                                  "" \
	-name                                    "firstName" \
	-maxAge                                  "" \
	-value                                   "Joe" \
	-other                                   "" \
	-path                                    "" 

$UserCookie cookieContentList.appendItem -object $firstName

set lastName [::IxLoad new ixCookieContent]
$lastName config \
	-domain                                  "" \
	-name                                    "lastName" \
	-maxAge                                  "" \
	-value                                   "Smith" \
	-other                                   "" \
	-path                                    "" 

$UserCookie cookieContentList.appendItem -object $lastName

$UserCookie config \
	-mode                                    3 \
	-type                                    2 \
	-name                                    "UserCookie" \
	-description                             "Name of User" 

$Activity_HTTPServer1 agent.cookieList.appendItem -object $UserCookie

set LoginCookie [::IxLoad new CookieObject]
$LoginCookie cookieContentList.clear

set name [::IxLoad new ixCookieContent]
$name config \
	-domain                                  "" \
	-name                                    "name" \
	-maxAge                                  "" \
	-value                                   "joesmith" \
	-other                                   "" \
	-path                                    "" 

$LoginCookie cookieContentList.appendItem -object $name

set password [::IxLoad new ixCookieContent]
$password config \
	-domain                                  "" \
	-name                                    "password" \
	-maxAge                                  "" \
	-value                                   "foobar" \
	-other                                   "" \
	-path                                    "" 

$LoginCookie cookieContentList.appendItem -object $password

$LoginCookie config \
	-mode                                    2 \
	-type                                    2 \
	-name                                    "LoginCookie" \
	-description                             "Login name and password" 

$Activity_HTTPServer1 agent.cookieList.appendItem -object $LoginCookie

$Activity_HTTPServer1 agent.customPayloadList.clear

set AsciiCustomPayload [::IxLoad new CustomPayloadObject]
$AsciiCustomPayload config \
	-repeat                                  0 \
	-name                                    "AsciiCustomPayload" \
	-asciiPayloadValue                       "Ixia-Ixload-Http-Server-Custom-Payload" \
	-payloadmode                             0 \
	-offset                                  1 \
	-hexPayloadValue                         "" \
	-payloadPosition                         "Start With" \
	-id                                      0 

$Activity_HTTPServer1 agent.customPayloadList.appendItem -object $AsciiCustomPayload

set HexCustomPayload [::IxLoad new CustomPayloadObject]
$HexCustomPayload config \
	-repeat                                  0 \
	-name                                    "HexCustomPayload" \
	-asciiPayloadValue                       "" \
	-payloadmode                             1 \
	-offset                                  1 \
	-hexPayloadValue                         "49 78 69 61 2d 49 78 6c 6f 61 64 2d 48 74 74 70 2d 53 65 72 76 65 72 2d 43 75 73 74 6f 6d 2d 50 61 79 6c 6f 61 64" \
	-payloadPosition                         "Start With" \
	-id                                      1 

$Activity_HTTPServer1 agent.customPayloadList.appendItem -object $HexCustomPayload

$Activity_HTTPServer1 agent.responseHeaderList.clear

$Activity_HTTPServer1 agent.responseHeaderList.appendItem -object $_201

set _404_PageNotFound [::IxLoad new ResponseHeader]
$_404_PageNotFound responseList.clear

$_404_PageNotFound config \
	-mimeType                                "text/plain" \
	-expirationMode                          0 \
	-code                                    404 \
	-dateIncrementFor                        1 \
	-name                                    "404_PageNotFound" \
	-lastModifiedMode                        1 \
	-lastModifiedIncrementEnable             false \
	-dateIncrementEnable                     false \
	-lastModifiedDateTimeValue               "2013/11/22 06:02:58" \
	-lastModifiedIncrementFor                1 \
	-expirationAfterLastModifiedValue        3600 \
	-dateTimeValue                           "2013/11/22 06:02:58" \
	-dateZone                                "GMT" \
	-dateMode                                2 \
	-expirationAfterRequestValue             3600 \
	-dateIncrementBy                         5 \
	-expirationDateTimeValue                 "2013/12/22 06:02:58" \
	-lastModifiedIncrementBy                 5 \
	-description                             "Page not found" 

$Activity_HTTPServer1 agent.responseHeaderList.appendItem -object $_404_PageNotFound

$Activity_HTTPServer1 agent.config \
	-cmdListLoops                            0 \
	-vlanPriority                            0 \
	-maxResponseDelay                        0 \
	-docrootChunkSize                        "512-1024" \
	-rstTimeout                              100 \
	-enableChunkedRequest                    false \
	-enableEsm                               true \
	-certificate                             "" \
	-enableNewSslSupport                     false \
	-tos                                     0 \
	-enableSslSendCloseNotify                0 \
	-enableMD5Checksum                       false \
	-httpPort                                "80" \
	-httpsPort                               "443" \
	-esm                                     ?FrameResult? \
	-enableTos                               0 \
	-integrityCheckOption                    "Custom MD5" \
	-flowPercentage                          100.0 \
	-enableChunkEncoding                     false \
	-sslRecordSize                           "16384" \
	-privateKey                              "" \
	-privateKeyPassword                      "" \
	-urlStatsCount                           10 \
	-tcpCloseOption                          0 \
	-enableVlanPriority                      0 \
	-enableIntegrityCheck                    0 \
	-docrootfile                             "" \
	-enablesslRecordSize                     0 \
	-dhParams                                "" \
	-requestTimeout                          300 \
	-ServerCiphers                           "DEFAULT" \
	-enableDHsupport                         0 \
	-enablePerServerPerURLstat               0 \
	-urlPageSize                             1024 \
	-acceptSslConnections                    0 \
	-minResponseDelay                        0 

$Traffic2_Network2 traffic.config \
	-name                                    "Traffic2" 

$Traffic2_Network2 setPortOperationModeAllowed $::ixPort(kOperationModeThroughputAcceleration) false
$Traffic2_Network2 setPortOperationModeAllowed $::ixPort(kOperationModeFCoEOffload) true
$Traffic2_Network2 setTcpAccelerationAllowed $::ixAgent(kTcpAcceleration) true
$Terminate elementList.appendItem -object $Traffic2_Network2

$Terminate config \
	-name                                    "Terminate" 

$Scenario1 columnList.appendItem -object $Terminate

$Scenario1 links.clear

$Scenario1 config \
	-name                                    "Scenario1" 



$Test1 config \
	-comment                                 "" \
	-csvInterval                             2 \
	-networkFailureThreshold                 0 \
	-name                                    "Test1" \
	-statsRequired                           true \
	-enableResetPorts                        false \
	-statViewThroughputUnits                 "Kbps" \
	-csvThroughputScalingFactor              1000 \
	-enableForceOwnership                    false \
	-enableReleaseConfigAfterRun             false \
	-activitiesGroupedByObjective            false \
	-enableNetworkDiagnostics                false \
	-enableFrameSizeDistributionStats        false \
	-allowMixedObjectiveTypes                false \
	-currentUniqueIDForAgent                 16 \
	-enableTcpAdvancedStats                  false \
	-eventHandlerSettings                    $my_ixEventHandlerSettings \
	-captureViewOptions                      $my_ixViewOptions 

#################################################
# Destination HTTPServer1 for HTTPClient1
#################################################
set destination [$Traffic1_Network1 getDestinationForActivity "HTTPClient1" "Traffic2_HTTPServer1"]
$destination config \
	-portMapPolicy                           "portPairs" 

#################################################
# Profile Directory
#################################################
set profileDirectory [$Test1 cget -profileDirectory]

#################################################
# Session Specific Settings
#################################################
set my_ixNetMacSessionData [$Test1 getSessionSpecificData "L2EthernetPlugin"]
$my_ixNetMacSessionData config \
	-_Stale                                  false \
	-duplicateCheckingScope                  2 

set my_ixNetIpSessionData [$Test1 getSessionSpecificData "IpV4V6Plugin"]
$my_ixNetIpSessionData config \
	-enableGatewayArp                        false \
	-ignoreUnresolvedIPs                     false \
	-individualARPTimeOut                    500 \
	-maxOutstandingGatewayArpRequests        300 \
	-_Stale                                  false \
	-sendAllRequests                         false \
	-gatewayArpRequestRate                   300 \
	-duplicateCheckingScope                  2 

#################################################
# Create the test controller to run the test
#################################################
set testController [::IxLoad new ixTestController -outputDir True]

$testController setResultDir "?ResultDir?"

set NS statCollectorUtils

set test_server_handle [$testController getTestServerHandle]
${NS}::Initialize -testServerHandle $test_server_handle

${NS}::ClearStats
$Test1 clearGridStats

set HTTP_Server_Per_URL_StatList { \
	{"HTTP Server Per URL" "HTTP Requests Received" "kSum"} \
	{"HTTP Server Per URL" "HTTP Requests Successful" "kSum"} \
	{"HTTP Server Per URL" "HTTP Requests Failed (404)" "kSum"} \
	{"HTTP Server Per URL" "HTTP Requests Failed (50x)" "kSum"} \
	{"HTTP Server Per URL" "HTTP Requests Failed (Write Error)" "kSum"} \
	{"HTTP Server Per URL" "HTTP Responses Sent" "kSum"} \
	{"HTTP Server Per URL" "HTTP Responses Sent (1xx)" "kSum"} \
	{"HTTP Server Per URL" "HTTP Responses Sent (2xx)" "kSum"} \
	{"HTTP Server Per URL" "HTTP Responses Sent (3xx)" "kSum"} \
	{"HTTP Server Per URL" "HTTP Responses Sent (4xx)" "kSum"} \
	{"HTTP Server Per URL" "HTTP Responses Sent (5xx)" "kSum"} \
	{"HTTP Server Per URL" "HTTP Responses Sent (Other)" "kSum"} \
	{"HTTP Server Per URL" "HTTP Responses Failed (Write Error)" "kSum"} \
	{"HTTP Server Per URL" "HTTP Responses Failed (Aborted)" "kSum"} \
	{"HTTP Server Per URL" "HTTP Responses Failed (Other)" "kSum"} \
	{"HTTP Server Per URL" "HTTP Chunk Encoded Responses Sent" "kSum"} \
	{"HTTP Server Per URL" "HTTP Total Chunks Sent" "kSum"} \
	{"HTTP Server Per URL" "HTTP Average Chunk Size" "kWeightedAverage"} \
	{"HTTP Server Per URL" "HTTP Average Chunks per Response" "kWeightedAverage"} \
	{"HTTP Server Per URL" "HTTP Chunk Encoded Requests Received" "kSum"} \
	{"HTTP Server Per URL" "HTTP Total Chunks Received" "kSum"} \
	{"HTTP Server Per URL" "HTTP Average Received Chunk Size" "kWeightedAverage"} \
	{"HTTP Server Per URL" "HTTP Average Chunks per Request" "kWeightedAverage"} \
	{"HTTP Server Per URL" "HTTP Content-MD5 Requests Received" "kSum"} \
	{"HTTP Server Per URL" "HTTP Content-MD5 Check Successful" "kSum"} \
	{"HTTP Server Per URL" "HTTP Content-MD5 Check Failed" "kSum"} \
	{"HTTP Server Per URL" "HTTP OPTIONS Request Received" "kSum"} \
	{"HTTP Server Per URL" "HTTP OPTIONS Response Sent" "kSum"} \
}



set HTTP_Server_StatList { \
	{"HTTP Server" "HTTP Requests Received" "kSum"} \
	{"HTTP Server" "HTTP Requests Successful" "kSum"} \
	{"HTTP Server" "HTTP Requests Failed" "kSum"} \
	{"HTTP Server" "HTTP Requests Failed (404)" "kSum"} \
	{"HTTP Server" "HTTP Requests Failed (50x)" "kSum"} \
	{"HTTP Server" "HTTP Requests Failed (Write Error)" "kSum"} \
	{"HTTP Server" "HTTP Requests Failed (Aborted)" "kSum"} \
	{"HTTP Server" "HTTP Sessions Rejected (503)" "kSum"} \
	{"HTTP Server" "HTTP Session Timeouts (408)" "kSum"} \
	{"HTTP Server" "HTTP Responses Sent (1xx)" "kSum"} \
	{"HTTP Server" "HTTP Responses Sent (2xx)" "kSum"} \
	{"HTTP Server" "HTTP Responses Sent (3xx)" "kSum"} \
	{"HTTP Server" "HTTP Responses Sent (4xx)" "kSum"} \
	{"HTTP Server" "HTTP Responses Sent (5xx)" "kSum"} \
	{"HTTP Server" "HTTP Responses Sent (Other)" "kSum"} \
	{"HTTP Server" "HTTP Bytes Received" "kSum"} \
	{"HTTP Server" "HTTP Bytes Sent" "kSum"} \
	{"HTTP Server" "HTTP Content Bytes Received" "kSum"} \
	{"HTTP Server" "HTTP Content Bytes Sent" "kSum"} \
	{"HTTP Server" "HTTP Cookies Received" "kSum"} \
	{"HTTP Server" "HTTP Cookies Sent" "kSum"} \
	{"HTTP Server" "HTTP Cookies Received With Matching ServerID" "kSum"} \
	{"HTTP Server" "HTTP Cookies Received With Non-matching ServerID" "kSum"} \
	{"HTTP Server" "HTTP Chunked Encoded Responses Sent" "kSum"} \
	{"HTTP Server" "HTTP Total Chunks Sent" "kSum"} \
	{"HTTP Server" "HTTP Chunked Transfer-Encoded Requests Received" "kSum"} \
	{"HTTP Server" "HTTP Total Chunks Received" "kSum"} \
	{"HTTP Server" "HTTP Content-MD5 Requests Received" "kSum"} \
	{"HTTP Server" "HTTP Content-MD5 Check Successful" "kSum"} \
	{"HTTP Server" "HTTP Content-MD5 Check Failed" "kSum"} \
	{"HTTP Server" "HTTP OPTIONS Request Received" "kSum"} \
	{"HTTP Server" "HTTP OPTIONS Response Sent" "kSum"} \
	{"HTTP Server" "SSL Alerts Received" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (close_notify)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (close_notify)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (unexpected_message)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (unexpected_message)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (bad_record_mac)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (bad_record_mac)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (decryption_failed)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (decryption_failed)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (record_overflow)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (record_overflow)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (decompression_failure)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (decompression_failure)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (handshake_failure)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (handshake_failure)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (no_certificate)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (no_certificate)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (bad_certificate)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (bad_certificate)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (unsupported_certificate)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (unsupported_certificate)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (certificate_revoked)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (certificate_revoked)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (certificate_expired)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (certificate_expired)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (certificate_unknown)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (certificate_unknown)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (illegal_parameter)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (illegal_parameter)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (unknown_ca)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (unknown_ca)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (access_denied)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (access_denied)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (decode_error)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (decode_error)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (decrypt_error)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (decrypt_error)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (export_restriction)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (export_restriction)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (protocol_version)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (protocol_version)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (insufficient_security)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (insufficient_security)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (internal_error)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (internal_error)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (user_canceled)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (user_canceled)" "kSum"} \
	{"HTTP Server" "SSL Alerts Received (no_renegotiation)" "kSum"} \
	{"HTTP Server" "SSL Alerts Sent (no_renegotiation)" "kSum"} \
	{"HTTP Server" "SSL Errors Received (undefined error)" "kSum"} \
	{"HTTP Server" "SSL Errors Sent (undefined error)" "kSum"} \
	{"HTTP Server" "SSL Errors Received (no cipher)" "kSum"} \
	{"HTTP Server" "SSL Errors Sent (no cipher)" "kSum"} \
	{"HTTP Server" "SSL Errors Received (no certificate)" "kSum"} \
	{"HTTP Server" "SSL Errors Sent (no certificate)" "kSum"} \
	{"HTTP Server" "SSL Errors Received (bad certificate)" "kSum"} \
	{"HTTP Server" "SSL Errors Sent (bad certificate)" "kSum"} \
	{"HTTP Server" "SSL Errors Received (unsupported certificate)" "kSum"} \
	{"HTTP Server" "SSL Errors Sent (unsupported certificate)" "kSum"} \
	{"HTTP Server" "SSL Errors Received" "kSum"} \
	{"HTTP Server" "SSL Errors Sent" "kSum"} \
	{"HTTP Server" "Client Hello Sent" "kSum"} \
	{"HTTP Server" "Client Hello Received" "kSum"} \
	{"HTTP Server" "Server Hello Sent" "kSum"} \
	{"HTTP Server" "Server Hello Received" "kSum"} \
	{"HTTP Server" "Hello Requests Sent" "kSum"} \
	{"HTTP Server" "Hello Requests Received" "kSum"} \
	{"HTTP Server" "SSL Session Reuse Success" "kSum"} \
	{"HTTP Server" "SSL Session Reuse Failed" "kSum"} \
	{"HTTP Server" "SSL Concurrent Sessions" "kSum"} \
	{"HTTP Server" "SSL Bytes Sent" "kSum"} \
	{"HTTP Server" "SSL Bytes Received" "kSum"} \
	{"HTTP Server" "SSL Throughput Bytes" "kSum"} \
	{"HTTP Server" "SSL Application Data Bytes" "kSum"} \
	{"HTTP Server" "SSL Negotiation Finished Successfully" "kSum"} \
	{"HTTP Server" "TCP SYN Sent" "kSum"} \
	{"HTTP Server" "TCP SYN_SYN-ACK Received" "kSum"} \
	{"HTTP Server" "TCP SYN Failed" "kSum"} \
	{"HTTP Server" "TCP SYN-ACK Sent" "kSum"} \
	{"HTTP Server" "TCP Connection Requests Failed" "kSum"} \
	{"HTTP Server" "TCP Connections Established" "kSum"} \
	{"HTTP Server" "TCP FIN Sent" "kSum"} \
	{"HTTP Server" "TCP FIN Received" "kSum"} \
	{"HTTP Server" "TCP FIN-ACK Sent" "kSum"} \
	{"HTTP Server" "TCP FIN-ACK Received" "kSum"} \
	{"HTTP Server" "TCP Resets Sent" "kSum"} \
	{"HTTP Server" "TCP Resets Received" "kSum"} \
	{"HTTP Server" "TCP Retries" "kSum"} \
	{"HTTP Server" "TCP Timeouts" "kSum"} \
	{"HTTP Server" "TCP Accept Queue Entries" "kSum"} \
	{"HTTP Server" "TCP Listen Queue Drops" "kSum"} \
	{"HTTP Server" "TCP Connections in ESTABLISHED State" "kSum"} \
	{"HTTP Server" "TCP Connections in SYN-SENT State" "kSum"} \
	{"HTTP Server" "TCP Connections in SYN-RECEIVED State" "kSum"} \
	{"HTTP Server" "TCP Connections in FIN-WAIT-1 State" "kSum"} \
	{"HTTP Server" "TCP Connections in FIN-WAIT-2 State" "kSum"} \
	{"HTTP Server" "TCP Connections in TIME-WAIT State" "kSum"} \
	{"HTTP Server" "TCP Connections in CLOSE STATE" "kSum"} \
	{"HTTP Server" "TCP Connections in CLOSE-WAIT State" "kSum"} \
	{"HTTP Server" "TCP Connections in LAST-ACK State" "kSum"} \
	{"HTTP Server" "TCP Connections in LISTENING State" "kSum"} \
	{"HTTP Server" "TCP Connections in CLOSING State" "kSum"} \
	{"HTTP Server" "TCP Internally Aborted Connections" "kSum"} \
}



set HTTP_Client_Per_URL_StatList { \
	{"HTTP Client Per URL" "HTTP Requests Sent" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Successful" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Failed" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Failed (Write)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Failed (Read)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Failed (Bad Header)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Failed (4xx)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Failed (400)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Failed (401)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Failed (403)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Failed (404)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Failed (407)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Failed (408)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Failed (4xx other)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Failed (5xx)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Failed (505)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Failed (5xx other)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Failed (other)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Failed (Timeout)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Failed (Aborted)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Aborted Before Request" "kSum"} \
	{"HTTP Client Per URL" "HTTP Aborted After Request" "kSum"} \
	{"HTTP Client Per URL" "HTTP Responses Received With Match" "kSum"} \
	{"HTTP Client Per URL" "HTTP Responses Received Without Match" "kSum"} \
	{"HTTP Client Per URL" "HTTP Intermediate Responses Received (1xx)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Successful (2xx)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Successful (3xx)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Successful (301)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Successful (302)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Successful (303)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Requests Successful (307)" "kSum"} \
	{"HTTP Client Per URL" "HTTP Content-MD5 Requests Sent" "kSum"} \
	{"HTTP Client Per URL" "HTTP Chunk Encoded Headers Received" "kSum"} \
	{"HTTP Client Per URL" "HTTP Chunk Encoded Responses Successful" "kSum"} \
	{"HTTP Client Per URL" "HTTP Chunk Encoded Responses Failed" "kSum"} \
	{"HTTP Client Per URL" "HTTP Total Chunks Received" "kSum"} \
	{"HTTP Client Per URL" "HTTP Average Chunk Size" "kWeightedAverage"} \
	{"HTTP Client Per URL" "HTTP Average Chunks per Response" "kWeightedAverage"} \
	{"HTTP Client Per URL" "HTTP Chunk Encoded Requests Sent" "kSum"} \
	{"HTTP Client Per URL" "HTTP Total Chunks Sent" "kSum"} \
	{"HTTP Client Per URL" "HTTP Average Chunk Size in Request" "kWeightedAverage"} \
	{"HTTP Client Per URL" "HTTP Average Chunks per Request" "kWeightedAverage"} \
	{"HTTP Client Per URL" "Name1-Value1" "kString"} \
	{"HTTP Client Per URL" "Counter1" "kSum"} \
	{"HTTP Client Per URL" "Name2-Value2" "kString"} \
	{"HTTP Client Per URL" "Counter2" "kSum"} \
	{"HTTP Client Per URL" "Name3-Value3" "kString"} \
	{"HTTP Client Per URL" "Counter3" "kSum"} \
	{"HTTP Client Per URL" "Name4-Value4" "kString"} \
	{"HTTP Client Per URL" "Counter4" "kSum"} \
	{"HTTP Client Per URL" "Name5-Value5" "kString"} \
	{"HTTP Client Per URL" "Counter5" "kSum"} \
	{"HTTP Client Per URL" "Name6-Value6" "kString"} \
	{"HTTP Client Per URL" "Counter6" "kSum"} \
	{"HTTP Client Per URL" "Name7-Value7" "kString"} \
	{"HTTP Client Per URL" "Counter7" "kSum"} \
	{"HTTP Client Per URL" "Name8-Value8" "kString"} \
	{"HTTP Client Per URL" "Counter8" "kSum"} \
	{"HTTP Client Per URL" "Name9-Value9" "kString"} \
	{"HTTP Client Per URL" "Counter9" "kSum"} \
	{"HTTP Client Per URL" "Name10-Value10" "kString"} \
	{"HTTP Client Per URL" "Counter10" "kSum"} \
	{"HTTP Client Per URL" "HTTP Gzip-Encoded Responses Received" "kSum"} \
	{"HTTP Client Per URL" "HTTP Gzip-Encoded Responses Successful" "kSum"} \
	{"HTTP Client Per URL" "HTTP Gzip-Encoded Responses Failed" "kSum"} \
	{"HTTP Client Per URL" "HTTP Deflate-Encoded Responses Received" "kSum"} \
	{"HTTP Client Per URL" "HTTP Deflate-Encoded Responses Successful" "kSum"} \
	{"HTTP Client Per URL" "HTTP Deflate-Encoded Responses Failed" "kSum"} \
	{"HTTP Client Per URL" "HTTP Content-MD5 Responses Received" "kSum"} \
	{"HTTP Client Per URL" "HTTP Content-MD5 Responses Successful" "kSum"} \
	{"HTTP Client Per URL" "HTTP Content-MD5 Responses Failed" "kSum"} \
	{"HTTP Client Per URL" "HTTP Custom MD5 Responses Received" "kSum"} \
	{"HTTP Client Per URL" "HTTP Custom MD5 Responses Successful" "kSum"} \
	{"HTTP Client Per URL" "HTTP Custom MD5 Responses Failed" "kSum"} \
	{"HTTP Client Per URL" "Average Compression Ratio" "kWeightedAverage"} \
}



set HTTP_Client_StatList { \
	{"HTTP Client" "HTTP Simulated Users" "kSum"} \
	{"HTTP Client" "HTTP Concurrent Connections" "kSum"} \
	{"HTTP Client" "HTTP Connections" "kSum"} \
	{"HTTP Client" "HTTP Connection Attempts" "kSum"} \
	{"HTTP Client" "HTTP Connection Aborts" "kSum"} \
	{"HTTP Client" "HTTP Old Session Aborts" "kSum"} \
	{"HTTP Client" "HTTP Transactions" "kSum"} \
	{"HTTP Client" "HTTP Bytes" "kSum"} \
	{"HTTP Client" "HTTP Requests Sent" "kSum"} \
	{"HTTP Client" "HTTP Requests Successful" "kSum"} \
	{"HTTP Client" "HTTP Intermediate Responses Received (1xx)" "kSum"} \
	{"HTTP Client" "HTTP Requests Successful (2xx)" "kSum"} \
	{"HTTP Client" "HTTP Requests Successful (3xx)" "kSum"} \
	{"HTTP Client" "HTTP Requests Successful (301)" "kSum"} \
	{"HTTP Client" "HTTP Requests Successful (302)" "kSum"} \
	{"HTTP Client" "HTTP Requests Successful (303)" "kSum"} \
	{"HTTP Client" "HTTP Requests Successful (307)" "kSum"} \
	{"HTTP Client" "HTTP Requests Failed" "kSum"} \
	{"HTTP Client" "HTTP Requests Failed (Write)" "kSum"} \
	{"HTTP Client" "HTTP Requests Failed (Read)" "kSum"} \
	{"HTTP Client" "HTTP Requests Failed (Bad Header)" "kSum"} \
	{"HTTP Client" "HTTP Requests Failed (4xx)" "kSum"} \
	{"HTTP Client" "HTTP Requests Failed (400)" "kSum"} \
	{"HTTP Client" "HTTP Requests Failed (401)" "kSum"} \
	{"HTTP Client" "HTTP Requests Failed (403)" "kSum"} \
	{"HTTP Client" "HTTP Requests Failed (404)" "kSum"} \
	{"HTTP Client" "HTTP Requests Failed (407)" "kSum"} \
	{"HTTP Client" "HTTP Requests Failed (408)" "kSum"} \
	{"HTTP Client" "HTTP Requests Failed (4xx other)" "kSum"} \
	{"HTTP Client" "HTTP Requests Failed (5xx)" "kSum"} \
	{"HTTP Client" "HTTP Requests Failed (505)" "kSum"} \
	{"HTTP Client" "HTTP Requests Failed (5xx other)" "kSum"} \
	{"HTTP Client" "HTTP Requests Failed (other)" "kSum"} \
	{"HTTP Client" "HTTP Requests Failed (Timeout)" "kSum"} \
	{"HTTP Client" "HTTP Requests Failed (Aborted)" "kSum"} \
	{"HTTP Client" "HTTP Session Timeouts (408)" "kSum"} \
	{"HTTP Client" "HTTP Request Precondition Failed (412)" "kSum"} \
	{"HTTP Client" "HTTP Sessions Rejected (503)" "kSum"} \
	{"HTTP Client" "HTTP Aborted Before Request" "kSum"} \
	{"HTTP Client" "HTTP Aborted After Request" "kSum"} \
	{"HTTP Client" "HTTP Transactions Active" "kSum"} \
	{"HTTP Client" "HTTP Users Active" "kSum"} \
	{"HTTP Client" "Content-Encoded Responses Received" "kSum"} \
	{"HTTP Client" "Gzip Content-Encoding Received" "kSum"} \
	{"HTTP Client" "Deflate Content-Encoding Received" "kSum"} \
	{"HTTP Client" "Unrecognized Content-Encoding Received" "kSum"} \
	{"HTTP Client" "Content-Encoded Responses Decode Successful" "kSum"} \
	{"HTTP Client" "Gzip Content-Encoding Decode Successful" "kSum"} \
	{"HTTP Client" "Deflate Content-Encoding Decode Successful" "kSum"} \
	{"HTTP Client" "Content-Encoded Responses Decode Failed" "kSum"} \
	{"HTTP Client" "Gzip Content-Encoding Decode Failed" "kSum"} \
	{"HTTP Client" "Deflate Content-Encoding Decode Failed" "kSum"} \
	{"HTTP Client" "Gzip Content-Encoding Decode Failed - Data Error" "kSum"} \
	{"HTTP Client" "Gzip Content-Encoding Decode Failed - Decoding Error" "kSum"} \
	{"HTTP Client" "Deflate Content-Encoding Decode Failed - Data Error" "kSum"} \
	{"HTTP Client" "Deflate Content-Encoding Decode Failed - Decoding Error" "kSum"} \
	{"HTTP Client" "Chunked Transfer-Encoded Headers Received" "kSum"} \
	{"HTTP Client" "Chunked Transfer-Encoding Decode Successful" "kSum"} \
	{"HTTP Client" "Chunked Transfer-Encoding Decode Failed" "kSum"} \
	{"HTTP Client" "Total Chunks Received" "kSum"} \
	{"HTTP Client" "Chunked Transfer-Encoding Headers Sent" "kSum"} \
	{"HTTP Client" "Total Chunks Sent" "kSum"} \
	{"HTTP Client" "Content-MD5 Responses Received" "kSum"} \
	{"HTTP Client" "Content-MD5 Check Successful" "kSum"} \
	{"HTTP Client" "Content-MD5 Check Failed" "kSum"} \
	{"HTTP Client" "Custom-MD5 Responses Received" "kSum"} \
	{"HTTP Client" "Custom-MD5 Check Successful" "kSum"} \
	{"HTTP Client" "Custom-MD5 Check Failed" "kSum"} \
	{"HTTP Client" "HTTP Bytes Sent" "kSum"} \
	{"HTTP Client" "HTTP Bytes Received" "kSum"} \
	{"HTTP Client" "HTTP Content Bytes Sent" "kSum"} \
	{"HTTP Client" "HTTP Content Bytes Received" "kSum"} \
	{"HTTP Client" "HTTP Decompressed Content Bytes Received" "kSum"} \
	{"HTTP Client" "HTTP Cookies Received" "kSum"} \
	{"HTTP Client" "HTTP Cookies Sent" "kSum"} \
	{"HTTP Client" "HTTP Cookies Rejected" "kSum"} \
	{"HTTP Client" "HTTP Cookies Rejected - (Path Match Failed)" "kSum"} \
	{"HTTP Client" "HTTP Cookies Rejected - (Domain Match Failed)" "kSum"} \
	{"HTTP Client" "HTTP Cookies Rejected - (Cookiejar Overflow)" "kSum"} \
	{"HTTP Client" "HTTP Cookies Rejected - (Probabilistic Reject)" "kSum"} \
	{"HTTP Client" "HTTP Cookie headers Rejected - (Memory Overflow)" "kSum"} \
	{"HTTP Client" "HTTP Connect Time (us)" "kWeightedAverage"} \
	{"HTTP Client" "HTTP Time To First Byte (us)" "kWeightedAverage"} \
	{"HTTP Client" "HTTP Time To Last Byte (us)" "kWeightedAverage"} \
	{"HTTP Client" "HTTP Old Session Abort Delay - Average (us)" "kWeightedAverage"} \
	{"HTTP Client" "HTTP Old Session Abort Delay - Minimum (us)" "kSum"} \
	{"HTTP Client" "HTTP Old Session Abort Delay - Maximum (us)" "kSum"} \
	{"HTTP Client" "HTTP Client Total Data Integrity Check Failed" "kSum"} \
	{"HTTP Client" "HTTP Client Total Data Integrity Check Succeeded" "kSum"} \
	{"HTTP Client" "SSL Alerts Received" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (close_notify)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (close_notify)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (unexpected_message)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (unexpected_message)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (bad_record_mac)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (bad_record_mac)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (decryption_failed)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (decryption_failed)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (record_overflow)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (record_overflow)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (decompression_failure)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (decompression_failure)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (handshake_failure)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (handshake_failure)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (no_certificate)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (no_certificate)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (bad_certificate)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (bad_certificate)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (unsupported_certificate)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (unsupported_certificate)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (certificate_revoked)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (certificate_revoked)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (certificate_expired)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (certificate_expired)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (certificate_unknown)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (certificate_unknown)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (illegal_parameter)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (illegal_parameter)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (unknown_ca)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (unknown_ca)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (access_denied)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (access_denied)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (decode_error)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (decode_error)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (decrypt_error)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (decrypt_error)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (export_restriction)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (export_restriction)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (protocol_version)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (protocol_version)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (insufficient_security)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (insufficient_security)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (internal_error)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (internal_error)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (user_canceled)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (user_canceled)" "kSum"} \
	{"HTTP Client" "SSL Alerts Received (no_renegotiation)" "kSum"} \
	{"HTTP Client" "SSL Alerts Sent (no_renegotiation)" "kSum"} \
	{"HTTP Client" "SSL Errors Received (undefined error)" "kSum"} \
	{"HTTP Client" "SSL Errors Sent (undefined error)" "kSum"} \
	{"HTTP Client" "SSL Errors Received (no cipher)" "kSum"} \
	{"HTTP Client" "SSL Errors Sent (no cipher)" "kSum"} \
	{"HTTP Client" "SSL Errors Received (no certificate)" "kSum"} \
	{"HTTP Client" "SSL Errors Sent (no certificate)" "kSum"} \
	{"HTTP Client" "SSL Errors Received (bad certificate)" "kSum"} \
	{"HTTP Client" "SSL Errors Sent (bad certificate)" "kSum"} \
	{"HTTP Client" "SSL Errors Received (unsupported certificate)" "kSum"} \
	{"HTTP Client" "SSL Errors Sent (unsupported certificate)" "kSum"} \
	{"HTTP Client" "SSL Errors Received" "kSum"} \
	{"HTTP Client" "SSL Errors Sent" "kSum"} \
	{"HTTP Client" "Client Hello Sent" "kSum"} \
	{"HTTP Client" "Client Hello Received" "kSum"} \
	{"HTTP Client" "Server Hello Sent" "kSum"} \
	{"HTTP Client" "Server Hello Received" "kSum"} \
	{"HTTP Client" "Hello Requests Sent" "kSum"} \
	{"HTTP Client" "Hello Requests Received" "kSum"} \
	{"HTTP Client" "SSL Session Reuse Success" "kSum"} \
	{"HTTP Client" "SSL Session Reuse Failed" "kSum"} \
	{"HTTP Client" "SSL Concurrent Sessions" "kSum"} \
	{"HTTP Client" "SSL Bytes Sent" "kSum"} \
	{"HTTP Client" "SSL Bytes Received" "kSum"} \
	{"HTTP Client" "SSL Throughput Bytes" "kSum"} \
	{"HTTP Client" "SSL Application Data Bytes" "kSum"} \
	{"HTTP Client" "SSL Negotiation Finished Successfully" "kSum"} \
	{"HTTP Client" "TCP SYN Sent" "kSum"} \
	{"HTTP Client" "TCP SYN_SYN-ACK Received" "kSum"} \
	{"HTTP Client" "TCP SYN Failed" "kSum"} \
	{"HTTP Client" "TCP SYN-ACK Sent" "kSum"} \
	{"HTTP Client" "TCP Connection Requests Failed" "kSum"} \
	{"HTTP Client" "TCP Connections Established" "kSum"} \
	{"HTTP Client" "TCP FIN Sent" "kSum"} \
	{"HTTP Client" "TCP FIN Received" "kSum"} \
	{"HTTP Client" "TCP FIN-ACK Sent" "kSum"} \
	{"HTTP Client" "TCP FIN-ACK Received" "kSum"} \
	{"HTTP Client" "TCP Resets Sent" "kSum"} \
	{"HTTP Client" "TCP Resets Received" "kSum"} \
	{"HTTP Client" "TCP Retries" "kSum"} \
	{"HTTP Client" "TCP Timeouts" "kSum"} \
	{"HTTP Client" "TCP Accept Queue Entries" "kSum"} \
	{"HTTP Client" "TCP Listen Queue Drops" "kSum"} \
	{"HTTP Client" "TCP Connections in ESTABLISHED State" "kSum"} \
	{"HTTP Client" "TCP Connections in SYN-SENT State" "kSum"} \
	{"HTTP Client" "TCP Connections in SYN-RECEIVED State" "kSum"} \
	{"HTTP Client" "TCP Connections in FIN-WAIT-1 State" "kSum"} \
	{"HTTP Client" "TCP Connections in FIN-WAIT-2 State" "kSum"} \
	{"HTTP Client" "TCP Connections in TIME-WAIT State" "kSum"} \
	{"HTTP Client" "TCP Connections in CLOSE STATE" "kSum"} \
	{"HTTP Client" "TCP Connections in CLOSE-WAIT State" "kSum"} \
	{"HTTP Client" "TCP Connections in LAST-ACK State" "kSum"} \
	{"HTTP Client" "TCP Connections in LISTENING State" "kSum"} \
	{"HTTP Client" "TCP Connections in CLOSING State" "kSum"} \
	{"HTTP Client" "TCP Internally Aborted Connections" "kSum"} \
}



set statList [concat \
	$HTTP_Server_Per_URL_StatList \
	$HTTP_Server_StatList \
	$HTTP_Client_Per_URL_StatList \
	$HTTP_Client_StatList \
]

set count 1
foreach stat $statList {
	set caption         [format "Watch_Stat_%s" $count]
	set statSourceType  [lindex $stat 0]
	set statName        [lindex $stat 1]
	set aggregationType [lindex $stat 2]

	${NS}::AddStat \
		-caption            $caption \
		-statSourceType     $statSourceType \
		-statName           $statName \
		-aggregationType    $aggregationType \
		-filterList         {}

	incr count
}

proc ::my_stat_collector_command {args} {
	puts "====================================="
	puts "INCOMING STAT RECORD >>> $args"
	puts "====================================="
}
${NS}::StartCollector -command ::my_stat_collector_command -interval 2

$testController run $Test1

vwait ::ixTestControllerMonitor
puts $::ixTestControllerMonitor

${NS}::StopCollector

#################################################
# Cleanup
#################################################
# Release config is only strictly necessary if enableReleaseConfigAfterRun is 0.
$testController releaseConfigWaitFinish
$Test1 clearDUTList

$Traffic1_Network1 removeAllPortsFromAnalyzer
$Traffic2_Network2 removeAllPortsFromAnalyzer
::IxLoad delete $chassisChain
::IxLoad delete $Test1
::IxLoad delete $my_ixEventHandlerSettings
::IxLoad delete $my_ixViewOptions
::IxLoad delete $Scenario1
::IxLoad delete $Originate
::IxLoad delete $Traffic1_Network1
::IxLoad delete $Network1
::IxLoad delete $Settings_1
::IxLoad delete $Filter_1
::IxLoad delete $GratARP_1
::IxLoad delete $TCP_1
::IxLoad delete $DNS_1
::IxLoad delete $Meshing_1
::IxLoad delete $HTTPClient1_Traffic2_HTTPServer1
::IxLoad delete $Ethernet_1
::IxLoad delete $my_ixNetDataCenterSettings
::IxLoad delete $my_ixNetEthernetELMPlugin
::IxLoad delete $my_ixNetDualPhyPlugin
::IxLoad delete $MAC_VLAN_1
::IxLoad delete $IP_1
::IxLoad delete $IP_R1
::IxLoad delete $MAC_R1
::IxLoad delete $VLAN_R1
::IxLoad delete $DistGroup1
::IxLoad delete $Activity_HTTPClient1
::IxLoad delete $Timeline1
::IxLoad delete $my_ixLoopBeginCommand
::IxLoad delete $my_ixHttpCommand
::IxLoad delete $my_ixLoopEndCommand
::IxLoad delete $my_ixHttpHeaderString
::IxLoad delete $my_ixHttpHeaderString1
::IxLoad delete $my_ixHttpHeaderString2
::IxLoad delete $my_ixHttpHeaderString3
::IxLoad delete $DUT
::IxLoad delete $Terminate
::IxLoad delete $Traffic2_Network2
::IxLoad delete $Network2
::IxLoad delete $Settings_2
::IxLoad delete $Filter_2
::IxLoad delete $GratARP_2
::IxLoad delete $TCP_2
::IxLoad delete $DNS_2
::IxLoad delete $Ethernet_2
::IxLoad delete $my_ixNetDataCenterSettings1
::IxLoad delete $my_ixNetEthernetELMPlugin1
::IxLoad delete $my_ixNetDualPhyPlugin1
::IxLoad delete $MAC_VLAN_2
::IxLoad delete $IP_2
::IxLoad delete $IP_R2
::IxLoad delete $MAC_R2
::IxLoad delete $VLAN_R2
::IxLoad delete $DistGroup2
::IxLoad delete $Activity_HTTPServer1
::IxLoad delete $_Match_Longest_
::IxLoad delete $my_PageObject
::IxLoad delete $_200_OK
::IxLoad delete $my_PageObject1
::IxLoad delete $my_PageObject2
::IxLoad delete $my_PageObject3
::IxLoad delete $my_PageObject4
::IxLoad delete $my_PageObject5
::IxLoad delete $my_PageObject6
::IxLoad delete $my_PageObject7
::IxLoad delete $my_PageObject8
::IxLoad delete $my_PageObject9
::IxLoad delete $_201
::IxLoad delete $my_PageObject10
::IxLoad delete $_202
::IxLoad delete $UserCookie
::IxLoad delete $firstName
::IxLoad delete $lastName
::IxLoad delete $LoginCookie
::IxLoad delete $name
::IxLoad delete $password
::IxLoad delete $AsciiCustomPayload
::IxLoad delete $HexCustomPayload
::IxLoad delete $_404_PageNotFound
::IxLoad delete $destination
::IxLoad delete $my_ixNetMacSessionData
::IxLoad delete $my_ixNetIpSessionData
::IxLoad delete $testController

#################################################
# Disconnect / Release application lock
#################################################
}] {
	$logger error $errorInfo
	puts $errorInfo
}

::IxLoad disconnect
