# Explore: explore_0334
# Auto-generated LookML Explore File

include: "/views/domain_03/view_01003.view.lkml"
include: "/views/domain_05/view_01005.view.lkml"
include: "/views/domain_06/view_01006.view.lkml"
include: "/views/domain_07/view_01007.view.lkml"

explore: explore_0334 {
  label: "Explore Explore 0334"
  description: "Comprehensive analytics explore joining base view_01003 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_01003
  
  always_filter: {
    filters: [view_01003.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01003.created_at_date: "7 days"]
    unless: [view_01003.id, view_01003.status]
  }

  join: view_01005 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01003.user_id} = ${view_01005.id} ;;
    required_joins: []
  }

  join: view_01006 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01003.account_id} = ${view_01006.account_id} ;;
    required_joins: [view_01005]
  }

  join: view_01007 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01003.category} = ${view_01007.category} ;;
  }

  access_filter: {
    field: view_01003.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01003.is_deleted} = false ;;
}
