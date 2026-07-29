# Explore: explore_0909
# Auto-generated LookML Explore File

include: "/views/domain_28/view_02728.view.lkml"
include: "/views/domain_30/view_02730.view.lkml"
include: "/views/domain_31/view_02731.view.lkml"
include: "/views/domain_32/view_02732.view.lkml"

explore: explore_0909 {
  label: "Explore Explore 0909"
  description: "Comprehensive analytics explore joining base view_02728 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_02728
  
  always_filter: {
    filters: [view_02728.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02728.created_at_date: "7 days"]
    unless: [view_02728.id, view_02728.status]
  }

  join: view_02730 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02728.user_id} = ${view_02730.id} ;;
    required_joins: []
  }

  join: view_02731 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02728.account_id} = ${view_02731.account_id} ;;
    required_joins: [view_02730]
  }

  join: view_02732 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02728.category} = ${view_02732.category} ;;
  }

  access_filter: {
    field: view_02728.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02728.is_deleted} = false ;;
}
