# Explore: explore_2159
# Auto-generated LookML Explore File

include: "/views/domain_28/view_06478.view.lkml"
include: "/views/domain_30/view_06480.view.lkml"
include: "/views/domain_31/view_06481.view.lkml"
include: "/views/domain_32/view_06482.view.lkml"

explore: explore_2159 {
  label: "Explore Explore 2159"
  description: "Comprehensive analytics explore joining base view_06478 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_06478
  
  always_filter: {
    filters: [view_06478.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06478.created_at_date: "7 days"]
    unless: [view_06478.id, view_06478.status]
  }

  join: view_06480 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06478.user_id} = ${view_06480.id} ;;
    required_joins: []
  }

  join: view_06481 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06478.account_id} = ${view_06481.account_id} ;;
    required_joins: [view_06480]
  }

  join: view_06482 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06478.category} = ${view_06482.category} ;;
  }

  access_filter: {
    field: view_06478.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06478.is_deleted} = false ;;
}
