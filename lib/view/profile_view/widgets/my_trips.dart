import 'package:flutter/material.dart';

import '../../../resources/button/appbar.dart';


enum TripStatus { completed, cancelled, ongoing }

class Trip {
  final String from;
  final String to;
  final TripStatus status;
  final String date;
  final double? distanceKm;
  final double? fareINR;

  const Trip({
    required this.from,
    required this.to,
    required this.status,
    required this.date,
    this.distanceKm,
    this.fareINR,
  });
}

class MyTripView extends StatelessWidget {
  const MyTripView({super.key});

  static const List<Trip> _trips = [
    Trip(
      from: 'Patna Jn',
      to: 'AIIMS',
      status: TripStatus.completed,
      date: 'Today',
      distanceKm: 14.2,
      fareINR: 450,
    ),
    Trip(
      from: 'Boring Rd',
      to: 'Airport',
      status: TripStatus.completed,
      date: '4 May',
      distanceKm: 22.5,
      fareINR: 780,
    ),
    Trip(
      from: 'Gandhi Maidan',
      to: 'Danapur',
      status: TripStatus.cancelled,
      date: '2 May',
      distanceKm: null,
      fareINR: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitleBar(title: 'My Trips', onBack: () {
                Navigator.pop(context);
              },),
              const SizedBox(height: 4),
              const Divider(
                color: Color(0xFFD1D1D6),
                thickness: 0.5,
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.separated(
                  itemCount: _trips.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return TripCard(trip: _trips[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TripCard extends StatelessWidget {
  final Trip trip;

  const TripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Route line
                Row(
                  children: [
                    Text(
                      trip.from,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1C1C1E),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: Color(0xFF1C1C1E),
                      ),
                    ),
                    Text(
                      trip.to,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1C1C1E),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                // Meta line
                Text(
                  _buildMetaText(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF8E8E93),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          _StatusBadge(status: trip.status),
        ],
      ),
    );
  }

  String _buildMetaText() {
    final parts = <String>[trip.date];
    if (trip.distanceKm != null) {
      parts.add('${trip.distanceKm} km');
    }
    if (trip.fareINR != null) {
      final fare = trip.fareINR!.toInt();
      parts.add('₹$fare');
    } else {
      parts.add('—');
    }
    return parts.join(' · ');
  }
}

class _StatusBadge extends StatelessWidget {
  final TripStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final config = _badgeConfig(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: config.backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        config.label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: config.textColor,
        ),
      ),
    );
  }

  _BadgeConfig _badgeConfig(TripStatus status) {
    switch (status) {
      case TripStatus.completed:
        return _BadgeConfig(
          label: 'Completed',
          textColor: const Color(0xFF1A7A4A),
          backgroundColor: const Color(0xFFE3F5EC),
        );
      case TripStatus.cancelled:
        return _BadgeConfig(
          label: 'Cancelled',
          textColor: const Color(0xFFC0392B),
          backgroundColor: const Color(0xFFFBE9E7),
        );
      case TripStatus.ongoing:
        return _BadgeConfig(
          label: 'Ongoing',
          textColor: const Color(0xFF1A5CA8),
          backgroundColor: const Color(0xFFE3EEFE),
        );
    }
  }
}

class _BadgeConfig {
  final String label;
  final Color textColor;
  final Color backgroundColor;

  const _BadgeConfig({
    required this.label,
    required this.textColor,
    required this.backgroundColor,
  });
}