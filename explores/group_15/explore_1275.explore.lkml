# Explore: explore_1275
# Auto-generated LookML Explore File

include: "/views/domain_26/view_03826.view.lkml"
include: "/views/domain_28/view_03828.view.lkml"
include: "/views/domain_29/view_03829.view.lkml"
include: "/views/domain_30/view_03830.view.lkml"

explore: explore_1275 {
  label: "Explore Explore 1275"
  description: "Comprehensive analytics explore joining base view_03826 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_03826
  
  always_filter: {
    filters: [view_03826.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03826.created_at_date: "7 days"]
    unless: [view_03826.id, view_03826.status]
  }

  join: view_03828 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03826.user_id} = ${view_03828.id} ;;
    required_joins: []
  }

  join: view_03829 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03826.account_id} = ${view_03829.account_id} ;;
    required_joins: [view_03828]
  }

  join: view_03830 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03826.category} = ${view_03830.category} ;;
  }

  access_filter: {
    field: view_03826.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03826.is_deleted} = false ;;
}
