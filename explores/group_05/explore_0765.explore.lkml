# Antigravity modified: branch dg-3
# Explore: explore_0765
# Auto-generated LookML Explore File

include: "/views/domain_46/view_02296.view.lkml"
include: "/views/domain_48/view_02298.view.lkml"
include: "/views/domain_49/view_02299.view.lkml"
include: "/views/domain_50/view_02300.view.lkml"

explore: explore_0765 {
  label: "Explore Explore 0765"
  description: "Comprehensive analytics explore joining base view_02296 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_02296
  
  always_filter: {
    filters: [view_02296.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02296.created_at_date: "7 days"]
    unless: [view_02296.id, view_02296.status]
  }

  join: view_02298 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02296.user_id} = ${view_02298.id} ;;
    required_joins: []
  }

  join: view_02299 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02296.account_id} = ${view_02299.account_id} ;;
    required_joins: [view_02298]
  }

  join: view_02300 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02296.category} = ${view_02300.category} ;;
  }

  access_filter: {
    field: view_02296.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02296.is_deleted} = false ;;
}
