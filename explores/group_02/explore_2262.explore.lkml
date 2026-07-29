# Explore: explore_2262
# Auto-generated LookML Explore File

include: "/views/domain_37/view_06787.view.lkml"
include: "/views/domain_39/view_06789.view.lkml"
include: "/views/domain_40/view_06790.view.lkml"
include: "/views/domain_41/view_06791.view.lkml"

explore: explore_2262 {
  label: "Explore Explore 2262"
  description: "Comprehensive analytics explore joining base view_06787 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_06787
  
  always_filter: {
    filters: [view_06787.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06787.created_at_date: "7 days"]
    unless: [view_06787.id, view_06787.status]
  }

  join: view_06789 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06787.user_id} = ${view_06789.id} ;;
    required_joins: []
  }

  join: view_06790 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06787.account_id} = ${view_06790.account_id} ;;
    required_joins: [view_06789]
  }

  join: view_06791 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06787.category} = ${view_06791.category} ;;
  }

  access_filter: {
    field: view_06787.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06787.is_deleted} = false ;;
}
