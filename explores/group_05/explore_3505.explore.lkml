# Update for 500 file diff target
# Explore: explore_3505
# Auto-generated LookML Explore File

include: "/views/domain_16/view_10516.view.lkml"
include: "/views/domain_18/view_10518.view.lkml"
include: "/views/domain_19/view_10519.view.lkml"
include: "/views/domain_20/view_10520.view.lkml"

explore: explore_3505 {
  label: "Explore Explore 3505"
  description: "Comprehensive analytics explore joining base view_10516 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_10516
  
  always_filter: {
    filters: [view_10516.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10516.created_at_date: "7 days"]
    unless: [view_10516.id, view_10516.status]
  }

  join: view_10518 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10516.user_id} = ${view_10518.id} ;;
    required_joins: []
  }

  join: view_10519 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10516.account_id} = ${view_10519.account_id} ;;
    required_joins: [view_10518]
  }

  join: view_10520 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10516.category} = ${view_10520.category} ;;
  }

  access_filter: {
    field: view_10516.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10516.is_deleted} = false ;;
}
