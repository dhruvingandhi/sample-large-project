# Explore: explore_0285
# Auto-generated LookML Explore File

include: "/views/domain_06/view_00856.view.lkml"
include: "/views/domain_08/view_00858.view.lkml"
include: "/views/domain_09/view_00859.view.lkml"
include: "/views/domain_10/view_00860.view.lkml"

explore: explore_0285 {
  label: "Explore Explore 0285"
  description: "Comprehensive analytics explore joining base view_00856 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_00856
  
  always_filter: {
    filters: [view_00856.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00856.created_at_date: "7 days"]
    unless: [view_00856.id, view_00856.status]
  }

  join: view_00858 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00856.user_id} = ${view_00858.id} ;;
    required_joins: []
  }

  join: view_00859 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00856.account_id} = ${view_00859.account_id} ;;
    required_joins: [view_00858]
  }

  join: view_00860 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00856.category} = ${view_00860.category} ;;
  }

  access_filter: {
    field: view_00856.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00856.is_deleted} = false ;;
}
