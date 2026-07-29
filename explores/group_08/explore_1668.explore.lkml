# Explore: explore_1668
# Auto-generated LookML Explore File

include: "/views/domain_05/view_05005.view.lkml"
include: "/views/domain_07/view_05007.view.lkml"
include: "/views/domain_08/view_05008.view.lkml"
include: "/views/domain_09/view_05009.view.lkml"

explore: explore_1668 {
  label: "Explore Explore 1668"
  description: "Comprehensive analytics explore joining base view_05005 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_05005
  
  always_filter: {
    filters: [view_05005.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05005.created_at_date: "7 days"]
    unless: [view_05005.id, view_05005.status]
  }

  join: view_05007 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05005.user_id} = ${view_05007.id} ;;
    required_joins: []
  }

  join: view_05008 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05005.account_id} = ${view_05008.account_id} ;;
    required_joins: [view_05007]
  }

  join: view_05009 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05005.category} = ${view_05009.category} ;;
  }

  access_filter: {
    field: view_05005.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05005.is_deleted} = false ;;
}
