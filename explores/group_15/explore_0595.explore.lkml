# Explore: explore_0595
# Auto-generated LookML Explore File

include: "/views/domain_36/view_01786.view.lkml"
include: "/views/domain_38/view_01788.view.lkml"
include: "/views/domain_39/view_01789.view.lkml"
include: "/views/domain_40/view_01790.view.lkml"

explore: explore_0595 {
  label: "Explore Explore 0595"
  description: "Comprehensive analytics explore joining base view_01786 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_01786
  
  always_filter: {
    filters: [view_01786.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01786.created_at_date: "7 days"]
    unless: [view_01786.id, view_01786.status]
  }

  join: view_01788 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01786.user_id} = ${view_01788.id} ;;
    required_joins: []
  }

  join: view_01789 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01786.account_id} = ${view_01789.account_id} ;;
    required_joins: [view_01788]
  }

  join: view_01790 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01786.category} = ${view_01790.category} ;;
  }

  access_filter: {
    field: view_01786.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01786.is_deleted} = false ;;
}
