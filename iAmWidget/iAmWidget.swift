//
//  iAmWidget.swift
//  iAmWidget
//
//  Created by Alfadli Maulana Siddik on 17/07/24.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), moods: Mood.allCases)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), moods: Mood.allCases)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        return Timeline(entries: [SimpleEntry(date: Date(), moods: Mood.allCases)], policy: .never)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let moods: [Mood]
}

struct iAmWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Mood")
            HStack {
                ForEach(entry.moods, id: \.self) { mood in
                    Link(destination: URL(string: "testNotes://createNotes/\(mood)")!) {
                        Image(mood.image)
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
        }
        .padding()
    }
}

struct iAmWidget: Widget {
    let kind: String = "iAmWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, provider: Provider()) { entry in
            iAmWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemMedium])
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    iAmWidget()
} timeline: {
    SimpleEntry(date: .now, moods: Mood.allCases)
}
