# Explore: explore_3084
# Auto-generated LookML Explore File

include: "/views/domain_03/view_09253.view.lkml"
include: "/views/domain_05/view_09255.view.lkml"
include: "/views/domain_06/view_09256.view.lkml"
include: "/views/domain_07/view_09257.view.lkml"

explore: explore_3084 {
  label: "Explore Explore 3084"
  description: "Comprehensive analytics explore joining base view_09253 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_09253
  
  always_filter: {
    filters: [view_09253.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09253.created_at_date: "7 days"]
    unless: [view_09253.id, view_09253.status]
  }

  join: view_09255 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09253.user_id} = ${view_09255.id} ;;
    required_joins: []
  }

  join: view_09256 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09253.account_id} = ${view_09256.account_id} ;;
    required_joins: [view_09255]
  }

  join: view_09257 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09253.category} = ${view_09257.category} ;;
  }

  access_filter: {
    field: view_09253.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09253.is_deleted} = false ;;
}
