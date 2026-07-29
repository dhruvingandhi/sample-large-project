# Explore: explore_1222
# Auto-generated LookML Explore File

include: "/views/domain_17/view_03667.view.lkml"
include: "/views/domain_19/view_03669.view.lkml"
include: "/views/domain_20/view_03670.view.lkml"
include: "/views/domain_21/view_03671.view.lkml"

explore: explore_1222 {
  label: "Explore Explore 1222"
  description: "Comprehensive analytics explore joining base view_03667 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_03667
  
  always_filter: {
    filters: [view_03667.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03667.created_at_date: "7 days"]
    unless: [view_03667.id, view_03667.status]
  }

  join: view_03669 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03667.user_id} = ${view_03669.id} ;;
    required_joins: []
  }

  join: view_03670 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03667.account_id} = ${view_03670.account_id} ;;
    required_joins: [view_03669]
  }

  join: view_03671 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03667.category} = ${view_03671.category} ;;
  }

  access_filter: {
    field: view_03667.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03667.is_deleted} = false ;;
}
