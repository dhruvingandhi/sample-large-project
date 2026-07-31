# Update for 2000 file diff target
# Explore: explore_0110
# Auto-generated LookML Explore File

include: "/views/domain_31/view_00331.view.lkml"
include: "/views/domain_33/view_00333.view.lkml"
include: "/views/domain_34/view_00334.view.lkml"
include: "/views/domain_35/view_00335.view.lkml"

explore: explore_0110 {
  label: "Explore Explore 0110"
  description: "Comprehensive analytics explore joining base view_00331 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_00331
  
  always_filter: {
    filters: [view_00331.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00331.created_at_date: "7 days"]
    unless: [view_00331.id, view_00331.status]
  }

  join: view_00333 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00331.user_id} = ${view_00333.id} ;;
    required_joins: []
  }

  join: view_00334 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00331.account_id} = ${view_00334.account_id} ;;
    required_joins: [view_00333]
  }

  join: view_00335 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00331.category} = ${view_00335.category} ;;
  }

  access_filter: {
    field: view_00331.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00331.is_deleted} = false ;;
}
