# Antigravity modified: branch dg-3
# Explore: explore_1065
# Auto-generated LookML Explore File

include: "/views/domain_46/view_03196.view.lkml"
include: "/views/domain_48/view_03198.view.lkml"
include: "/views/domain_49/view_03199.view.lkml"
include: "/views/domain_50/view_03200.view.lkml"

explore: explore_1065 {
  label: "Explore Explore 1065"
  description: "Comprehensive analytics explore joining base view_03196 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_03196
  
  always_filter: {
    filters: [view_03196.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03196.created_at_date: "7 days"]
    unless: [view_03196.id, view_03196.status]
  }

  join: view_03198 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03196.user_id} = ${view_03198.id} ;;
    required_joins: []
  }

  join: view_03199 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03196.account_id} = ${view_03199.account_id} ;;
    required_joins: [view_03198]
  }

  join: view_03200 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03196.category} = ${view_03200.category} ;;
  }

  access_filter: {
    field: view_03196.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03196.is_deleted} = false ;;
}
