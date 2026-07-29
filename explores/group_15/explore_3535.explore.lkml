# Explore: explore_3535
# Auto-generated LookML Explore File

include: "/views/domain_06/view_10606.view.lkml"
include: "/views/domain_08/view_10608.view.lkml"
include: "/views/domain_09/view_10609.view.lkml"
include: "/views/domain_10/view_10610.view.lkml"

explore: explore_3535 {
  label: "Explore Explore 3535"
  description: "Comprehensive analytics explore joining base view_10606 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_10606
  
  always_filter: {
    filters: [view_10606.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10606.created_at_date: "7 days"]
    unless: [view_10606.id, view_10606.status]
  }

  join: view_10608 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10606.user_id} = ${view_10608.id} ;;
    required_joins: []
  }

  join: view_10609 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10606.account_id} = ${view_10609.account_id} ;;
    required_joins: [view_10608]
  }

  join: view_10610 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10606.category} = ${view_10610.category} ;;
  }

  access_filter: {
    field: view_10606.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10606.is_deleted} = false ;;
}
