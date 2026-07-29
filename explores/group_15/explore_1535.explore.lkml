# Explore: explore_1535
# Auto-generated LookML Explore File

include: "/views/domain_06/view_04606.view.lkml"
include: "/views/domain_08/view_04608.view.lkml"
include: "/views/domain_09/view_04609.view.lkml"
include: "/views/domain_10/view_04610.view.lkml"

explore: explore_1535 {
  label: "Explore Explore 1535"
  description: "Comprehensive analytics explore joining base view_04606 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_04606
  
  always_filter: {
    filters: [view_04606.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04606.created_at_date: "7 days"]
    unless: [view_04606.id, view_04606.status]
  }

  join: view_04608 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04606.user_id} = ${view_04608.id} ;;
    required_joins: []
  }

  join: view_04609 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04606.account_id} = ${view_04609.account_id} ;;
    required_joins: [view_04608]
  }

  join: view_04610 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04606.category} = ${view_04610.category} ;;
  }

  access_filter: {
    field: view_04606.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04606.is_deleted} = false ;;
}
