# Explore: explore_0535
# Auto-generated LookML Explore File

include: "/views/domain_06/view_01606.view.lkml"
include: "/views/domain_08/view_01608.view.lkml"
include: "/views/domain_09/view_01609.view.lkml"
include: "/views/domain_10/view_01610.view.lkml"

explore: explore_0535 {
  label: "Explore Explore 0535"
  description: "Comprehensive analytics explore joining base view_01606 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_01606
  
  always_filter: {
    filters: [view_01606.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01606.created_at_date: "7 days"]
    unless: [view_01606.id, view_01606.status]
  }

  join: view_01608 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01606.user_id} = ${view_01608.id} ;;
    required_joins: []
  }

  join: view_01609 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01606.account_id} = ${view_01609.account_id} ;;
    required_joins: [view_01608]
  }

  join: view_01610 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01606.category} = ${view_01610.category} ;;
  }

  access_filter: {
    field: view_01606.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01606.is_deleted} = false ;;
}
