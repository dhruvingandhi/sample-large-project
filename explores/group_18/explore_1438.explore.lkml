# Update for 2000 file diff target
# Explore: explore_1438
# Auto-generated LookML Explore File

include: "/views/domain_15/view_04315.view.lkml"
include: "/views/domain_17/view_04317.view.lkml"
include: "/views/domain_18/view_04318.view.lkml"
include: "/views/domain_19/view_04319.view.lkml"

explore: explore_1438 {
  label: "Explore Explore 1438"
  description: "Comprehensive analytics explore joining base view_04315 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_04315
  
  always_filter: {
    filters: [view_04315.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04315.created_at_date: "7 days"]
    unless: [view_04315.id, view_04315.status]
  }

  join: view_04317 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04315.user_id} = ${view_04317.id} ;;
    required_joins: []
  }

  join: view_04318 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04315.account_id} = ${view_04318.account_id} ;;
    required_joins: [view_04317]
  }

  join: view_04319 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04315.category} = ${view_04319.category} ;;
  }

  access_filter: {
    field: view_04315.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04315.is_deleted} = false ;;
}
