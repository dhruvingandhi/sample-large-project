# Antigravity modified: branch dg-3
# Explore: explore_0065
# Auto-generated LookML Explore File

include: "/views/domain_46/view_00196.view.lkml"
include: "/views/domain_48/view_00198.view.lkml"
include: "/views/domain_49/view_00199.view.lkml"
include: "/views/domain_50/view_00200.view.lkml"

explore: explore_0065 {
  label: "Explore Explore 0065"
  description: "Comprehensive analytics explore joining base view_00196 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_00196
  
  always_filter: {
    filters: [view_00196.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00196.created_at_date: "7 days"]
    unless: [view_00196.id, view_00196.status]
  }

  join: view_00198 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00196.user_id} = ${view_00198.id} ;;
    required_joins: []
  }

  join: view_00199 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00196.account_id} = ${view_00199.account_id} ;;
    required_joins: [view_00198]
  }

  join: view_00200 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00196.category} = ${view_00200.category} ;;
  }

  access_filter: {
    field: view_00196.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00196.is_deleted} = false ;;
}
