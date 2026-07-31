# Update for 500 file diff target
# Explore: explore_3285
# Auto-generated LookML Explore File

include: "/views/domain_06/view_09856.view.lkml"
include: "/views/domain_08/view_09858.view.lkml"
include: "/views/domain_09/view_09859.view.lkml"
include: "/views/domain_10/view_09860.view.lkml"

explore: explore_3285 {
  label: "Explore Explore 3285"
  description: "Comprehensive analytics explore joining base view_09856 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_09856
  
  always_filter: {
    filters: [view_09856.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09856.created_at_date: "7 days"]
    unless: [view_09856.id, view_09856.status]
  }

  join: view_09858 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09856.user_id} = ${view_09858.id} ;;
    required_joins: []
  }

  join: view_09859 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09856.account_id} = ${view_09859.account_id} ;;
    required_joins: [view_09858]
  }

  join: view_09860 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09856.category} = ${view_09860.category} ;;
  }

  access_filter: {
    field: view_09856.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09856.is_deleted} = false ;;
}
