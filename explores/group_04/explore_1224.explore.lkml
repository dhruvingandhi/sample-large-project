# Explore: explore_1224
# Auto-generated LookML Explore File

include: "/views/domain_23/view_03673.view.lkml"
include: "/views/domain_25/view_03675.view.lkml"
include: "/views/domain_26/view_03676.view.lkml"
include: "/views/domain_27/view_03677.view.lkml"

explore: explore_1224 {
  label: "Explore Explore 1224"
  description: "Comprehensive analytics explore joining base view_03673 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_03673
  
  always_filter: {
    filters: [view_03673.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03673.created_at_date: "7 days"]
    unless: [view_03673.id, view_03673.status]
  }

  join: view_03675 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03673.user_id} = ${view_03675.id} ;;
    required_joins: []
  }

  join: view_03676 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03673.account_id} = ${view_03676.account_id} ;;
    required_joins: [view_03675]
  }

  join: view_03677 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03673.category} = ${view_03677.category} ;;
  }

  access_filter: {
    field: view_03673.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03673.is_deleted} = false ;;
}
