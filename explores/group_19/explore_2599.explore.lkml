# Explore: explore_2599
# Auto-generated LookML Explore File

include: "/views/domain_48/view_07798.view.lkml"
include: "/views/domain_50/view_07800.view.lkml"
include: "/views/domain_01/view_07801.view.lkml"
include: "/views/domain_02/view_07802.view.lkml"

explore: explore_2599 {
  label: "Explore Explore 2599"
  description: "Comprehensive analytics explore joining base view_07798 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_07798
  
  always_filter: {
    filters: [view_07798.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07798.created_at_date: "7 days"]
    unless: [view_07798.id, view_07798.status]
  }

  join: view_07800 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07798.user_id} = ${view_07800.id} ;;
    required_joins: []
  }

  join: view_07801 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07798.account_id} = ${view_07801.account_id} ;;
    required_joins: [view_07800]
  }

  join: view_07802 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07798.category} = ${view_07802.category} ;;
  }

  access_filter: {
    field: view_07798.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07798.is_deleted} = false ;;
}
