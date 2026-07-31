# Update for 2000 file diff target
# Explore: explore_2760
# Auto-generated LookML Explore File

include: "/views/domain_31/view_08281.view.lkml"
include: "/views/domain_33/view_08283.view.lkml"
include: "/views/domain_34/view_08284.view.lkml"
include: "/views/domain_35/view_08285.view.lkml"

explore: explore_2760 {
  label: "Explore Explore 2760"
  description: "Comprehensive analytics explore joining base view_08281 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_08281
  
  always_filter: {
    filters: [view_08281.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08281.created_at_date: "7 days"]
    unless: [view_08281.id, view_08281.status]
  }

  join: view_08283 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08281.user_id} = ${view_08283.id} ;;
    required_joins: []
  }

  join: view_08284 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08281.account_id} = ${view_08284.account_id} ;;
    required_joins: [view_08283]
  }

  join: view_08285 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08281.category} = ${view_08285.category} ;;
  }

  access_filter: {
    field: view_08281.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08281.is_deleted} = false ;;
}
