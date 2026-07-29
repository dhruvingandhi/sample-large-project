# Explore: explore_3289
# Auto-generated LookML Explore File

include: "/views/domain_18/view_09868.view.lkml"
include: "/views/domain_20/view_09870.view.lkml"
include: "/views/domain_21/view_09871.view.lkml"
include: "/views/domain_22/view_09872.view.lkml"

explore: explore_3289 {
  label: "Explore Explore 3289"
  description: "Comprehensive analytics explore joining base view_09868 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_09868
  
  always_filter: {
    filters: [view_09868.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09868.created_at_date: "7 days"]
    unless: [view_09868.id, view_09868.status]
  }

  join: view_09870 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09868.user_id} = ${view_09870.id} ;;
    required_joins: []
  }

  join: view_09871 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09868.account_id} = ${view_09871.account_id} ;;
    required_joins: [view_09870]
  }

  join: view_09872 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09868.category} = ${view_09872.category} ;;
  }

  access_filter: {
    field: view_09868.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09868.is_deleted} = false ;;
}
