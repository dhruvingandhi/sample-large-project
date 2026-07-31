# Antigravity modified: branch dg-3
# Explore: explore_0125
# Auto-generated LookML Explore File

include: "/views/domain_26/view_00376.view.lkml"
include: "/views/domain_28/view_00378.view.lkml"
include: "/views/domain_29/view_00379.view.lkml"
include: "/views/domain_30/view_00380.view.lkml"

explore: explore_0125 {
  label: "Explore Explore 0125"
  description: "Comprehensive analytics explore joining base view_00376 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_00376
  
  always_filter: {
    filters: [view_00376.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00376.created_at_date: "7 days"]
    unless: [view_00376.id, view_00376.status]
  }

  join: view_00378 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00376.user_id} = ${view_00378.id} ;;
    required_joins: []
  }

  join: view_00379 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00376.account_id} = ${view_00379.account_id} ;;
    required_joins: [view_00378]
  }

  join: view_00380 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00376.category} = ${view_00380.category} ;;
  }

  access_filter: {
    field: view_00376.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00376.is_deleted} = false ;;
}
