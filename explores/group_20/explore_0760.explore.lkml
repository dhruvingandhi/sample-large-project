# Explore: explore_0760
# Auto-generated LookML Explore File

include: "/views/domain_31/view_02281.view.lkml"
include: "/views/domain_33/view_02283.view.lkml"
include: "/views/domain_34/view_02284.view.lkml"
include: "/views/domain_35/view_02285.view.lkml"

explore: explore_0760 {
  label: "Explore Explore 0760"
  description: "Comprehensive analytics explore joining base view_02281 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_02281
  
  always_filter: {
    filters: [view_02281.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02281.created_at_date: "7 days"]
    unless: [view_02281.id, view_02281.status]
  }

  join: view_02283 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02281.user_id} = ${view_02283.id} ;;
    required_joins: []
  }

  join: view_02284 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02281.account_id} = ${view_02284.account_id} ;;
    required_joins: [view_02283]
  }

  join: view_02285 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02281.category} = ${view_02285.category} ;;
  }

  access_filter: {
    field: view_02281.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02281.is_deleted} = false ;;
}
