# Explore: explore_0275
# Auto-generated LookML Explore File

include: "/views/domain_26/view_00826.view.lkml"
include: "/views/domain_28/view_00828.view.lkml"
include: "/views/domain_29/view_00829.view.lkml"
include: "/views/domain_30/view_00830.view.lkml"

explore: explore_0275 {
  label: "Explore Explore 0275"
  description: "Comprehensive analytics explore joining base view_00826 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_00826
  
  always_filter: {
    filters: [view_00826.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00826.created_at_date: "7 days"]
    unless: [view_00826.id, view_00826.status]
  }

  join: view_00828 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00826.user_id} = ${view_00828.id} ;;
    required_joins: []
  }

  join: view_00829 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00826.account_id} = ${view_00829.account_id} ;;
    required_joins: [view_00828]
  }

  join: view_00830 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00826.category} = ${view_00830.category} ;;
  }

  access_filter: {
    field: view_00826.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00826.is_deleted} = false ;;
}
