//
//  Battery.swift
//  BatteryBar
//
//  Created by Yiheng Quan on 24/7/19.
//  Copyright © 2019 Yiheng Quan. All rights reserved.
//

import Cocoa

class Battery {

    /// Get time remaining for this machine
    /// Returns a string like 2:12 remaning
    func updateTimeRemaining() -> String {
        var remain = Constant.Estimate;
        // pmset -g batt
        let output = Utils.runCommand(cmd: "/usr/bin/pmset", args: "-g", "batt").output
        
        // Find string with format 1:23
        let matches = Utils.matches(for: "[0-9]+:[0-9]+", in: output[1])
        if matches.count > 0 {
            remain = matches[0]
        }
        
        // Add different emoji to distinguish different mode
        if output.joined().contains("discharg") {
            remain += "🔋"
        } else {
            remain += "⚡️"
        }
        
        return remain
    }
    
    /// Get more detailed information like design/max capacity, cycle count and an estimated battery health.
    /// All data are from ioreg command
    func getDetailedBatteryInfo() -> String {
        // Get output from ioreg -brc AppleSmartBattery
        let output = Utils.runCommand(cmd: "/usr/sbin/ioreg", args: "-brc", "AppleSmartBattery").output.joined(separator: "\n")
        
        let matches = Utils.matches(for: "\"(.*?)\" = (.*)", in: output)
        var finalOutput = ""
        for m in matches {
            
        }
        
        return finalOutput
    }
    
}