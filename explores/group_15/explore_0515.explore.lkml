# Explore: explore_0515
# Auto-generated LookML Explore File

include: "/views/domain_46/view_01546.view.lkml"
include: "/views/domain_48/view_01548.view.lkml"
include: "/views/domain_49/view_01549.view.lkml"
include: "/views/domain_50/view_01550.view.lkml"

explore: explore_0515 {
  label: "Explore Explore 0515"
  description: "Comprehensive analytics explore joining base view_01546 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_01546
  
  always_filter: {
    filters: [view_01546.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01546.created_at_date: "7 days"]
    unless: [view_01546.id, view_01546.status]
  }

  join: view_01548 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01546.user_id} = ${view_01548.id} ;;
    required_joins: []
  }

  join: view_01549 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01546.account_id} = ${view_01549.account_id} ;;
    required_joins: [view_01548]
  }

  join: view_01550 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01546.category} = ${view_01550.category} ;;
  }

  access_filter: {
    field: view_01546.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01546.is_deleted} = false ;;
}
