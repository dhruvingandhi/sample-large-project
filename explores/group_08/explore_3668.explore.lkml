# Explore: explore_3668
# Auto-generated LookML Explore File

include: "/views/domain_05/view_11005.view.lkml"
include: "/views/domain_07/view_11007.view.lkml"
include: "/views/domain_08/view_11008.view.lkml"
include: "/views/domain_09/view_11009.view.lkml"

explore: explore_3668 {
  label: "Explore Explore 3668"
  description: "Comprehensive analytics explore joining base view_11005 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_11005
  
  always_filter: {
    filters: [view_11005.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11005.created_at_date: "7 days"]
    unless: [view_11005.id, view_11005.status]
  }

  join: view_11007 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11005.user_id} = ${view_11007.id} ;;
    required_joins: []
  }

  join: view_11008 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11005.account_id} = ${view_11008.account_id} ;;
    required_joins: [view_11007]
  }

  join: view_11009 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11005.category} = ${view_11009.category} ;;
  }

  access_filter: {
    field: view_11005.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11005.is_deleted} = false ;;
}
