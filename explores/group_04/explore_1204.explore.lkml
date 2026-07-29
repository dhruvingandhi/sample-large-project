# Explore: explore_1204
# Auto-generated LookML Explore File

include: "/views/domain_13/view_03613.view.lkml"
include: "/views/domain_15/view_03615.view.lkml"
include: "/views/domain_16/view_03616.view.lkml"
include: "/views/domain_17/view_03617.view.lkml"

explore: explore_1204 {
  label: "Explore Explore 1204"
  description: "Comprehensive analytics explore joining base view_03613 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_03613
  
  always_filter: {
    filters: [view_03613.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03613.created_at_date: "7 days"]
    unless: [view_03613.id, view_03613.status]
  }

  join: view_03615 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03613.user_id} = ${view_03615.id} ;;
    required_joins: []
  }

  join: view_03616 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03613.account_id} = ${view_03616.account_id} ;;
    required_joins: [view_03615]
  }

  join: view_03617 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03613.category} = ${view_03617.category} ;;
  }

  access_filter: {
    field: view_03613.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03613.is_deleted} = false ;;
}
