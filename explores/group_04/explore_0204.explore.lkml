# Explore: explore_0204
# Auto-generated LookML Explore File

include: "/views/domain_13/view_00613.view.lkml"
include: "/views/domain_15/view_00615.view.lkml"
include: "/views/domain_16/view_00616.view.lkml"
include: "/views/domain_17/view_00617.view.lkml"

explore: explore_0204 {
  label: "Explore Explore 0204"
  description: "Comprehensive analytics explore joining base view_00613 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_00613
  
  always_filter: {
    filters: [view_00613.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00613.created_at_date: "7 days"]
    unless: [view_00613.id, view_00613.status]
  }

  join: view_00615 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00613.user_id} = ${view_00615.id} ;;
    required_joins: []
  }

  join: view_00616 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00613.account_id} = ${view_00616.account_id} ;;
    required_joins: [view_00615]
  }

  join: view_00617 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00613.category} = ${view_00617.category} ;;
  }

  access_filter: {
    field: view_00613.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00613.is_deleted} = false ;;
}
