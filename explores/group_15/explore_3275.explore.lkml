# Explore: explore_3275
# Auto-generated LookML Explore File

include: "/views/domain_26/view_09826.view.lkml"
include: "/views/domain_28/view_09828.view.lkml"
include: "/views/domain_29/view_09829.view.lkml"
include: "/views/domain_30/view_09830.view.lkml"

explore: explore_3275 {
  label: "Explore Explore 3275"
  description: "Comprehensive analytics explore joining base view_09826 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_09826
  
  always_filter: {
    filters: [view_09826.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09826.created_at_date: "7 days"]
    unless: [view_09826.id, view_09826.status]
  }

  join: view_09828 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09826.user_id} = ${view_09828.id} ;;
    required_joins: []
  }

  join: view_09829 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09826.account_id} = ${view_09829.account_id} ;;
    required_joins: [view_09828]
  }

  join: view_09830 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09826.category} = ${view_09830.category} ;;
  }

  access_filter: {
    field: view_09826.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09826.is_deleted} = false ;;
}
